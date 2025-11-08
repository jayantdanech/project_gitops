#!/bin/bash
set -e

source_branch=$1
target_branch=$2

if [ -z "$source_branch" ] || [ -z "$target_branch" ]; then
  echo "Usage: ./scripts/promote.sh <source_branch> <target_branch>"
  exit 1
fi

echo "Promoting from $source_branch → $target_branch..."
git checkout $target_branch
git merge --no-ff $source_branch -m "Promote $source_branch to $target_branch"
git push origin $target_branch

echo "Promotion complete."

