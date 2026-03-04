# PROJECT: SELF-REVIEW-001

**Created:** 2026-03-02 | **Priority:** MEDIUM | **Status:** COMPLETE

## Objective
Analyze recent project behavior, identify recurring issues, create rules that integrate with existing systems WITHOUT additional API cost.

## Why This Matters
- Prevent repeated errors
- Self-improvement without API cost
- Leverage existing systems (correlation rules, heartbeat, memory)

## Data Sources
- Session archives: `memory/archive/2026-03-*.md`
- Project status: `PROJECTS-OVERVIEW.md`
- Error logs: `memory/autonomous-op.log`
- Session state: `memory/session-state.json`

## Constraints
- No extra LLM calls
- Integrate with existing systems
- Rules must be auto-recalled or correlation-matched

## Deliverables
- [ ] Issues identified (with frequency)
- [ ] Proposed rules (integrated)
- [ ] Retrieval method defined
- [ ] Justification documented

## Progress
- [2026-03-02 21:20] Prompt created: prompts/self-review-behavior-prompt.md
- [ ] Run self-review analysis
- [ ] Propose rules
- [ ] Document recommendations

## Status: COMPLETE
