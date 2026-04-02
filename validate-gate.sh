#!/bin/bash
# validate-gate.sh — Verify prerequisites before launching an agent
# Usage: ./validate-gate.sh <agent-number> [project-name]
# Example: ./validate-gate.sh 5 Studio-Kodo

AGENT_NUM="$1"
PROJECT="${2:-*}"
BASEDIR="$(cd "$(dirname "$0")" && pwd)"
ERRORS=0

check_file() {
    local pattern="$1"
    local label="$2"
    local matches
    matches=$(find "$BASEDIR" -path "$pattern" -type f 2>/dev/null | head -1)
    if [[ -z "$matches" ]]; then
        echo "  ❌ Missing: $label"
        ERRORS=$((ERRORS+1))
    else
        echo "  ✅ Found: $label"
    fi
}

check_content() {
    local pattern="$1"
    local search="$2"
    local label="$3"
    local file
    file=$(find "$BASEDIR" -path "$pattern" -type f 2>/dev/null | head -1)
    if [[ -z "$file" ]]; then
        echo "  ❌ File not found for: $label"
        ERRORS=$((ERRORS+1))
    elif ! grep -qi "$search" "$file" 2>/dev/null; then
        echo "  ❌ Not found in file: $label"
        ERRORS=$((ERRORS+1))
    else
        echo "  ✅ Verified: $label"
    fi
}

if [[ -z "$AGENT_NUM" ]]; then
    echo "Usage: ./validate-gate.sh <1-8> [project-name]"
    exit 1
fi

echo "🔍 Validating Gate $AGENT_NUM prerequisites..."
echo ""

case "$AGENT_NUM" in
    1)
        echo "Gate 1 (Stratégie): PRD must exist"
        check_file "*/0. PRD/PRD-${PROJECT}.md" "PRD document"
        ;;
    2)
        echo "Gate 2 (UX): conversion objective, promise v1, proof inventory, primary CTA"
        check_file "*/1. Strat*/pack-strategie-${PROJECT}.md" "Pack stratégie"
        check_content "*/1. Strat*/pack-strategie-${PROJECT}.md" "objectif\|conversion\|KPI" "Conversion objective"
        check_content "*/1. Strat*/pack-strategie-${PROJECT}.md" "promesse\|promise" "Promise v1"
        check_content "*/1. Strat*/pack-strategie-${PROJECT}.md" "PROOF INVENTORY\|proof\|preuve" "Proof inventory"
        check_content "*/1. Strat*/pack-strategie-${PROJECT}.md" "CTA" "Primary CTA"
        ;;
    3)
        echo "Gate 3 (Copy): page specs v1, message architecture, proof inventory"
        check_file "*/2. Arch*/UX-Architecture-*${PROJECT}*.md" "UX Architecture / Page specs"
        check_content "*/1. Strat*/pack-strategie-${PROJECT}.md" "MESSAGE ARCHITECTURE\|architecture.*message" "Message architecture"
        check_content "*/1. Strat*/pack-strategie-${PROJECT}.md" "PROOF INVENTORY\|proof\|preuve" "Proof inventory"
        ;;
    4)
        echo "Gate 4 (UI): copy v1, proof identified, brand constraints"
        check_file "*/3. Contenu*/copy-v1-${PROJECT}.md" "Copy v1"
        check_content "*/1. Strat*/pack-strategie-${PROJECT}.md" "preuve\|proof" "Proof identified"
        ;;
    5)
        echo "Gate 5 (Tech): design brief + tokens.json + handoff + motion strategy + tier confirmed"
        check_file "*/4. Branding*/design-system-v1-${PROJECT}.md" "Design system"
        check_file "*/4. Branding*/tokens.json" "tokens.json"
        check_file "*/4. Branding*/component-handoff-${PROJECT}.md" "Component handoff"
        check_file "*/4. Branding*/motion-strategy-${PROJECT}.md" "Motion strategy"
        check_content "*/4. Branding*/motion-strategy-${PROJECT}.md" "SÉLECTIONNÉ\|sélectionné\|selected" "Animation tier confirmed"
        ;;
    6)
        echo "Gate 6 (QA): tech execution brief, tracking plan"
        check_file "*/5. Technique*/tech-stack-v1-${PROJECT}.md" "Tech stack / execution brief"
        check_content "*/5. Technique*/tech-stack-v1-${PROJECT}.md" "tracking\|analytics\|événement" "Tracking plan"
        ;;
    7)
        echo "Gate 7 (Integration): all 6 agent deliverables must be present"
        check_file "*/1. Strat*/pack-strategie-${PROJECT}.md" "Pack strategie (Agent 1)"
        check_file "*/2. Arch*/UX-Architecture-*${PROJECT}*.md" "UX Architecture (Agent 2)"
        check_file "*/3. Contenu*/copy-v1-${PROJECT}.md" "Copy v1 (Agent 3)"
        check_file "*/4. Branding*/design-system-v1-${PROJECT}.md" "Design system (Agent 4)"
        check_file "*/4. Branding*/tokens.json" "tokens.json (Agent 4)"
        check_file "*/4. Branding*/component-handoff-${PROJECT}.md" "Component handoff (Agent 4)"
        check_file "*/4. Branding*/motion-strategy-${PROJECT}.md" "Motion strategy (Agent 4)"
        check_content "*/4. Branding*/motion-strategy-${PROJECT}.md" "SÉLECTIONNÉ\|sélectionné\|selected\|Tier.*confirmed\|tier.*validé" "Animation tier confirmed"
        check_file "*/5. Technique*/tech-stack-v1-${PROJECT}.md" "Tech stack (Agent 5)"
        check_file "*/6. QA*/qa-report-v1-${PROJECT}.md" "QA report (Agent 6)"
        ;;
    8)
        echo "Gate 8 (Deployment): build success + tech stack + QA go-live + copy v1"
        check_file "*/7. Int*/build-report-${PROJECT}.md" "Build report (Agent 7)"
        check_content "*/7. Int*/build-report-${PROJECT}.md" "READY FOR QA\|ready for qa\|Build status.*success\|SUCCESS" "Build success confirmed"
        check_file "*/7. Int*/implementation-plan-${PROJECT}.md" "Implementation plan (Agent 7)"
        check_file "*/5. Technique*/tech-stack-v1-${PROJECT}.md" "Tech stack (Agent 5)"
        check_content "*/5. Technique*/tech-stack-v1-${PROJECT}.md" "deploy\|Deploy\|hosting\|Hosting\|hébergement" "Deployment section present"
        check_file "*/6. QA*/qa-report-v1-${PROJECT}.md" "QA report (Agent 6)"
        check_content "*/6. QA*/qa-report-v1-${PROJECT}.md" "GO\|go-live\|GO avec réserves" "GO-LIVE gate status"
        check_file "*/3. Contenu*/copy-v1-${PROJECT}.md" "Copy v1 (Agent 3 — for CMS seeding and meta verification)"
        ;;
    *)
        echo "Unknown agent: $AGENT_NUM. Use 1-8."
        exit 1
        ;;
esac

echo ""
if [[ "$ERRORS" -gt 0 ]]; then
    echo "🚫 Gate $AGENT_NUM FAILED — $ERRORS prerequisite(s) missing"
    exit 1
else
    echo "✅ Gate $AGENT_NUM PASSED — all prerequisites met"
    exit 0
fi
