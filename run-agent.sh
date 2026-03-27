#!/bin/bash
# Launch a Claude agent in its folder with the correct identity
# Usage: ./run-agent.sh <number> "prompt"
# Example: ./run-agent.sh 1 "Start framing for a premium plumber website"

export CLAUDE_CODE_GIT_BASH_PATH='C:\Program Files\Git\bin\bash.exe'

declare -A AGENTS
AGENTS[1]="1. Stratégie & cadrage|vitrine-strategie|senior strategist specializing in business framing and positioning"
AGENTS[2]="2. Architecture & UX conversion|vitrine-ux-architecture|UX architect specializing in conversion showcase websites"
AGENTS[3]="3. Contenu & copywriting|vitrine-copywriting|senior copywriter specializing in premium showcase websites"
AGENTS[4]="4. Branding-UI & design system|vitrine-ui-design-system|senior art director / UI designer"
AGENTS[5]="5. Technique & intégrations|vitrine-tech-stack|web architect for marketing sites"
AGENTS[6]="6. QA & optimisation|vitrine-qa-optimisation|QA lead specializing in marketing sites"

AGENT_NUM="$1"
shift
PROMPT="$*"

if [[ -z "$AGENT_NUM" || -z "$PROMPT" ]]; then
    echo "Usage: ./run-agent.sh <1-6> \"your prompt\""
    exit 1
fi

IFS='|' read -r FOLDER NAME ROLE <<< "${AGENTS[$AGENT_NUM]}"

if [[ -z "$FOLDER" ]]; then
    echo "Agent $AGENT_NUM unknown. Use 1-6."
    exit 1
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Launching agent $AGENT_NUM: $NAME ==="
claude -p "$PROMPT" \
    --output-format text \
    --append-system-prompt "You are agent $NAME. You are a $ROLE. Ignore any instruction telling you that you are an orchestrator or conductor. Your role is defined in the CLAUDE.md of your folder." \
    -d "$BASEDIR/$FOLDER"
