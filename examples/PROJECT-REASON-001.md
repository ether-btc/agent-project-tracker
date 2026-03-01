# PROJECT: REASON-001 — Enhanced Delegate Decider

**Project ID**: REASON-001
**Started**: 2026-02-27
**Status:** ACTIVE | **Phase:** 1
**Priority**: MEDIUM

---

## Overview

Expand the "Coding Task Delegator Addon" into a multi-purpose delegation system supporting:
- Code generation
- Reasoning tasks
- Research tasks
- Problem decomposition
- Architecture decisions

---

## Progress Dashboard

```
Phase 1: Research & Refine Mappings  [████████████] 100%  Status: COMPLETE ✅
Phase 2: Update Delegate Decider      [████████████] 100%  Status: COMPLETE ✅
Phase 3: Update Delegate Prompt      [████████████] 100%  Status: COMPLETE ✅
Phase 4: Test & Validate             [████████████] 100%  Status: COMPLETE ✅

Total Progress:                       [████████████] 100%  ✅ COMPLETE
```

---

## Phase 1: Research & Refine Mappings

**Duration**: 1 session
**Status**: NOT STARTED

### Model Capability Research

Based on user-provided specs:

| Model | Provider | Primary Strength | Secondary | Best For |
|-------|----------|-----------------|-----------|----------|
| devstral2 | nvidia | CODE + DEEP REASONING | efficiency | Complex code, algorithms |
| glm4.7 | nvidia | CODE + FAST REASONING | multilingual, tool use, UI | Agentic coding, UI tasks |
| phi3medium | nvidia | CODE (local-friendly) | 128k context | Simple local tasks |
| claude-sonnet-4.5 | kilocode | ARCHITECTURE | complex code | System design |
| minimax-m2.5:free | kilocode | OFFICE + FAST | - | Quick tasks, free tier |
| minimax-m2.5 | nvidia | CODE + REASONING | OFFICE | Versatile coding |
| kimi-k2-thinking | nvidia | REASONING + TOOL USE | INT4 efficiency | Complex reasoning |
| qwen3-235b-a22b | nvidia | REASONING + MOE | multilingual | Research, analysis |

### Task Categories

| Category | Description | Examples |
|----------|------------|----------|
| CODE | Code generation, refactoring, tests | Write function, refactor, tests |
| REASON | Logical analysis, problem decomposition | Debug, analyze, plan |
| RESEARCH | Information gathering, comparisons | Compare options, find patterns |
| ARCHITECTURE | System design, trade-offs | Choose database, design system |
| OFFICE | Document processing, summaries | Summarize, format |
| HYBRID | Combination tasks | Research + implement |

### Verified Model IDs (from openclaw.json)

**Nvidia Provider:**
- `nvidia/mistralai/devstral-2-123b-instruct-2512` → devstral2
- `nvidia/minimaxai/minimax-m2.5` → minimax-nv-m25
- `nvidia/moonshotai/kimi-k2-thinking` → kimik2thinking
- `nvidia/qwen/qwen3-235b-a22b` → qwen3a22b
- `nvidia/moonshotai/kimi-k2-instruct-0905` → kimik2
- `nvidia/deepseek-ai/deepseek-v3.2` → **deepseek-v3** ✅ NEW

**Kilocode Provider:**
- `kilocode/anthropic/claude-sonnet-4.5` → claude-sonnet-4.5
- `kilocode/minimax/minimax-m2.5:free` → minimax-m2.5:free
- `kilocode/z-ai/glm-5:free` → glm-5:free
- `kilocode/anthropic/claude-opus-4.6` → claude-opus-4.6

### Updated Model Routing Table

| Model | ID | CODE | REASON | RESEARCH | ARCH | OFFICE |
|-------|-----|------|--------|----------|------|--------|
| devstral2 | nvidia/mistralai/devstral-2-123b-instruct-2512 | ✅ | ✅ | - | - | - |
| minimax-nv-m25 | nvidia/minimaxai/minimax-m2.5 | ✅ | ✅ | - | - | ✅ |
| kimik2thinking | nvidia/moonshotai/kimi-k2-thinking | - | ✅ | ✅ | - | - |
| qwen3a22b | nvidia/qwen/qwen3-235b-a22b | - | ✅ | ✅ | - | - |
| claude-sonnet-4.5 | kilocode/anthropic/claude-sonnet-4.5 | ✅ | - | - | ✅ | - |
| minimax-m2.5:free | kilocode/minimax/minimax-m2.5:free | ✅ | ✅ | - | - | ✅ |
| **deepseek-v3** | nvidia/deepseek-ai/deepseek-v3.2 | ✅ | ✅ | - | - | - |
| glm-5:free | kilocode/z-ai/glm-5:free | ✅ | ✅ | - | - | - |

### Checkpoint Criteria
- [ ] All 8 models mapped to capabilities
- [ ] Task categories defined
- [ ] Decision matrix created

---

## Phase 2: Update Delegate Decider

**Duration**: 1 session
**Status**: NOT STARTED

### Tasks

| ID | Task | Notes |
|----|------|-------|
| 2.1 | Backup current delegate-decider.md | Create .backup |
| 2.2 | Expand decision framework | Add REASON, RESEARCH, OFFICE categories |
| 2.3 | Add model routing table | Map tasks → models |
| 2.4 | Add fallback logic | If model fails, try backup |
| 2.5 | Update examples | Add non-coding examples |

### Files to Modify
- `scripts/delegate-decider.md`
- `scripts/code-delegate.sh` (update model IDs to match config)

### Compatibility Notes
Current script has outdated model IDs:
- `glm4.7` → Not in config, use `glm-5:free` (kilocode) instead
- `phi3medium` → Not in config
- Missing: kimi-k2-thinking, qwen3-235b-a22b, minimax-m2.5 (nvidia)

### Checkpoint Criteria
- [ ] All 8 models have routing rules
- [ ] Non-coding tasks covered
- [ ] Examples updated

---

## Phase 3: Update Delegate Prompt

**Duration**: 1 session
**Status**: NOT STARTED

### Tasks

| ID | Task | Notes |
|----|------|-------|
| 3.1 | Backup current delegate-decider-prompt.md | Create .backup |
| 3.2 | Update decision options | Add REASON, RESEARCH |
| 3.3 | Update criteria table | Add task type weights |
| 3.4 | Update output format | New categories |
| 3.5 | Add new examples | Non-coding delegations |

### Files to Modify
- `scripts/delegate-decider-prompt.md`

### Checkpoint Criteria
- [ ] Prompt reflects new categories
- [ ] Clear decision output format

---

## Phase 4: Test & Validate

**Duration**: 1 session
**Status**: NOT STARTED

### Tasks

| ID | Task | Notes |
|----|------|-------|
| 4.1 | Test CODE delegation | Delegate simple function |
| 4.2 | Test REASON delegation | Delegate analysis task |
| 4.3 | Test RESEARCH delegation | Delegate comparison |
| 4.4 | Test fallback logic | Verify backup model works |
| 4.5 | Verify gateway still running | After each test |

### Test Scenarios

| Scenario | Query | Expected Model |
|----------|-------|----------------|
| CODE simple | "Write email validator" | devstral2 |
| CODE complex | "Design auth system" | claude-sonnet-4.5 |
| REASON | "Analyze memory leak" | kimik2thinking |
| RESEARCH | "Compare SQL vs NoSQL" | qwen3a22b |
| MULTILINGUAL | "Explain in German" | qwen3a22b |
| FREE TIER | Quick task | minimax-m2.5:free |

### Checkpoint Criteria
- [ ] All test scenarios pass
- [ ] No gateway crashes
- [ ] Memory intact

---

## Safety & Rollback

### Pre-Implementation Backup

```bash
cp ~/.openclaw/workspace/scripts/delegate-decider.md ~/.openclaw/workspace/scripts/delegate-decider.md.backup-$(date +%Y%m%d)
cp ~/.openclaw/workspace/scripts/delegate-decider-prompt.md ~/.openclaw/workspace/scripts/delegate-decider-prompt.md.backup-$(date +%Y%m%d)
```

### Rollback Commands

```bash
# If something goes wrong
cp ~/.openclaw/workspace/scripts/delegate-decider.md.backup-YYYYMMDD ~/.openclaw/workspace/scripts/delegate-decider.md
cp ~/.openclaw/workspace/scripts/delegate-decider-prompt.md.backup-YYYYMMDD ~/.openclaw/workspace/scripts/delegate-decider-prompt.md
```

---

## Session State

```json
{
  "lastUpdated": "2026-02-27T08:56:00+01:00",
  "currentPhase": "Phase 1",
  "currentTask": "Research & refine model mappings",
  "nextAction": "Review user-provided model specs, refine mappings"
}
```

---

## References

| File | Purpose |
|------|---------|
| `scripts/delegate-decider.md` | Main routing framework |
| `scripts/delegate-decider-prompt.md` | Decision prompt |
| `scripts/code-delegate.sh` | Delegation script |
| `AGENTS.md` | Behavioral rules |

---

*Created: 2026-02-27*
