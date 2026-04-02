#!/bin/bash
# validate-deliverable.sh — Verify agent output after completion
# Usage: ./validate-deliverable.sh <agent-number> [project-name]
# Example: ./validate-deliverable.sh 4 Studio-Kodo

AGENT_NUM="$1"
PROJECT="${2:-*}"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"
ERRORS=0
WARNINGS=0

check_file_not_empty() {
    local pattern="$1"
    local label="$2"
    local file
    file=$(find "$BASEDIR" -path "$pattern" -type f 2>/dev/null | head -1)
    if [[ -z "$file" ]]; then
        echo "  ❌ MISSING: $label"
        ERRORS=$((ERRORS+1))
    elif [[ ! -s "$file" ]]; then
        echo "  ❌ EMPTY: $label"
        ERRORS=$((ERRORS+1))
    else
        local lines
        lines=$(wc -l < "$file")
        echo "  ✅ OK: $label ($lines lines)"
    fi
}

check_version_bumped() {
    local pattern="$1"
    local min_version="$2"
    local label="$3"
    local file
    file=$(find "$BASEDIR" -path "$pattern" -type f 2>/dev/null | head -1)
    if [[ -n "$file" ]]; then
        local version
        version=$(grep -oP 'Version\s*[:\*]*\s*v?\K[0-9]+\.[0-9]+' "$file" | head -1)
        if [[ -n "$version" ]]; then
            echo "  📌 Version: v$version — $label"
        else
            echo "  ⚠️  No version found: $label"
            WARNINGS=$((WARNINGS+1))
        fi
    fi
}

check_no_stale_reference() {
    local pattern="$1"
    local stale_pattern="$2"
    local label="$3"
    local file
    file=$(find "$BASEDIR" -path "$pattern" -type f 2>/dev/null | head -1)
    if [[ -n "$file" ]] && grep -qiP "$stale_pattern" "$file" 2>/dev/null; then
        echo "  ⚠️  STALE REFERENCE: $label"
        WARNINGS=$((WARNINGS+1))
    fi
}

if [[ -z "$AGENT_NUM" ]]; then
    echo "Usage: ./validate-deliverable.sh <1-6> [project-name]"
    exit 1
fi

echo "🔍 Validating deliverable from Agent $AGENT_NUM..."
echo ""

case "$AGENT_NUM" in
    1)
        echo "Agent 1 (Stratégie) — pack-strategie"
        check_file_not_empty "*/1. Strat*/pack-strategie-${PROJECT}.md" "Pack stratégie"
        check_version_bumped "*/1. Strat*/pack-strategie-${PROJECT}.md" "1.0" "Pack stratégie"
        ;;
    2)
        echo "Agent 2 (UX) — UX Architecture"
        check_file_not_empty "*/2. Arch*/UX-Architecture-*${PROJECT}*.md" "UX Architecture"
        check_version_bumped "*/2. Arch*/UX-Architecture-*${PROJECT}*.md" "1.0" "UX Architecture"
        ;;
    3)
        echo "Agent 3 (Copy) — Copy v1"
        check_file_not_empty "*/3. Contenu*/copy-v1-${PROJECT}.md" "Copy v1"
        check_version_bumped "*/3. Contenu*/copy-v1-${PROJECT}.md" "1.0" "Copy v1"
        ;;
    4)
        echo "Agent 4 (Design) — 4 deliverables"
        check_file_not_empty "*/4. Branding*/design-system-v1-${PROJECT}.md" "Design system"
        check_file_not_empty "*/4. Branding*/tokens.json" "tokens.json"
        check_file_not_empty "*/4. Branding*/component-handoff-${PROJECT}.md" "Component handoff"
        check_file_not_empty "*/4. Branding*/motion-strategy-${PROJECT}.md" "Motion strategy"
        check_version_bumped "*/4. Branding*/design-system-v1-${PROJECT}.md" "1.0" "Design system"
        check_version_bumped "*/4. Branding*/component-handoff-${PROJECT}.md" "1.0" "Component handoff"
        check_version_bumped "*/4. Branding*/motion-strategy-${PROJECT}.md" "1.0" "Motion strategy"
        ;;
    5)
        echo "Agent 5 (Tech) — Tech stack"
        check_file_not_empty "*/5. Technique*/tech-stack-v1-${PROJECT}.md" "Tech stack"
        check_version_bumped "*/5. Technique*/tech-stack-v1-${PROJECT}.md" "1.0" "Tech stack"
        ;;
    6)
        echo "Agent 6 (QA) — QA Report"
        check_file_not_empty "*/6. QA*/qa-report-v1-${PROJECT}.md" "QA Report"
        check_version_bumped "*/6. QA*/qa-report-v1-${PROJECT}.md" "1.0" "QA Report"
        ;;
esac

echo ""
if [[ "$ERRORS" -gt 0 ]]; then
    echo "🚫 Deliverable validation FAILED — $ERRORS error(s), $WARNINGS warning(s)"
    exit 1
elif [[ "$WARNINGS" -gt 0 ]]; then
    echo "⚠️  Deliverable validation PASSED with $WARNINGS warning(s)"
    exit 0
else
    echo "✅ Deliverable validation PASSED"
    exit 0
fi
