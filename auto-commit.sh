#!/bin/bash

# check if there are changes to be added
if git diff --exit-code && git diff --cached --exit-code; then
  echo "no changes to commit."
  exit 0
fi

# function to add, commit, and push a file
commit_file() {
  file=$1
  msg=$2

  git add "$file"
  git commit -m "$msg"
  echo "file '$file' has been added and committed with the message: '$msg'"
}

echo "adding and committing each file individually..."

# modified and deleted files
for file in $(git status --porcelain | grep -E '^( M| D)' | awk '{print $2}'); do
  if [[ -f $file ]]; then
    commit_file "$file" "modified: $file"
  else
    git rm "$file"
    git commit -m "removed: $file"
    echo "file '$file' has been removed and committed."
  fi
done

# untracked files
for file in $(git status --porcelain | grep '^??' | awk '{print $2}'); do
  commit_file "$file" "new file: $file"
done

# push to the main branch
echo "pushing to the main branch..."
git push origin main

echo "process completed successfully!"

