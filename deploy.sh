#!/bin/sh

set -eu

branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$branch" != "main" ]; then
  echo "Cannot deploy from branch $branch; switch to main first"
  exit 2
fi

git branch -D gh-pages 2>/dev/null || true
git checkout -b gh-pages
git push -u --force origin gh-pages:gh-pages
git checkout main
