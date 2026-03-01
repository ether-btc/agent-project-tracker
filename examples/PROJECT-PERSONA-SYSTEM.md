# PROJECT: Persona System for Project Work

**Created:** 2026-03-01 | **Priority:** HIGH | **Status:** ACTIVE

---

## 🎯 Objective

Create an automatic persona/role system that activates when working on projects:
1. **Me (Claw)** → adopt project-specific personas (Senior PM, Tech Lead, etc.)
2. **Sub-agents** → cast in specialized roles based on task needs
3. **Research** → codified into concrete procedures we follow during project work

---

## 📋 Core Concept

### Persona Activation Trigger
When a new project is created or we're in "project mode":
1. Load relevant personas from `memory/personas/`
2. Adopt primary persona for myself
3. Cast sub-agents with role-specific prompts
4. Apply research-backed procedures

### Persona Layers

| Layer | Who | Example |
|-------|-----|---------|
| Primary | Me (Claw) | Senior Agile PM (40y exp) |
| Secondary | Sub-agents | Devstral2 = Senior Engineer, qwen3a22b = Researcher |
| Procedures | Scripts/Systems | Research → Execution → Review workflow |

---

## 🔬 Research to Incorporate

From memory/project-tracker-investigation.md:
- **Magnetic manager pattern** (Microsoft) — priority-based task pulling
- **LangGraph state persistence** — transaction history, context constraints
- **Dynamic task lists** — user rules as magnetic constraints
- **Delegation decision framework** — when to delegate, to whom

### Other Sources to Review
- memory/delegate-investigation-findings.md
- memory/memory-investigation-findings.md
- docs/project-tracker-usage.md

---

## 🗂️ Deliverables

### 1. Persona Library
- [x] `memory/personas/senior-pm.md` — 40yr exp, agile, systematic ✅
- [x] `memory/personas/senior-engineer.md` — tech lead, code quality ✅
- [x] `memory/personas/researcher.md` — investigation, analysis ✅
- [x] `memory/personas/architect.md` — system design ✅
- [x] `memory/personas/reasoner.md` — debugging, complex logic ✅
- [x] `memory/personas/embodied-reactor.md` — embodied cognition integration ✅

### 2. Activation Procedure
- [x] `scripts/activate-project-mode.sh` — load personas, set context ✅
- [ ] Integrate into PROJECT-*.md creation workflow

### 3. Sub-agent Role Templates
- [ ] Update delegation framework with role-specific prompts
- [ ] Map: model → role → task types

### 4. Procedure Checklists
- [ ] Research → validate → implement → review flow
- [ ] Decision checklist (delegate vs. internal)
- [ ] Quality gates for project completion

---

## 📝 Current Tasks

| Task | Status |
|------|--------|
| Create reasoner persona | ✅ DONE |
| Update AGENTS.md with project mode | ✅ DONE |
| Sub-agent role templates | ✅ DONE |
| Integrate into project creation | ✅ DONE |

---

## 🤝 Working Style

When working on THIS project:
- **Me (Claw)** = Senior Agile PM persona
- **You (MaKra)** = Product Owner / Stakeholder
- **Approach**: Iterate, validate, improve

---

*This project will self-activate future projects.*
