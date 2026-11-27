#!/bin/sh
lock=300 off=360 sus=900

if ls /sys/class/power_supply/BAT* >/dev/null 2>&1; then
    lock=180 off=240 sus=600
fi

exec swayidle -w \
    timeout "$lock" 'veila lock --daemonize --wait-ready' \
    timeout "$off" 'niri msg action power-off-monitors' \
    timeout "$sus" 'systemctl suspend' \
    before-sleep 'veila lock --daemonize --wait-ready'
