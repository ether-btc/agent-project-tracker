#!/bin/bash
# Calculate progress for all projects

PROJECTS_DIR="$HOME/.openclaw/workspace/memory/projects"

echo "=== Project Progress ==="

for proj in "$PROJECTS_DIR"/*/; do
    name=$(basename "$proj")
    progress_file="$proj/progress.md"
    
    if [ -f "$progress_file" ]; then
        total=$(grep -c "\[x\]" "$progress_file" 2>/dev/null || echo 0)
        echo "$name: $total tasks"
    fi
done
