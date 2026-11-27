#!/bin/sh
kind=$1

pick() {
    data=$1; shift
    n=$(printf '%s\n' "$data" | wc -l)
    [ "$n" -gt 8 ] && n=8
    printf '%s\n' "$data" | fuzzel --dmenu --lines "$n" "$@"
}

default=$(pactl get-default-"$kind")
list=$(pactl list "${kind}s" \
  | awk '/^[ \t]+Name: /{sub(/^[ \t]+Name: /,""); n=$0}
         /^[ \t]+Description: /{sub(/^[ \t]+Description: /,""); print n"\t"$0}' \
  | grep -v '\.monitor')
rows=$(printf '%s\n' "$list" \
  | awk -F'\t' -v d="$default" '{printf "%s %s\n", ($1==d?"*":" "), $2}')

i=$(pick "$rows" --index) || exit
name=$(printf '%s\n' "$list" | sed -n "$((i+1))p" | cut -f1)
pactl set-default-"$kind" "$name"
