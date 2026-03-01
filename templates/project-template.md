# PROJECT: [Project Name]

**Created:** {{DATE}} | **Priority:** HIGH/MEDIUM/LOW | **Status:** ACTIVE

---

## 🎯 Objective

[What are we building? Why does it matter?]

---

## 📋 Deliverables

| # | Item | Status |
|---|------|--------|
| 1 | | ⏳ TODO |
| 2 | | ⏳ TODO |

---

## 🔄 Workflow

When starting ANY new project:

1. **Create** `PROJECT-[name].md` from template
2. **Activate**: `./scripts/activate-project-mode.sh [project-name]`
3. **Load personas**: Review `memory/personas/` for relevant roles
4. **Delegate**: Use `memory/personas/subagent-templates.md`
5. **Track**: Update status in PROJECT-*.md
6. **Checkpoint**: Run `scripts/session-checkpoint.sh auto` before exit

---

## 📝 Quick Start

```bash
# 1. Create project file
cat > PROJECT-newproject.md << 'EOF'
# PROJECT: New Project
...
EOF

# 2. Activate project mode
./scripts/activate-project-mode.sh newproject
```

---

*Template for quick project creation*
