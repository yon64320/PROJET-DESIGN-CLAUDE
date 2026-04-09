#!/bin/bash
# prepare-agent-context.sh — Pre-digest an agent's config into a single prompt-ready file
# Usage: ./prepare-agent-context.sh <agent-number>
# Output: .pipeline/context-digests/agent-N.md

AGENT_NUM="$1"

if [[ -z "$AGENT_NUM" ]]; then
    echo "Usage: ./prepare-agent-context.sh <1-8>"
    exit 1
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

# Agent registry
declare -A FOLDERS
FOLDERS[1]="1. Stratégie & cadrage"
FOLDERS[2]="2. Architecture & UX conversion"
FOLDERS[3]="3. Contenu & copywriting"
FOLDERS[4]="4. Branding-UI & design system"
FOLDERS[5]="5. Technique & intégrations"
FOLDERS[6]="6. QA & optimisation"
FOLDERS[7]="7. Integration & developpement"
FOLDERS[8]="8. Deploiement & mise en production"

FOLDER="${FOLDERS[$AGENT_NUM]}"
if [[ -z "$FOLDER" ]]; then
    echo "Unknown agent: $AGENT_NUM. Use 1-8."
    exit 1
fi

AGENT_DIR="$BASEDIR/$FOLDER"
OUTDIR="$BASEDIR/.pipeline/context-digests"
OUTFILE="$OUTDIR/agent-${AGENT_NUM}.md"

mkdir -p "$OUTDIR"

# --- Build digest ---
{
    echo "# Agent $AGENT_NUM — Context Digest"
    echo ""
    echo "> Auto-generated from \`$FOLDER/\` config files."
    echo "> Do NOT edit — regenerate with \`bash prepare-agent-context.sh $AGENT_NUM\`"
    echo ""

    # 1. CLAUDE.md (role, process, deliverables)
    if [[ -f "$AGENT_DIR/CLAUDE.md" ]]; then
        echo "---"
        echo ""
        echo "## IDENTITY & PROCESS"
        echo ""
        cat "$AGENT_DIR/CLAUDE.md"
        echo ""
    fi

    # 2. Output spec (deliverable format)
    OUTPUT_SPEC=$(find "$AGENT_DIR/.claude/skills/output-spec" -name "SKILL.md" 2>/dev/null | head -1)
    if [[ -n "$OUTPUT_SPEC" ]]; then
        echo "---"
        echo ""
        echo "## OUTPUT FORMAT SPEC"
        echo ""
        cat "$OUTPUT_SPEC"
        echo ""
    fi

    # 3. Rules (quality gates)
    RULES_DIR="$AGENT_DIR/.claude/rules"
    if [[ -d "$RULES_DIR" ]]; then
        echo "---"
        echo ""
        echo "## QUALITY RULES"
        echo ""
        for rule in "$RULES_DIR"/*.md; do
            if [[ -f "$rule" ]]; then
                echo "### $(basename "$rule" .md)"
                echo ""
                cat "$rule"
                echo ""
            fi
        done
    fi

    # 4. Available skills (names only)
    SKILLS_DIR="$AGENT_DIR/.claude/skills"
    if [[ -d "$SKILLS_DIR" ]]; then
        echo "---"
        echo ""
        echo "## AVAILABLE SKILLS"
        echo ""
        for skill_dir in "$SKILLS_DIR"/*/; do
            if [[ -d "$skill_dir" ]] && [[ "$(basename "$skill_dir")" != "output-spec" ]]; then
                skill_file="$skill_dir/SKILL.md"
                if [[ -f "$skill_file" ]]; then
                    name=$(grep "^name:" "$skill_file" | head -1 | sed 's/name: *//')
                    desc=$(grep "^description:" "$skill_file" | head -1 | sed 's/description: *//')
                    echo "- \`/$name\` — $desc"
                fi
            fi
        done
        echo ""
    fi

} > "$OUTFILE"

LINE_COUNT=$(wc -l < "$OUTFILE")
echo "✅ Digest written: $OUTFILE ($LINE_COUNT lines)"
