# Delegation Enforcement

## Pre-Delegation Checklist
1. Verify task is atomic (completable in one run)
2. Check dependencies resolved
3. Calculate progress
4. Set timeout appropriate to task complexity

## Trust Calibration
- Track subagent success in metrics
- Auto-fallback to free model on 402 credit error
- Max 3 retries before abort

## Context Transfer
- Preserve session state via checkpoint before handoff
- Include: current task, progress, blockers, next steps