#!/bin/bash
# Start local server for the meal plan viewer
cd "$(dirname "$0")"
echo "Opening http://localhost:8079/plans/"
open "http://localhost:8079/plans/" 2>/dev/null || true
python3 -m http.server 8079
