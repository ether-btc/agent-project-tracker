# Execution Prompt: [PROJECT NAME]

Copy and use this prompt to execute the project with full session resilience:

---

## 🎯 PROJECT EXECUTION PROMPT

```
You are continuing the [PROJECT NAME] ([PROJECT-ID]).

**CRITICAL: Before doing ANYTHING else, execute this startup sequence:**

1. Read the project file:
   - Read: [path/to/PROJECT-file.md]

2. Check for session recovery:
   - Run: [your-checkpoint-script.sh recover]

3. Identify current state:
   - Find the "Session Tracking" section in the project file
   - Note: currentPhase, currentTask, nextAction
   - Check for any blockers

4. Resume execution:
   - Continue from `nextAction` specified in project file
   - If blocked, skip to next unblocked task

**EXECUTION RULES:**

1. **Atomic Task Execution**
   - Complete ONE task from the project file at a time
   - Update task status immediately after completion
   - Update progress dashboard percentages
   - Update `nextAction` to point to next task

2. **Checkpoint Protocol**
   - After completing ANY task, update PROJECT file:
     - Change task status from ⬜ TODO to ✅ DONE
     - Add timestamp to Started/Completed columns
     - Update progress dashboard
     - Add entry to Session Checkpoints table
     - Update sessionState.nextAction

3. **Interruption Resilience**
   - If you sense context is about to reset, run:
     [your-checkpoint-script.sh checkpoint]
   - This saves current state for recovery

4. **Session End Protocol**
   - When ending a work session, run:
     [your-checkpoint-script.sh handoff]
   - This creates clean handoff state

5. **Blocker Protocol**
   - If blocked, document in task Notes column
   - Update Status to 🚫 BLOCKED
   - Add blocker to Blockers section
   - Move to next unblocked task
   - Revisit blocked tasks when unblocked

**PROGRESS TRACKING:**

After each task, update these sections in PROJECT file:

```markdown
## Progress Dashboard
Phase 1: [████░░░░░░] 40%  Status: IN PROGRESS

## Session Tracking
{
  "lastUpdated": "<ISO timestamp>",
  "currentPhase": "<phase>",
  "currentTask": "<task-id>",
  "nextAction": "<specific next action>"
}

## Session Checkpoints
| <timestamp> | <phase> | <task> | <action> | <status> |
```

**COMPLETION CRITERIA:**

Phase is complete when all Checkpoint Criteria checkboxes are ✅.
Project is complete when all Success Criteria are met.

**CURRENT ACTION:**
Start with Phase 1, Task 1.1: [First task description]

---

**BEGIN EXECUTION NOW**
```

---

## 📋 Quick Reference Commands

```bash
# Check project status
cat [PROJECT-file.md] | grep -A 5 "Progress Dashboard"

# Check current task
cat [PROJECT-file.md] | grep "nextAction"

# Recover from interruption
[your-checkpoint-script.sh recover]

# Manual checkpoint
[your-checkpoint-script.sh checkpoint]

# End session cleanly
[your-checkpoint-script.sh handoff]

# View task status
cat [PROJECT-file.md] | grep -E "^\| [0-9]"
```

---

## 🔄 Session Recovery Flow

```
┌─────────────────────────────────────────┐
│  Session Start                          │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  Read PROJECT file                      │
│  Run checkpoint recover script          │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  Check sessionState.nextAction          │
│  Identify current task                  │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  Execute task atomically                │
│  Update project file immediately        │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  Checkpoint? (every 2-3 tasks)          │
│  Handoff? (if ending session)           │
└─────────────────────────────────────────┘
```

---

## ⚠️ Important Notes

1. **This is a multi-session project** - It will span [X-Y days]
2. **Interruptions are expected** - Use checkpoint system
3. **Progress persists in files** - Always update PROJECT file
4. **Blockers happen** - Document and move forward
5. **Completion matters** - Track all success criteria

---

*Prompt template for: [PROJECT NAME]*
*Expected duration: [X-Y days across multiple sessions]*