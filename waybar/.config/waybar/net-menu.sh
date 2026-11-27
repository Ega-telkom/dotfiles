#!/bin/sh

pick() {
    data=$1; shift
    n=$(printf '%s\n' "$data" | wc -l)
    [ "$n" -gt 8 ] && n=8
    printf '%s\n' "$data" | fuzzel --dmenu --lines "$n" "$@"
}

devs=$(nmcli -t -f DEVICE,TYPE,STATE dev \
  | awk -F: '$2=="ethernet"||$2=="wifi"{print $1"  "$2"  "$3}')
sel=$(pick "$devs") || exit
set -- $sel
dev=$1 type=$2

if [ "$type" = ethernet ]; then
    if nmcli -t -f DEVICE,STATE dev | grep -q "^$dev:connected"; then
        nmcli dev disconnect "$dev"
    else
        nmcli dev connect "$dev"
    fi
    exit
fi

nmcli dev wifi rescan ifname "$dev" 2>/dev/null
list=$(nmcli -t -e no -f IN-USE,SIGNAL,SECURITY,SSID dev wifi list ifname "$dev" \
  | grep -v ':$' | sort -t: -k2,2 -nr)
rows=$(printf '%s\n' "$list" | while IFS=: read -r use sig sec ssid; do
    printf '%s %3s%%  %-8s %s\n' "${use:- }" "$sig" "${sec:---}" "$ssid"
done)

i=$(pick "$rows" --index) || exit
IFS=: read -r use sig sec ssid <<EOF
$(printf '%s\n' "$list" | sed -n "$((i+1))p")
EOF

if [ "$use" = "*" ]; then
    nmcli dev disconnect "$dev"
    exit
fi

nmcli con up id "$ssid" ifname "$dev" 2>/dev/null && exit

if [ -n "$sec" ]; then
    pass=$(echo | fuzzel --dmenu --lines 0 --password --prompt "pass: ") || exit
    nmcli dev wifi connect "$ssid" ifname "$dev" password "$pass"
else
    nmcli dev wifi connect "$ssid" ifname "$dev"
fi
