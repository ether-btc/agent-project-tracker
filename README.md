# Agent Project Tracker

Session-resilient project tracking templates for AI agents. Survive context resets and multi-day projects with full progress recovery.

## Features

- ✅ **Session Death Resilience** - Recover from context resets mid-project
- ✅ **Atomic Task Execution** - One task at a time, always completable
- ✅ **Progress Dashboard** - Visual progress tracking across phases
- ✅ **Blocker Handling** - Document and skip blocked tasks
- ✅ **Checkpoint Protocol** - Save state every 2-3 tasks
- ✅ **Handoff Protocol** - Clean session end with next action ready

## Quick Start

1. Copy `templates/PROJECT-template.md` to your workspace
2. Fill in your project phases and tasks
3. Copy `templates/PROMPT-template.md` as your execution prompt
4. Execute the prompt to begin

## Template Files

| File | Purpose |
|------|---------|
| `templates/PROJECT-template.md` | Master project tracking file |
| `templates/PROMPT-template.md` | Execution prompt with recovery protocol |

## Example Project

See `examples/memory-enhancement/` for a full example of a 3-phase memory system improvement project.

## How It Works

```
Session Start
     ↓
Read PROJECT file → Check sessionState.nextAction
     ↓
Execute ONE task atomically
     ↓
Update PROJECT file immediately
     ↓
Checkpoint? (every 2-3 tasks)
     ↓
Handoff? (if ending session)
```

## Integration

Works with any session checkpoint system:

```bash
# Checkpoint during work
./scripts/session-checkpoint.sh checkpoint

# Recover on resume
./scripts/session-checkpoint.sh recover

# End session cleanly
./scripts/session-checkpoint.sh handoff
```

## License

MIT

---

*Built for OpenClaw agents, works with any AI system that needs durable project tracking.*