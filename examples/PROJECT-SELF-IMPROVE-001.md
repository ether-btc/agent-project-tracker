# PROJECT-SELF-IMPROVE-001 — Self-Improvement & Delegation Integration

**Project ID**: PROJECT-SELF-IMPROVE-001
**Started**: 2026-02-27
**Status**: IN PROGRESS
**Priority**: HIGH

---

## Overview

1. Self-review of recent behavior patterns
2. Identify recurring issues and root causes
3. Integrate delegation-decider into session flow
4. Make it part of thinking process

---

## Self-Review Analysis

### Issues from Recent Sessions

| Issue | When | Root Cause |
|-------|------|------------|
| Config without backup | PLUGIN-CONT-STAB-001 | No pre-flight checklist |
| Providers lost | Config restore | Didn't merge old+new |
| Gateway auth fail | sessions_spawn | Didn't restart after config change |
| Delegation unused | REASON-001 | Not integrated into flow |

### Patterns Identified

1. **Firefighting vs Prevention** — I fix issues after they happen
2. **Tool existence ≠ Tool usage** — I create systems but don't use them
3. **No pre-flight thinking** — Rush into tasks without checking
4. **Config changes risky** — No backup/checklist discipline

---

## Progress Dashboard

```
Phase 1: Self-Review Analysis     [████████████] 100%  Status: COMPLETE ✅
Phase 2: Identify Rules           [████████████] 100%  Status: COMPLETE ✅
Phase 3: Integrate Delegation     [░░░░░░░░░░░]  0%   Status: IN PROGRESS
Phase 4: Test & Validate         [░░░░░░░░░░░]  0%   Status: PENDING

Total Progress:                   [████████░░░░] 25%
```

---

## Phase 2: Identify Rules

### Proposed New Rules

| # | Rule | Trigger | Action |
|---|------|---------|--------|
| 1 | **Pre-Task Check** | Before any task | Pause 3s, ask: "What's the safest way?" |
| 2 | **Config Change Protocol** | "config", "plugin", "gateway" | Run safety correlation check first |
| 3 | **Delegation Reflex** | Complex coding/research | Ask: "Should I delegate?" |
| 4 | **Backup Reflex** | Any write to config | Auto-backup first |
| 5 | **Integration Check** | New system created | Add to session flow |

### Integration with Existing Systems

| Rule | System | How |
|------|--------|-----|
| Pre-Task Check | AGENTS.md | Add to Safety Checklist |
| Config Protocol | Correlation Rules | Already have cr-safety-* |
| Delegation Reflex | Session prompt | Add to bootstrap |
| Backup Reflex | Session prompt | Add to bootstrap |
| Integration Check | TODO list | Remember to use tools |

---

## Phase 3: Integrate Delegation-Decider

### Current Problem

- Delegation decider exists in files
- Not triggered automatically
- No reminder during sessions

### Solution: Session Flow Integration

Add to session start (after SOUL.md/USER.md):

```
## Delegation Check

For this session, consider delegating if:
- Coding task > 20 lines
- Research task (compare, find, analyze)
- Complex reasoning problem
- Multiple file refactor

Use: scripts/delegate-decider.md for routing
```

### Trigger Points

1. **Session start** — Reminder to check delegation options
2. **"code", "write", "generate"** — Correlation rule: suggest delegation
3. **"compare", "analyze", "research"** — Correlation rule: suggest qwen3a22b
4. **Complex task detected** — HYBRID suggestion

### Implementation Tasks

| Task | Description |
|------|-------------|
| 3.1 | Add delegation reminder to AGENTS.md |
| 3.2 | Add correlation rules for delegation triggers |
| 3.3 | Update session bootstrap to mention delegation |
| 3.4 | Test: code task should suggest delegation |

---

## Phase 4: Test & Validate

### Test Scenarios

| Scenario | Query | Expected |
|----------|-------|----------|
| CODE | "Write a function" | Suggest devstral2 |
| RESEARCH | "Compare X vs Y" | Suggest qwen3a22b |
| COMPLEX | "Refactor whole auth" | Suggest HYBRID |
| DECISION | "Which DB?" | INTERNAL |

---

## Session State

```json
{
  "lastUpdated": "2026-02-27T09:34:00+01:00",
  "currentPhase": "Phase 2",
  "currentTask": "Identify rules from self-review",
  "nextAction": "Add rules to AGENTS.md, integrate delegation"
}
```

---

*Created: 2026-02-27*

## Phase 3 Progress (2026-02-27)

### Completed
- ✅ Added delegation reminder to AGENTS.md
- ✅ Delegation correlation rules exist (cr-delegate-001 to 006)
- ✅ Tested: "write some code" → suggests devstral2

### Next
- Test delegation on actual code task
- Verify HYBRID mode works for complex tasks

