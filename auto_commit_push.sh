#!/bin/bash

# Directory to watch
# yourusername is the current user username, you can find it by going to C:\Users
WATCHED_DIR="/cygdrive/c/Users/yourusername/YourDirectory"

# Git branch to push to
BRANCH="main"

# Function to perform git add, commit, and push
commit_and_push() {
    cd "$WATCHED_DIR" || exit
    git add -A
    git commit -m "Auto commit on change detected at $(date)"
    git push origin "$BRANCH"
}

# Check and pull changes from the remote repository
cd "$WATCHED_DIR" || exit
git pull origin "$BRANCH"

# Check if there are changes to push
if ! git diff-index --quiet HEAD --; then
    echo "Changes detected. Committing and pushing changes..."
    commit_and_push
else
    echo "No changes detected."
fi
