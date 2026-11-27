#!/bin/sh
check() {
    src=$(pactl list short sources | awk -v n="$(pactl get-default-source)" '$2==n{print $1}')
    if pactl list short source-outputs | awk -v s="$src" '$2==s{f=1} END{exit !f}'; then
        echo "[MIC*]"
    else
        echo ""
    fi
}

check
pactl subscribe | grep --line-buffered "source-output" | while read -r _; do check; done
