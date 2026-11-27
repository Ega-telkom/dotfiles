#!/bin/sh
check() {
    if [ "$(niri msg --json casts | jq length)" -gt 0 ]; then
        echo "[REC*]"
    else
        echo ""
    fi
}

check
niri msg --json event-stream \
  | grep --line-buffered -E '"Cast(sChanged|StartedOrChanged|Stopped)"' \
  | while read -r _; do check; done
