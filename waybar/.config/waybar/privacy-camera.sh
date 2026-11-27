#!/bin/sh
check() {
    if pw-dump | jq -e 'any(.[]; .info.props["media.class"]=="Video/Source" and .info.state=="running")' >/dev/null; then
        echo "[CAM*]"
    else
        echo ""
    fi
}

last="x"
emit() {
    out=$(check)
    if [ "$out" != "$last" ]; then
        echo "$out"
        last=$out
    fi
}

emit
pw-dump -m -N \
  | jq -c --unbuffered 'select(any(.[]; .type=="PipeWire:Interface:Node")) | 1' \
  | while read -r _; do
        emit
        sleep 0.5
    done
