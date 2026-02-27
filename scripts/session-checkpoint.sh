#!/bin/bash
#
# Session Checkpoint Manager
# Pattern from: fsxmemory (https://github.com/Foresigxt/foresigxt-cli-memory)
#
# Usage:
#   session-checkpoint.sh checkpoint [working_on] [focus] [blocked]
#   session-checkpoint.sh handoff [working_on] [completed] [blocked] [next]
#   session-checkpoint.sh recover [--clear]
#   session-checkpoint.sh status
#   session-checkpoint.sh auto
#

set -euo pipefail

SESSION_FILE="$HOME/.openclaw/workspace/memory/session-state.json"
TIMESTAMP=$(date -Iseconds)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Ensure file exists
init_file() {
  if [ ! -f "$SESSION_FILE" ]; then
    cat > "$SESSION_FILE" << 'EOF'
{
  "checkpoint": {
    "timestamp": null,
    "working_on": null,
    "focus": null,
    "blocked": null,
    "next_actions": [],
    "context_summary": null
  },
  "last_handoff": {
    "timestamp": null,
    "working_on": null,
    "completed": [],
    "blocked": null,
    "next": null,
    "feeling": null,
    "notes": null
  },
  "recovery": {
    "last_death_detected": null,
    "recovery_count": 0,
    "last_recovery": null
  },
  "session": {
    "started": null,
    "last_checkpoint": null,
    "checkpoint_count": 0,
    "auto_checkpoint_interval_min": 30
  },
  "_meta": {
    "created": "2026-02-25T00:20:00+01:00",
    "version": "1.0.0",
    "source": "fsxmemory pattern"
  }
}
EOF
    echo -e "${GREEN}Initialized session-state.json${NC}"
  fi
}

# Create checkpoint
checkpoint() {
  local working_on="${1:-}"
  local focus="${2:-}"
  local blocked="${3:-}"
  
  # Update checkpoint section
  local tmp_file=$(mktemp)
  jq --arg ts "$TIMESTAMP" \
     --arg wo "$working_on" \
     --arg f "$focus" \
     --arg b "$blocked" \
     '.checkpoint.timestamp = $ts |
      .checkpoint.working_on = $wo |
      .checkpoint.focus = $f |
      .checkpoint.blocked = $b |
      .session.last_checkpoint = $ts |
      .session.checkpoint_count += 1' \
     "$SESSION_FILE" > "$tmp_file" && mv "$tmp_file" "$SESSION_FILE"
  
  echo -e "${GREEN}✓ Checkpoint saved${NC}"
  echo -e "  Working on: ${BLUE}$working_on${NC}"
  [ -n "$focus" ] && echo -e "  Focus: ${BLUE}$focus${NC}"
  [ -n "$blocked" ] && echo -e "  Blocked: ${YELLOW}$blocked${NC}"
}

# Create handoff (end of session)
handoff() {
  local working_on="${1:-}"
  local completed="${2:-}"
  local blocked="${3:-}"
  local next="${4:-}"
  local feeling="${5:-}"
  
  local tmp_file=$(mktemp)
  jq --arg ts "$TIMESTAMP" \
     --arg wo "$working_on" \
     --arg c "$completed" \
     --arg b "$blocked" \
     --arg n "$next" \
     --arg f "$feeling" \
     '.last_handoff.timestamp = $ts |
      .last_handoff.working_on = $wo |
      .last_handoff.completed = ($c | split(",")) |
      .last_handoff.blocked = $b |
      .last_handoff.next = $n |
      .last_handoff.feeling = $f' \
     "$SESSION_FILE" > "$tmp_file" && mv "$tmp_file" "$SESSION_FILE"
  
  # Also save context checkpoint for full state restoration
  local ctx_script="$HOME/.openclaw/workspace/scripts/context-checkpoint.sh"
  if [ -x "$ctx_script" ]; then
    "$ctx_script" save "handoff-${TIMESTAMP:0:16}" > /dev/null 2>&1 || true
  fi
  
  echo -e "${GREEN}✓ Handoff saved${NC}"
  echo -e "  Working on: ${BLUE}$working_on${NC}"
  [ -n "$completed" ] && echo -e "  Completed: ${GREEN}$completed${NC}"
  [ -n "$blocked" ] && echo -e "  Blocked: ${YELLOW}$blocked${NC}"
  [ -n "$next" ] && echo -e "  Next: ${BLUE}$next${NC}"
}

# Recover from previous session
recover() {
  local clear="${1:-}"
  
  local last_ckpt=$(jq -r '.checkpoint.timestamp // empty' "$SESSION_FILE")
  local last_handoff=$(jq -r '.last_handoff.timestamp // empty' "$SESSION_FILE")
  local session_start=$(jq -r '.session.started // empty' "$SESSION_FILE")
  
  echo -e "${BLUE}═══ Session Recovery ═══${NC}"
  echo ""
  
  # Check for dirty death (no handoff before session ended)
  if [ -n "$last_ckpt" ] && [ -z "$last_handoff" ]; then
    echo -e "${YELLOW}⚠ Potential dirty death detected${NC}"
    echo -e "  Last checkpoint: $last_ckpt"
  fi
  
  # Show last checkpoint
  if [ -n "$last_ckpt" ]; then
    echo -e "${GREEN}Last Checkpoint:${NC}"
    echo -e "  Time: $last_ckpt"
    jq -r '.checkpoint | "  Working on: \(.working_on // "N/A")\n  Focus: \(.focus // "none")\n  Blocked: \(.blocked // "none")"' "$SESSION_FILE"
  fi
  
  echo ""
  
  # Show last handoff
  if [ -n "$last_handoff" ]; then
    echo -e "${GREEN}Last Handoff:${NC}"
    echo -e "  Time: $last_handoff"
    jq -r '.last_handoff | "  Working on: \(.working_on // "N/A")\n  Completed: \(.completed | join(", "))\n  Blocked: \(.blocked // "none")\n  Next: \(.next // "none")"' "$SESSION_FILE"
  fi
  
  # Clear if requested
  if [ "$clear" = "--clear" ]; then
    local tmp_file=$(mktemp)
    jq --arg ts "$TIMESTAMP" \
       '.recovery.last_death_detected = $ts |
        .recovery.recovery_count += 1 |
        .recovery.last_recovery = $ts |
        .checkpoint = {"timestamp": null, "working_on": null, "focus": null, "blocked": null, "next_actions": [], "context_summary": null}' \
       "$SESSION_FILE" > "$tmp_file" && mv "$tmp_file" "$SESSION_FILE"
    echo ""
    echo -e "${GREEN}✓ Checkpoint cleared, recovery logged${NC}"
  fi
  
  # Auto-restore context checkpoint on recovery
  echo ""
  echo -e "${BLUE}═══ Context Checkpoint Restore ═══${NC}"
  local ctx_script="$HOME/.openclaw/workspace/scripts/context-checkpoint.sh"
  if [ -x "$ctx_script" ]; then
    # Try to restore latest checkpoint
    if "$ctx_script" restore "auto" 2>/dev/null; then
      echo -e "${GREEN}✓ Context restored from checkpoint${NC}"
    else
      echo "No context checkpoint to restore (or restore failed)"
    fi
  fi
}

# Show status
status() {
  echo -e "${BLUE}═══ Session State ═══${NC}"
  echo ""
  
  local checkpoint_count=$(jq -r '.session.checkpoint_count // 0' "$SESSION_FILE")
  local last_ckpt=$(jq -r '.session.last_checkpoint // "never"' "$SESSION_FILE")
  local recovery_count=$(jq -r '.recovery.recovery_count // 0' "$SESSION_FILE")
  
  echo -e "Checkpoints: ${GREEN}$checkpoint_count${NC}"
  echo -e "Last checkpoint: $last_ckpt"
  echo -e "Recoveries: ${YELLOW}$recovery_count${NC}"
  echo ""
  
  # Current checkpoint
  local working_on=$(jq -r '.checkpoint.working_on // empty' "$SESSION_FILE")
  if [ -n "$working_on" ]; then
    echo -e "${GREEN}Current Work:${NC}"
    echo -e "  $working_on"
    jq -r '.checkpoint | "  Focus: \(.focus // "none")\n  Blocked: \(.blocked // "none")"' "$SESSION_FILE"
  fi
}

# Auto-checkpoint (called by heartbeat)
auto_checkpoint() {
  local last_ckpt=$(jq -r '.session.last_checkpoint // empty' "$SESSION_FILE")
  local interval=$(jq -r '.session.auto_checkpoint_interval_min // 30' "$SESSION_FILE")
  
  if [ -z "$last_ckpt" ]; then
    # First checkpoint
    checkpoint "auto" "" ""
    return
  fi
  
  # Check if enough time has passed
  local last_epoch=$(date -d "$last_ckpt" +%s 2>/dev/null || echo 0)
  local now_epoch=$(date +%s)
  local diff_min=$(( (now_epoch - last_epoch) / 60 ))
  
  if [ "$diff_min" -ge "$interval" ]; then
    # Auto-checkpoint with current state
    local working_on=$(jq -r '.checkpoint.working_on // "auto"' "$SESSION_FILE")
    local focus=$(jq -r '.checkpoint.focus // ""' "$SESSION_FILE")
    local blocked=$(jq -r '.checkpoint.blocked // ""' "$SESSION_FILE")
    checkpoint "$working_on" "$focus" "$blocked"
  fi
}

# Mark session start
session_start() {
  local tmp_file=$(mktemp)
  jq --arg ts "$TIMESTAMP" \
     '.session.started = $ts' \
     "$SESSION_FILE" > "$tmp_file" && mv "$tmp_file" "$SESSION_FILE"
}

# Main
main() {
  init_file
  
  case "${1:-status}" in
    checkpoint)
      checkpoint "${2:-}" "${3:-}" "${4:-}"
      ;;
    handoff)
      handoff "${2:-}" "${3:-}" "${4:-}" "${5:-}" "${6:-}"
      ;;
    recover)
      recover "${2:-}"
      ;;
    status)
      status
      ;;
    auto)
      auto_checkpoint
      ;;
    start)
      session_start
      ;;
    *)
      echo "Usage: $0 {checkpoint|handoff|recover|status|auto|start}"
      echo ""
      echo "Commands:"
      echo "  checkpoint [working_on] [focus] [blocked]  - Save current state"
      echo "  handoff [working_on] [completed] [blocked] [next] [feeling] - End session"
      echo "  recover [--clear]                          - Show last state, optionally clear"
      echo "  status                                     - Show session stats"
      echo "  auto                                       - Auto-checkpoint if interval passed"
      echo "  start                                      - Mark session start"
      ;;
  esac
}

main "$@"
