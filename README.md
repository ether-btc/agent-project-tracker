# Agent Project Tracker

Session-resilient project tracking templates for AI agents. Survive context resets and multi-day projects with full progress recovery.

## Features

- ✅ **Session Death Resilience** - Recover from context resets mid-project
- ✅ **Atomic Task Execution** - One task at a time, always completable
- ✅ **Progress Dashboard** - Visual progress tracking across phases
- ✅ **Blocker Handling** - Document and skip blocked tasks
- ✅ **Checkpoint Protocol** - Save state every 2-3 tasks
- ✅ **Handoff Protocol** - Clean session end with next action ready
- ✅ **Delegation Best Practices** - Model selection, failsafe, quota management
- ✅ **Progress Auto-Calculation** - Automatically calculate project progress
- ✅ **Cross-Project Dependencies** - Check and manage dependencies between projects
- ✅ **Dynamic Handoff Protocol** - Enhanced delegation with context transfer

## Quick Start

1. Copy `templates/PROJECT-template.md` to your workspace
2. Fill in your project phases and tasks
3. Copy `templates/PROMPT-template.md` as your execution prompt
4. Execute the prompt to begin

## Documentation

### Core Guides
| Document | Description |
|----------|-------------|
| [delegation-procedure.md](docs/delegation-procedure.md) | Standard delegation procedure |
| [delegation-failsafe.md](docs/delegation-failsafe.md) | Error handling and rollback |
| [delegation-quota.md](docs/delegation-quota.md) | Token budgeting |
| [delegation-best-practices.md](docs/delegation-best-practices.md) | Research and best practices |

### For AI Agents
This repo includes delegation procedures designed for AI assistants:

1. **Pre-delegation checklist** - Always verify task readiness
2. **Atomic task design** - Tasks should be completable in one run
3. **Failsafe mechanisms** - Handle errors gracefully
4. **Quota management** - Stay within budget

See `docs/` directory for full documentation.

## Template Files

| File | Purpose |
|------|---------|
| `templates/PROJECT-template.md` | Master project tracking file |
| `templates/PROMPT-template.md` | Execution prompt with recovery protocol |

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/session-checkpoint.sh` | Checkpoint, handoff, and recovery |

## Example Projects

| Example | Description |
|---------|-------------|
| `examples/memory-enhancement/` | Multi-phase memory improvement |
| `examples/model-manager/` | CLI tool development |

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
./scripts/session-checkpoint.sh checkpoint "working on X" "current focus"

# Recover on resume
./scripts/session-checkpoint.sh recover

# End session cleanly
./scripts/session-checkpoint.sh handoff "completed X" "next is Y"
```

## License

MIT

*Built for OpenClaw agents, works with any AI system that needs durable project tracking.*
