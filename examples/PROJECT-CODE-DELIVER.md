# PROJECT: CODE-DELIVER - Simple Code Generation

**Created:** 2026-03-01 | **Priority:** HIGH | **Status:** ACTIVE

---

## 🎯 Objective

Create a procedure for quickly generating simple code utilities and functions through delegation.

---

## 📋 Concept

When I need a simple function/code snippet:
1. Delegate to appropriate model based on complexity
2. Save output to `~/code/` directory
3. Track created functions in registry

---

## 📦 Deliverables

### 1. Code Output Directory
- Location: `~/code/`
- Structure: `language/filename.py`, etc.
- Registry: `~/code/REGISTRY.md`

### 2. Delegation Rules

| Task Type | Model | When |
|-----------|-------|-------|
| Simple function | deepseek-v3 | Quick utility, email validator, etc |
| Complex code | qwen3a22b | Multi-file, architecture |
| Very simple | minimax-m2.5:free | One-liners, tests |

### 3. Procedure

```
When user asks for simple code:
1. Parse: What language? What function?
2. Delegate: Use deepseek-v3 or appropriate model
3. Save: Output to ~/code/[lang]/
4. Register: Add to REGISTRY.md
5. Report: Show file location to user
```

---

## Progress

| Item | Status |
|------|--------|
| Directory structure | ⏳ TODO |
| Registry format | ⏳ TODO |
| Integration with delegate-decider | ⏳ TODO |
| Test: email validator saved | ✅ DONE |

---

## Test Results

| Function | Model | Status |
|----------|-------|--------|
| email_validator.py | minimax-m2.5:free | ✅ Created |
| reverse_string.py | minimax-m2.5:free | ✅ Created |

---

*For REASON-001 integration - add to delegation matrix*
