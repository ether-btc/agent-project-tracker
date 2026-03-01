# PROJECT: Smart Subagent Monitor

**Created:** 2026-03-01 | **Priority:** MEDIUM | **Status:** ACTIVE

---

## 🎯 Objective

Design and implement an economical subagent monitoring system that:
1. Activates only during project activity (not constant polling)
2. Minimizes LLM token usage
3. Detects stuck subagents efficiently

---

## 🔍 Current State

**Problem:** Cron job runs every 5 min = 288 calls/day = token waste when idle

**Current solution:** Full cron job with LLM check

---

## 📋 Design Requirements

### Trigger-Based vs Polling

| Approach | Pros | Cons |
|---------|------|------|
| Polling (current) | Always ready | Wastes tokens |
| Trigger-based | Only when needed | Must detect need |
| Hybrid | Light poll + trigger | More complex |

### Trigger Ideas

1. **Project mode activation** — When PROJECT-*.md created/updated
2. **Subagent spawn** — Monitor newly spawned agents
3. **Activity-based** — After user message, check subagents
4. **Manual trigger** — `/monitor` command

### Token-Efficient Detection

- Use shell commands (`ps`, `pgrep`) NOT LLM for basic checks
- LLM only when stuck detected
- Exponential backoff: check every 30s → 1m → 5m

---

## 🔬 Research

### External Patterns
- [ ] Check OpenClaw docs for native hooks
- [ ] Look for "subagent spawned" events
- [ ] Research low-cost monitoring patterns

### Internal Implementation
- [ ] Detect project mode activation
- [ ] Track subagent spawn times
- [ ] Shell-based health check (no LLM)
- [ ] Escalate to LLM only when needed

---

## 🛠️ Prototype

### Phase 1: Shell-Based Check (No LLM)
```bash
# Check if any subagent process is stuck
ps aux | grep -E "subagent|openclaw" | grep -v grep
```

### Phase 2: Event-Based Activation
- Hook into PROJECT-*.md updates
- Start monitor when project becomes active

### Phase 3: Smart Escalation
- Light check every 30s
- If suspicious → LLM check
- If stuck >10min → kill + notify

---

## 📦 Deliverables

| Phase | Item | Status |
|------|------|--------|
| 1 | Shell-based health check | ✅ DONE |
| 2 | Event-based activation (project mode) | 🔄 DONE (in progress) |
| 3 | Smart escalation | ⏳ TODO |
| 4 | Replace cron job | ✅ DONE (disabled) |

---

## Success Metrics

- **Token savings:** <10% of current cron usage
- **Detection rate:** 100% of stuck agents
- **Latency:** <30s detection when active

---

*Research → Design → Prototype → Production*
