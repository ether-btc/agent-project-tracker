# Behavioral Rules System

**Project ID:** BEHAV-INT-001
**Started:** 2026-02-26
**Status:** COMPLETE
**Priority:** HIGH

---

## Overview

Implement behavioral rules to prevent recurring issues from session resets and ensure safe operations.

---

## Progress Dashboard

```
Phase 1: Pre-Flight Safety     [██████████] 100%  Status: COMPLETE
Phase 2: Handoff Enforcement   [██████████] 100%  Status: COMPLETE
Phase 3: Recovery Correlation  [██████████] 100%  Status: COMPLETE
Phase 4: Path Validation       [██████████] 100%  Status: COMPLETE
Phase 5: Checkpoint Frequency  [██████████] 100%  Status: COMPLETE

Total Progress:                [██████████] 100%
```

---

## Phase 1: Pre-Flight Safety

**Status:** COMPLETE

| Task | Status | Notes |
|------|--------|-------|
| 1.1 Create preflight-check.sh | ✅ DONE | check/stash/checkpoint/all modes |
| 1.2 integrate with update.run | ✅ DONE | Manual trigger for now |
| 1.3 Document in recovery-procedures | ✅ DONE | Added to existing doc |

---

## Phase 2: Handoff Enforcement

**Status:** COMPLETE

| Task | Status | Notes |
|------|--------|-------|
| 2.1 Create handoff-validate.sh | ✅ DONE | Validates nextAction field |
| 2.2 Add auto-fix capability | ✅ DONE | Populates defaults if missing |
| 2.3 Integrate with session-checkpoint.sh | ✅ DONE | Runs validation on handoff |

---

## Phase 3: Recovery Correlation

**Status:** COMPLETE

| Task | Status | Notes |
|------|--------|-------|
| 3.1 Verify cr-005 (session-recovery) | ✅ DONE | Already exists |
| 3.2 Add recovery keywords to triggers | ✅ DONE | Keywords: crashed, reset, recover |

---

## Phase 4: Path Validation

**Status:** COMPLETE (2026-02-26)

| Task | Status | Notes |
|------|--------|-------|
| 4.1 Create path-validation-guide.md | ✅ DONE | docs/path-validation-guide.md |
| 4.2 Add cr-007 correlation rule | ✅ DONE | Triggers on script errors |

---

## Phase 5: Checkpoint Frequency

**Status:** COMPLETE (2026-02-26)

| Task | Status | Notes |
|------|--------|-------|
| 5.1 Update PROJECT-template.md | ✅ DONE | Added checkpoint every 3 tasks |
| 5.2 Document in template | ✅ DONE | Checkpoint frequency section |

---

## Rules Summary (All Complete)

| # | Rule | Trigger | Status |
|---|------|---------|--------|
| 1 | Pre-Risky-Op Checkpoint | update.run, config.apply | ✅ |
| 2 | Auto-Stash Before Update | Any git operation | ✅ |
| 3 | Path Validation | script errors, file not found | ✅ |
| 4 | Handoff Completeness | Session end | ✅ |
| 5 | Recovery Correlation | Recovery keywords | ✅ |
| 6 | Checkpoint Frequency | Every 3 tasks | ✅ |

---

## Usage

```bash
# Pre-flight safety before updates
./scripts/preflight-check.sh all

# Validate handoff before ending session
./scripts/handoff-validate.sh validate
```
