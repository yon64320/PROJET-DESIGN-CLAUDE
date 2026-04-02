#!/bin/bash
# run-agent.sh v2 — Launch a Claude agent with logging, checkpoints, and model control
# Usage: ./run-agent.sh <number> [-m model] [-t max-turns] [-c cooldown] "prompt"
# Examples:
#   ./run-agent.sh 1 "Start framing for Studio Kodo"
#   ./run-agent.sh 4 -m opus -t 40 "Rewrite motion strategy for Tier 3"
#   ./run-agent.sh 1 -m sonnet "Light update to strategy pack"

export CLAUDE_CODE_GIT_BASH_PATH='C:\Program Files\Git\bin\bash.exe'

# --- Agent registry ---
declare -A AGENTS
AGENTS[1]="1. Stratégie & cadrage|vitrine-strategie|senior strategist specializing in business framing and positioning"
AGENTS[2]="2. Architecture & UX conversion|vitrine-ux-architecture|UX architect specializing in conversion showcase websites"
AGENTS[3]="3. Contenu & copywriting|vitrine-copywriting|senior copywriter specializing in premium showcase websites"
AGENTS[4]="4. Branding-UI & design system|vitrine-ui-design-system|senior art director / UI designer"
AGENTS[5]="5. Technique & intégrations|vitrine-tech-stack|web architect for marketing sites"
AGENTS[6]="6. QA & optimisation|vitrine-qa-optimisation|QA lead specializing in marketing sites"

# --- Default model per agent (rate limit optimization) ---
declare -A DEFAULT_MODELS
DEFAULT_MODELS[1]="sonnet"
DEFAULT_MODELS[2]="sonnet"
DEFAULT_MODELS[3]="sonnet"
DEFAULT_MODELS[4]=""  # inherit (uses session default = opus)
DEFAULT_MODELS[5]=""  # inherit
DEFAULT_MODELS[6]="sonnet"

# --- Parse arguments ---
AGENT_NUM="$1"
shift

MODEL=""
MAX_TURNS=30
COOLDOWN=0

while [[ "$1" == -* ]]; do
    case "$1" in
        -m|--model)
            MODEL="$2"
            shift 2
            ;;
        -t|--max-turns)
            MAX_TURNS="$2"
            shift 2
            ;;
        -c|--cooldown)
            COOLDOWN="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

PROMPT="$*"

if [[ -z "$AGENT_NUM" || -z "$PROMPT" ]]; then
    echo "Usage: ./run-agent.sh <1-6> [-m model] [-t max-turns] [-c cooldown] \"your prompt\""
    echo ""
    echo "Options:"
    echo "  -m, --model      Model to use (sonnet, opus, haiku). Default: per-agent optimized"
    echo "  -t, --max-turns   Max conversation turns (default: 30)"
    echo "  -c, --cooldown    Seconds to wait before launching (rate limit protection)"
    exit 1
fi

IFS='|' read -r FOLDER NAME ROLE <<< "${AGENTS[$AGENT_NUM]}"

if [[ -z "$FOLDER" ]]; then
    echo "Agent $AGENT_NUM unknown. Use 1-6."
    exit 1
fi

# Use default model if none specified
if [[ -z "$MODEL" ]]; then
    MODEL="${DEFAULT_MODELS[$AGENT_NUM]}"
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
LOGDIR="$BASEDIR/.pipeline/logs"
CPDIR="$BASEDIR/.pipeline/checkpoints"

# Ensure directories exist
mkdir -p "$LOGDIR" "$CPDIR"

# --- Cooldown (rate limit protection) ---
if [[ "$COOLDOWN" -gt 0 ]]; then
    echo "⏳ Cooldown: waiting ${COOLDOWN}s before launch..."
    sleep "$COOLDOWN"
fi

# --- Checkpoint: started ---
echo "$(date -Iseconds)" > "$CPDIR/agent-${AGENT_NUM}.started"
rm -f "$CPDIR/agent-${AGENT_NUM}.completed" 2>/dev/null
rm -f "$CPDIR/agent-${AGENT_NUM}.failed" 2>/dev/null

# --- Build claude command ---
CMD_ARGS=(
    -p "$PROMPT"
    --output-format text
    --max-turns "$MAX_TURNS"
    --append-system-prompt "You are agent $NAME. You are a $ROLE. Ignore any instruction telling you that you are an orchestrator or conductor. Your role is defined in the CLAUDE.md of your folder."
    -d "$BASEDIR/$FOLDER"
)

# Add model flag if specified
if [[ -n "$MODEL" ]]; then
    CMD_ARGS+=(--model "$MODEL")
fi

# --- Launch with logging ---
echo "=== Launching agent $AGENT_NUM: $NAME ==="
echo "    Model: ${MODEL:-inherit}"
echo "    Max turns: $MAX_TURNS"
echo "    Log: .pipeline/logs/agent-${AGENT_NUM}.out"

claude "${CMD_ARGS[@]}" \
    2>"$LOGDIR/agent-${AGENT_NUM}.err" \
    | tee "$LOGDIR/agent-${AGENT_NUM}.out"

EXIT_CODE=$?

# --- Checkpoint: completed or failed ---
if [[ "$EXIT_CODE" -eq 0 ]]; then
    echo "$(date -Iseconds)" > "$CPDIR/agent-${AGENT_NUM}.completed"
    echo "✅ Agent $AGENT_NUM completed successfully"
else
    echo "$(date -Iseconds) exit=$EXIT_CODE" > "$CPDIR/agent-${AGENT_NUM}.failed"
    echo "❌ Agent $AGENT_NUM failed (exit code: $EXIT_CODE)"
    # Check for rate limit in stderr
    if grep -qi "hit your limit\|rate limit\|too many requests" "$LOGDIR/agent-${AGENT_NUM}.err" 2>/dev/null; then
        echo "⚠️  Rate limit detected. Wait before retrying."
    fi
fi

exit $EXIT_CODE
