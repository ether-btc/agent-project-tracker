# Plugin Research Project

**Project ID:** PLUGIN-RESEARCH-001
**Started:** 2026-02-27
**Status:** COMPLETE (Research)

---

## Comprehensive Research Summary

### Source: Local Docs + Web Search

**Found:** Full metacognitive-suite documentation at github.com/CoderofTheWest/openclaw-metacognitive-suite

---

## The Complete Suite (7 Plugins)

| Plugin | Purpose | Hooks | Our Priority |
|--------|---------|-------|--------------|
| **Stability** | Entropy, drift, loops | 4 | HIGH |
| **Continuity** | Cross-session memory | 8 | HIGH |
| **Graph** | Knowledge graph | 4 | MEDIUM |
| **Metabolism** | Growth vectors | 2 | LOW |
| **Nightshift** | Off-hours scheduling | 2 | LOW |
| **Contemplation** | 24h reflection | 3 | LOW |
| **Crystallization** | Trait conversion | 1 | LOW |

---

## Research Findings

### 1. openclaw-plugin-stability ✅

| Aspect | Details |
|--------|---------|
| Hooks | 4: before_agent_start, agent_end, after_tool_call, before_compaction |
| Dependencies | None |
| Risk | **LOW** |
| What it adds | Entropy monitoring, loop detection, heartbeat decisions, growth vectors |

**How it works:**
- Calculates entropy score after each conversation
- Detects loops (same tool 5x, file read 3x)
- Injects stability context before response
- Tracks growth vectors

### 2. openclaw-plugin-continuity ✅

| Aspect | Details |
|--------|---------|
| Hooks | 8: before_agent_start, before_tool_call, after_tool_call, tool_result_persist, agent_end, before_compaction, session_start, session_end |
| Dependencies | better-sqlite3 ✅, sqlite-vec ✅, @chroma-core ✅ |
| Risk | **MEDIUM** |
| What it adds | Cross-session memory, topic tracking, temporal re-ranking |

**How it works:**
- Archives every conversation
- Uses vector search for recall
- Manages context budget
- Temporal re-ranking (corrections rank higher)

---

## Known Issues (from Web Search)

1. **Plugin naming**: Config key uses unscoped ID (stability not openclaw-plugin-stability)
2. **Version regression**: v2026.2.22 had plugin disable regression
3. **Session rotation**: 4AM rollover can interrupt multi-day tasks

---

## Integration Plan

### Step-by-Step:

1. **Backup config**
2. **Add stability to allow list** (use ID "stability", not full name)
3. **Restart gateway**
4. **Monitor 24h**
5. **If stable → Add continuity** (use ID "continuity")

### Config IDs (important!)

```json
{
  "plugins": {
    "allow": ["stability", "continuity"],
    "entries": {
      "stability": { "enabled": true },
      "continuity": { "enabled": true }
    }
  }
}
```

---

## Risk Mitigation

| Risk | Mitigation |
|------|------------|
| Gateway outage | Backup config, rollback ready |
| Memory bloat | Monitor with compression-detect.sh |
| Hook conflicts | Test stability alone first |
| Dependencies | Already have sqlite-vec in OpenClaw |

---

## Status: Research Complete ✅

Ready for safe implementation.

---
