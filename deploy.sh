#!/bin/bash
# Rebuild index.html and commit for GitHub Pages
cd "$(dirname "$0")"
./serve.sh --build
git add index.html
git commit -m "Rebuild index.html"
