#!/bin/bash
# Log subagent metrics after completion

METRICS_FILE="${HOME}/.openclaw/workspace/memory/subagent-metrics.jsonl"

# Args: model task duration status tokens
MODEL="${1:-unknown}"
TASK="${2:-unknown}"
DURATION="${3:-0}"
STATUS="${4:-unknown}"
TOKENS="${5:-0}"

TIMESTAMP=$(date -Iseconds)

LOG_ENTRY="{\"timestamp\":\"$TIMESTAMP\",\"model\":\"$MODEL\",\"task\":\"$TASK\",\"duration_seconds\":$DURATION,\"status\":\"$STATUS\",\"tokens\":$TOKENS}"

echo "$LOG_ENTRY" >> "$METRICS_FILE"

echo "Logged: $STATUS"
