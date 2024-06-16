#!/bin/bash

# Répertoire à surveiller
WATCHED_DIR=$(cygpath -w /cygdrive/c/Users/robin/Downloads/Cours)

# Branche Git à utiliser
BRANCH="Cours"

# Fonction pour ajouter, commit et push
commit_and_push() {
    cd "$WATCHED_DIR" || exit
    git add -A
    git commit -m "Auto commit on change detected at $(date)"
    git push origin "$BRANCH"
}

# Vérifier et tirer les changements du dépôt distant
cd "$WATCHED_DIR" || exit
git pull origin "$BRANCH"

# Vérifier s'il y a des changements à pousser
if ! git diff-index --quiet HEAD --; then
    echo "Changes detected. Committing and pushing changes..."
    commit_and_push
else
    echo "No changes detected."
fi