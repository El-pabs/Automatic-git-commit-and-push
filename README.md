### README.md

[![Version Française](https://img.shields.io/badge/Version%20Française-Click%20Here-blue)](#version-française-du-readmemd)

![](https://komarev.com/ghpvc/?username=El-pabs&style=flat-square)


#### English Version

# Auto Commit and Push

A GitHub project that automatically commits and pushes all changes that happen in your directory every 6 hours.

## Prerequisites

- [Cygwin](https://www.cygwin.com/) installed on your Windows machine.
- Git installed and configured with your GitHub repository.

## Setup

### Step 1: Clone the Repository

Clone this repository to your local machine.

```bash
git clone https://github.com/yourusername/Automatic-git-commit-and-push.git
```

### Step 2: Configure the Script

Edit the `auto_commit_push.sh` script to specify the directory you want to monitor and the Git branch you want to use.

You can do that by changing : 
-` WATCHED_DIR = ""` 
-` BRANCH = ""`

```bash
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
```


### Step 3: put your files in the right folder

Here's a path to go to the home path directly, then just click on your username directory : `C:\cygwin64\home`
Create a folder named : `auto_commit_push` and put the `auto_commit_push.sh` and `run_script.bat` files in it. 

Now change the `run_script.bat` file by changing the value of `CYGWIN_SCRIPT_WIN` to the absolute path of your `auto_commit_push.sh` file

```batch
@echo off
setlocal
set CYGWIN_BIN=C:\cygwin64\bin
set CYGWIN_SCRIPT_WIN=C:\cygwin64\home\yourusername\auto_commit_push\auto_commit_push.sh
for /f "delims=" %%A in ('%CYGWIN_BIN%\cygpath.exe -u "%CYGWIN_SCRIPT_WIN%"') do set CYGWIN_SCRIPT_UNIX=%%A
endlocal & %CYGWIN_BIN%\bash --login -c "%CYGWIN_SCRIPT_UNIX%"
pause
```


### Step 4: Configure Task Scheduler

1. Open Task Scheduler by pressing `Windows + R`, typing `taskschd.msc`, and pressing `Enter`.
2. Click on "Create Task" in the right pane.
3. Name your task, for example, "Auto Commit and Push".
4. Check "Run with highest privileges".
5. Go to the "Triggers" tab and click "New...".
   - Set "Begin the task" to "On start".
   - Set "Repeat task every" to "6 hours".
   - set "End after" to "30 minutes".
   - Click "OK".
6. Go to the "Actions" tab and click "New...".
   - Set "Action" to "Start a program".
   - Browse to and select your `run_script.bat` file.
   - Click "OK".
7. Go to the "Condition" tab and click on run only when plugged-in to unselect it, then click to only work if connected to internet to select it.
8. Click "OK" to create the task.

### Step 5: Verify the Setup

Run the batch file manually to ensure it works correctly before relying on the Task Scheduler.

```batch
run_script.bat
```

---

### Version Française du README.md

# Auto Commit and Push

Un projet GitHub qui effectue automatiquement des commits et des pushs de toutes les modifications qui se sont produits dans votre répertoire toutes les 6 heures.

## Prérequis

- [Cygwin](https://www.cygwin.com/) installé sur votre machine Windows.
- Git installé et configuré avec votre dépôt GitHub.

## Configuration

### Étape 1 : Cloner le Répertoire

Clonez ce répertoire sur votre machine locale.

```bash
git clone https://github.com/yourusername/Automatic-git-commit-and-push.git
```

### Étape 2 : Configurer le Script

Modifiez le script `auto_commit_push.sh` pour spécifier le répertoire que vous souhaitez surveiller et la branche Git que vous souhaitez utiliser.

Vous pouvez le faire en changeant :
- `WATCHED_DIR = ""`
- `BRANCH = "" `

```bash
#!/bin/bash

# Répertoire à surveiller
# yourusername est le nom d'utilisateur actuel, vous pouvez le trouver en allant dans C:\Users
WATCHED_DIR="/cygdrive/c/Users/yourusername/YourDirectory"

# Branche Git à laquelle pousser
BRANCH="main"

# Fonction pour effectuer git add, commit et push
commit_and_push() {
    cd "$WATCHED_DIR" || exit
    git add -A
    git commit -m "Auto commit on change detected at $(date)"
    git push origin "$BRANCH"
}

# Vérifier et tirer les modifications du dépôt distant
cd "$WATCHED_DIR" || exit
git pull origin "$BRANCH"

# Vérifier s'il y a des modifications à pousser
if ! git diff-index --quiet HEAD --; then
    echo "Modifications détectées. Committing et poussant les modifications..."
    commit_and_push
else
    echo "Aucune modification détectée."
fi
```

### Étape 3 : Mettre vos fichiers dans le bon dossier

Voici un chemin pour aller directement au chemin d'accueil, puis cliquez simplement sur le répertoire de votre nom d'utilisateur : `C:\cygwin64\home`
Créez un dossier nommé : `auto_commit_push` et mettez-y les fichiers `auto_commit_push.sh` et `run_script.bat`.

Maintenant, changez le fichier `run_script.bat` en modifiant la valeur de `CYGWIN_SCRIPT_WIN` par le chemin absolu de votre fichier `auto_commit_push.sh`

```batch
@echo off
setlocal
set CYGWIN_BIN=C:\cygwin64\bin
set CYGWIN_SCRIPT_WIN=C:\cygwin64\home\yourusername\auto_commit_push\auto_commit_push.sh
for /f "delims=" %%A in ('%CYGWIN_BIN%\cygpath.exe -u "%CYGWIN_SCRIPT_WIN%"') do set CYGWIN_SCRIPT_UNIX=%%A
endlocal & %CYGWIN_BIN%\bash --login -c "%CYGWIN_SCRIPT_UNIX%"
pause
```

### Étape 4 : Configurer le Planificateur de Tâches

1. Ouvrez le Planificateur de Tâches en appuyant sur `Windows + R`, en tapant `taskschd.msc`, et en appuyant sur `Entrée`.
2. Cliquez sur "Créer une tâche" dans le volet de droite.
3. Nommez votre tâche, par exemple, "Auto Commit and Push".
4. Cochez "Exécuter avec les privilèges les plus élevés".
5. Allez dans l'onglet "Déclencheurs" et cliquez sur "Nouveau...".
   - Réglez "Commencer la tâche" sur "Au démarrage".
   - Réglez "Répéter la tâche toutes les" sur "6 heures".
   - Réglez "Arrêter après" sur "30 minutes".
   - Cliquez sur "OK".
6. Allez dans l'onglet "Actions" et cliquez sur "Nouveau...".
   - Réglez "Action" sur "Démarrer un programme".
   - Parcourez et sélectionnez votre fichier `run_script.bat`.
   - Cliquez sur "OK".
7. Allez dans l'onglet "Condition" et déséléctionner la case ne démarrer la tâche que si l'ordinateur est relié au secteur et selectionner la case démarrer qui si connecter au réseau
8. Cliquez sur "OK" pour créer la tâche.

### Étape 5 : Vérifier la Configuration

Exécutez le fichier batch manuellement pour vous assurer qu'il fonctionne correctement avant de compter sur le Planificateur de Tâches.

```batch
run_script.bat
```
