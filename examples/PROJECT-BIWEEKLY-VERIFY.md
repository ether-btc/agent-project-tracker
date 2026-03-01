# Bi-Weekly Project Verification

**Project ID:** BIWEEKLY-VERIFY-001
**Started:** 2026-02-28
**Status:** ACTIVE
**Priority:** MEDIUM
**Schedule:** Every 2 weeks

---

## Purpose

Verify all completed projects are still working as intended.

---

## Schedule

| # | Date | Status |
|---|------|--------|
| 1 | 2026-02-28 | ✅ COMPLETE |
| 2 | 2026-03-14 | PENDING |
| 3 | 2026-03-28 | PENDING |

---

## Verification Items

### Must Check

- [ ] Gateway health (openclaw doctor)
- [ ] Memory scripts run without error
- [ ] Correlation rules match triggers
- [ ] Backup systems functional
- [ ] Delegation system works
- [ ] Logseq sync active
- [ ] Syncthing connected

### Documentation

- [ ] Create memory/biweekly-YYYY-MM-DD-verification.md
- [ ] Update PROJECT status if issues found

---

## Automation

Added to HEARTBEAT.md rotation:
- Item: Check if bi-weekly verification due
- Script: prompts/biweekly-verification.md
- Command: Read prompt and execute

---

## Commands

Run verification manually:
```bash
# Read prompt
cat prompts/biweekly-verification.md

# Run checks
./scripts/memory-decay.sh
./scripts/correlation-rules.sh list
openclaw doctor
```

---

## Next Verification

**Due:** 2026-03-14

---

*Created 2026-02-28*

## Risk Guidelines

| Risk Level | Fix Myself? | Examples |
|------------|-------------|----------|
| **LOW** | ✅ Yes | Syntax, paths, missing files |
| **MEDIUM** | ❌ Ask | Design changes, new features |
| **HIGH** | ❌ Ask | Core functionality broken |

## Decision Rule

> "If LOW risk and HIGH confidence → Fix autonomously. Else → Ask user."


## Integration with Delegate-Decider

Applied findings from DELEGATE-INVESTIGATE-001:

### Added

1. **Confidence Scoring** — Each verification check now scored 0-100%
2. **Risk Matrix** — 5 levels (CRITICAL→NEGLIGIBLE)
3. **Decision Rules** — Based on confidence + risk
4. **Delegation Logging** — Track verification outcomes

### Decision Matrix

| Confidence | Risk | Action |
|------------|------|--------|
| ≥80% | LOW | ✅ Fix autonomously |
| 60-79% | LOW | ⚠️ Fix, ask after |
| <60% | Any | ❌ Ask user |

### Updated Files

- prompts/biweekly-verification.md — Full integration

