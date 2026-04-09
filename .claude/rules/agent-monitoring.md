---
description: Mandatory 10-minute health check when launching background pipeline agents.
---

# Agent Monitoring

**ALWAYS** launch a monitoring bash script alongside every background pipeline agent.

## Pattern

When launching `Agent(run_in_background: true)` for any pipeline agent (1-8):

1. Launch the agent in background
2. In the **same message**, launch this monitor in background via Bash:

```bash
bash -c '
DIR="$1"; NAME="$2"; INTERVAL=600; CHECKS=6; last=0; c=0
while [ $c -lt $CHECKS ]; do
  sleep $INTERVAL; c=$((c+1))
  if [ -d "$DIR" ]; then
    n=$(ls -1 "$DIR" 2>/dev/null | wc -l)
    s=$(du -sb "$DIR" 2>/dev/null | cut -f1)
  else n=0; s=0; fi
  t=$(date +%H:%M:%S)
  if [ "$n" -gt 0 ]; then
    echo "[$t] CHECK $c — $NAME: $n file(s), ${s}B"
    [ "$s" -eq "$last" ] && [ "$last" -gt 0 ] && echo "[$t] ⚠️ STALL detected — no change since last check"
  else
    echo "[$t] CHECK $c — $NAME: no files yet"
  fi
  last=$s
done
echo "[$(date +%H:%M:%S)] Monitor ended"
' _ "$TARGET_DIR" "$AGENT_NAME"
```

Replace `$TARGET_DIR` with the agent's output folder and `$AGENT_NAME` with a label.

## Rules

- **NEVER** launch a background pipeline agent without its monitor
- Monitor runs 6 checks × 10 min = 60 min max
- If monitor reports STALL after agent has written files → investigate the agent output file
- For heavy agents (4, 7): acceptable to see "no files yet" for first 2-3 checks (reading phase)
