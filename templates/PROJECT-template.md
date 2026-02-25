# [PROJECT NAME]

**Project ID**: [PROJECT-ID]
**Started**: [DATE]
**Status**: ACTIVE
**Priority**: [HIGH/MEDIUM/LOW]

---

## Overview

[Brief description of what this project accomplishes]

**Source Assessment**: [Link to research/assessment if applicable]

---

## Progress Dashboard

```
Phase 1: [NAME]        [░░░░░░░░░░] 0%   Status: NOT STARTED
Phase 2: [NAME]        [░░░░░░░░░░] 0%   Status: BLOCKED (Phase 1)
Phase 3: [NAME]        [░░░░░░░░░░] 0%   Status: BLOCKED (Phase 2)

Total Progress:        [░░░░░░░░░░] 0%
```

---

## Phase 1: [Phase Name]

**Duration**: [X-Y days]
**Status**: NOT STARTED
**Started**: null
**Completed**: null

### Tasks

| ID | Task | Status | Started | Completed | Notes |
|----|------|--------|---------|-----------|-------|
| 1.1 | [Task description] | ⬜ TODO | - | - | [Details] |
| 1.2 | [Task description] | ⬜ TODO | - | - | [Details] |
| 1.3 | [Task description] | ⬜ TODO | - | - | [Details] |

### Checkpoint Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

### Dependencies
- [List dependencies or "None"]

### Blockers
- [List blockers or "None currently"]

---

## Phase 2: [Phase Name]

**Duration**: [X-Y days]
**Status**: BLOCKED (Phase 1)
**Started**: null
**Completed**: null

### Tasks

| ID | Task | Status | Started | Completed | Notes |
|----|------|--------|---------|-----------|-------|
| 2.1 | [Task description] | ⬜ TODO | - | - | [Details] |

### Checkpoint Criteria
- [ ] [Criterion 1]

### Dependencies
- Phase 1

### Blockers
- Waiting for Phase 1 completion

---

## Phase 3: [Phase Name]

**Duration**: [X-Y days]
**Status**: BLOCKED (Phase 2)
**Started**: null
**Completed**: null

### Tasks

| ID | Task | Status | Started | Completed | Notes |
|----|------|--------|---------|-----------|-------|
| 3.1 | [Task description] | ⬜ TODO | - | - | [Details] |

### Checkpoint Criteria
- [ ] [Criterion 1]

### Dependencies
- Phase 2

### Blockers
- Waiting for Phase 2 completion

---

## Session Tracking

### Current Session State

```json
{
  "lastUpdated": "[ISO TIMESTAMP]",
  "currentPhase": null,
  "currentTask": null,
  "lastCheckpoint": null,
  "nextAction": "[First task to start]"
}
```

### Session Checkpoints

| Timestamp | Phase | Task | Action | Status |
|-----------|-------|------|--------|--------|
| - | - | - | Project initialized | ✅ |

---

## Recovery Protocol

If session is interrupted, on resume:

1. **Read this file** (`PROJECT-[project-id].md`)
2. **Check `sessionState` above** for last known position
3. **Continue from `nextAction`**
4. **Update status** after each task completion
5. **Run checkpoint** at end of each work session

### Checkpoint Command
```bash
# After completing tasks, update this file:
# 1. Update task status in table
# 2. Update progress dashboard
# 3. Update sessionState.nextAction
# 4. Add entry to Session Checkpoints table
```

---

## Success Criteria

### Phase 1 Complete When:
- [ ] [Criterion 1]
- [ ] [Criterion 2]

### Phase 2 Complete When:
- [ ] [Criterion 1]

### Phase 3 Complete When:
- [ ] [Criterion 1]

### Project Complete When:
- [ ] All phases complete
- [ ] All documentation updated
- [ ] [Final criterion]

---

## Metrics Dashboard

```json
{
  "metric_1": 0,
  "metric_2": 0
}
```

---

## Related Files

| File | Purpose |
|------|---------|
| `[file]` | [purpose] |

---

## Notes

- Use `/checkpoint` during work sessions to save progress
- Update this file after each completed task
- If blocked, document blocker and move to next unblocked task
- End each session with checkpoint + handoff

---

*Created: [DATE]*
*Last Updated: [DATE]*