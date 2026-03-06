#!/bin/bash
# Generate index.html from viewer.html template, optionally start local server
cd "$(dirname "$0")"

# Build JSON array of plan filenames (newest first)
plans_json="["
first=true
for f in $(ls -r plans/*.json 2>/dev/null); do
  name=$(basename "$f")
  if [ "$first" = true ]; then
    first=false
  else
    plans_json+=","
  fi
  plans_json+="\"$name\""
done
plans_json+="]"

# Generate index.html by replacing the placeholder in viewer.html
sed "s|__PLANS_DATA__|$plans_json|" viewer.html > index.html

count=$(ls plans/*.json 2>/dev/null | wc -l | tr -d ' ')
echo "Generated index.html with $count plan(s)"

if [ "$1" = "--build" ]; then
  exit 0
fi

echo "Opening http://localhost:8079"
open "http://localhost:8079" 2>/dev/null || true
python3 -m http.server 8079
