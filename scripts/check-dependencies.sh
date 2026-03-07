#!/bin/bash
# Check cross-project dependencies

PROJECTS_DIR="$HOME/.openclaw/workspace/memory/projects"

echo "=== Dependency Check ==="

for proj in "$PROJECTS_DIR"/*.md; do
    name=$(basename "$proj" .md)
    deps=$(grep -i "depends_on:" "$proj" 2>/dev/null | cut -d: -f2 | tr -d ' ')
    
    if [ -n "$deps" ]; then
        echo "$name depends on: $deps"
    fi
done
