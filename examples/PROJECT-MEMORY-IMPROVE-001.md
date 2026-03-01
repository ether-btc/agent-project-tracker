# PROJECT-MEMORY-IMPROVE-001 — Memory System Quick Wins

**Project ID**: PROJECT-MEMORY-IMPROVE-001
**Started**: 2026-02-27
**Status**: PLANNING
**Priority**: MEDIUM

---

## Overview

Implement Tier 1 quick wins to improve memory system functionality:
1. Memory stats() method
2. Decay integration into heartbeat
3. Importance scoring on write
4. Anchor vocabulary in retrieval
5. Memory type tagging

## Context

From memory-implementation-plan.md:
| Component | Current Status |
|-----------|----------------|
| Hard Enforcement | ✅ Auto-inject before response |
| File Watching | ✅ Auto-index on changes |
| Co-occurrence | ✅ Entity graph exists |
| Decay | ⚠️ Script exists, not integrated |
| Importance Scoring | ⚠️ Schema exists, not computed |
| Correlation Rules | ✅ Just implemented |
| Session Checkpoint | ✅ Just implemented |
| Anchor Vocabulary | ⚠️ Schema exists, not used in retrieval |
| Memory Types | ❌ Not implemented |
| Multi-stage Retrieval | ❌ Single-stage only |

---

## Progress Dashboard

```
Task 1: Memory stats method        [░░░░░░░░░░]  0%   Status: PENDING
Task 2: Decay integration          [░░░░░░░░░░]  0%   Status: PENDING
Task 3: Importance scoring          [░░░░░░░░░░]  0%   Status: PENDING
Task 4: Anchor vocabulary in search [░░░░░░░░░░]  0%   Status: PENDING
Task 5: Memory type tagging         [░░░░░░░░░░]  0%   Status: PENDING

Total Progress:                    [░░░░░░░░░░]  0%
```

---

## Task 1: Memory Stats Method

**Effort**: 1 hour
**Impact**: Medium
**Risk**: None

### Description
Create a script to show memory statistics: file count, chunk count, last update, size breakdown.

### Existing Resources
- `memory/` directory with daily files
- `memory/context-checkpoints.json` with history
- `memory/entity-graph.json`

### Deliverable
- `scripts/memory-stats.sh` — Shows:
  - Total memory files
  - Total chunks
  - Last updated
  - Size breakdown by type
  - Growth trend

---

## Task 2: Decay Integration into Heartbeat

**Effort**: 1 hour
**Impact**: High
**Risk**: Low

### Description
Integrate existing decay script into heartbeat rotation for automatic memory decay processing.

### Existing Resources
- `scripts/memory-decay.sh` — Exists but not integrated
- HEARTBEAT.md — Already has rotation system

### Deliverable
- Add decay check to HEARTBEAT.md rotation (item #9 already exists)
- Configure decay thresholds
- Log decay events

---

## Task 3: Importance Scoring on Write

**Effort**: 2 hours
**Impact**: High
**Risk**: Low

### Description
Compute importance scores when writing memories based on entity density, decision signals, user engagement.

### Existing Resources
- `memory/importance-scoring.json` — Schema exists
- From agent-memory-ultimate research: ι(m) = 3.0×entity_density + 3.0×decision_signal + 2.5×user_engagement + 1.5×recency_bonus

### Deliverable
- `scripts/compute-importance.sh` — Scores memories on write
- Update memory-watcher to trigger scoring
- Store scores in memory metadata

---

## Task 4: Anchor Vocabulary in Retrieval

**Effort**: 2 hours
**Impact**: High
**Risk**: Low

### Description
Integrate anchor vocabulary into memory search to boost/retrieve relevant contexts when anchors detected.

### Existing Resources
- `memory/anchor-vocabulary.json` — Curated anchors exist
- `scripts/anchor-detect.sh` — Detection script exists
- Correlation rules already working

### Deliverable
- Modify `scripts/hybrid-search.sh` to check anchors first
- When anchor detected → broaden search automatically
- Log anchor-triggered retrievals

---

## Task 5: Memory Type Tagging

**Effort**: 1 hour
**Impact**: Medium
**Risk**: None

### Description
Add memory type tags (fact, decision, lesson, todo, context) to enable type-specific retrieval.

### Existing Resources
- From drift-memory assessment: memory types taxonomy

### Deliverable
- Update memory file format to include type tags
- Add type filter to search
- Examples:
  - `#type:decision` 
  - `#type:lesson`
  - `#type:fact`

---

## Deep Investigation (Deferred)

### Hard Enforcement Visibility
- **Status**: Unknown if working
- **Issue**: No visible injection logs
- **Needed**: Config to add visibility or test injection

### Investigation Tasks (for later):
1. Find memory-hard-enforcement config options
2. Add logging to see what's injected
3. Verify anchor boosting triggers

---

## Session State

```json
{
  "lastUpdated": "2026-02-27T09:28:00+01:00",
  "currentPhase": "Planning",
  "nextAction": "Review tasks, decide which to implement first"
}
```

---

## References

| File | Purpose |
|------|---------|
| `docs/memory-implementation-plan.md` | Full implementation plan |
| `docs/agent-memory-ultimate-assessment.md` | Research source |
| `memory/importance-scoring.json` | Scoring schema |
| `memory/anchor-vocabulary.json` | Anchor list |
| `scripts/memory-decay.sh` | Decay script (exists) |
| `scripts/anchor-detect.sh` | Anchor detector (exists) |

---

*Created: 2026-02-27*
