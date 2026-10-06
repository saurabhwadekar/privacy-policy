#!/usr/bin/env bash
# Fills the list in index.html with a link to every folder that has an index.html.
# The link text is taken from that page's <title>.
# Folders starting with "." or "_" and the "scripts" folder are skipped.
set -euo pipefail

cd "$(dirname "$0")/.."

items=""
for dir in */; do
  name="${dir%/}"
  case "$name" in
    .*|_*|scripts) continue ;;
  esac
  [ -f "$name/index.html" ] || continue

  title=$(sed -n 's:.*<title>\(.*\)</title>.*:\1:p' "$name/index.html" | head -n 1)
  [ -n "$title" ] || title="$name"

  items+="      <li><a href=\"$name/\">$title</a></li>"$'\n'
done

awk -v items="$items" '
  /<!-- LIST:START -->/ { print; printf "%s", items; skip = 1; next }
  /<!-- LIST:END -->/   { skip = 0 }
  !skip
' index.html > index.html.tmp
mv index.html.tmp index.html

echo "index.html updated:"
printf "%s" "$items"
