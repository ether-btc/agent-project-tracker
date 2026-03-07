# Delegation Procedure

## Purpose
Standard procedure for invoking subagents in AI assistant systems.

## Pre-Delegation Checklist

Before spawning any subagent, verify:

- [ ] Task fits one of the defined delegation roles
- [ ] Correct model selected for the task
- [ ] Progress file exists
- [ ] Task is atomic (single, well-defined objective)
- [ ] Success criteria defined
- [ ] Timeout appropriate for task complexity

## Atomic Task Design

### What Makes a Task Atomic?
- Single objective
- Independent of other tasks
- Complete within one subagent run
- Clear success/failure criteria

### Task Size Guidelines

| Task Size | Example | Recommended Timeout |
|-----------|---------|-------------------|
| Micro | Summarize 1 file | 30s |
| Small | Fix 1 bug | 60s |
| Medium | Refactor 1 module | 180s |
| Large | Implement feature | 300s |
| Complex | Design system | 600s |

## Invocation Template

```
sessions_spawn with:
  model: <appropriate model>
  runtime: subagent
  task: <atomic task description>
  progress_file: <path to progress file>
  timeout: <appropriate for task size>
```

## Verification

### Post-Delegation Check

1. Check progress file
2. Verify completion status: COMPLETE / FAILED / TIMEOUT
3. Review output quality
4. If failed: classify error and handle

### Quality Gates

- [ ] Progress file updated
- [ ] Output meets success criteria
- [ ] No TODOs left in code
- [ ] Tests pass (if applicable)

---

*Part of AI Agent Project Tracker*
