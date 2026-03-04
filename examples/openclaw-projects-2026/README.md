# OpenClaw Projects 2026

Real project tracking examples from an active OpenClaw deployment (Raspberry Pi 5).

## Files

| File | Description |
|------|-------------|
| `PROJECTS-OVERVIEW.md` | Master project list with status, priority, milestones |
| `PROJECT-SELF-REVIEW-001.md` | Example of behavioral self-improvement project |

## Tracking System

Uses a simple file-based approach:

- **PROJECTS-OVERVIEW.md**: High-level status dashboard
- **projects/PROJECT-*.md**: Individual project files with tasks
- **memory/projects/*/progress.md**: Subagent progress tracking

## Active Projects (2026-03-04)

- SECURITY-HARDENING (HIGH)
- plugin-research-2026 (HIGH)
- BEHAVIOR-RULES-INTEGRATION (HIGH)
- SELF-REVIEW-001 (MEDIUM)
- STATE-VIEWER (MEDIUM)

## Commands

```bash
# List projects
ls projects/PROJECT-*.md

# View overview
cat PROJECTS-OVERVIEW.md

# Create new project
cp templates/PROJECT-template.md projects/PROJECT-NAME.md
```

## Integration

Projects are tracked in:
- `PROJECTS-OVERVIEW.md` (master list)
- `projects/PROJECT-*.md` (individual files)
- `memory/projects/*/progress.md` (subagent progress)

Recovery uses `scripts/session-checkpoint.sh` for cross-session continuity.
