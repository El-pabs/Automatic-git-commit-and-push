### README.md

[![Version Française](https://img.shields.io/badge/Version%20Française-Click%20Here-blue)](#version-française-du-readmemd)

![](https://komarev.com/ghpvc/?username=El-pabs&style=flat-square)


#### English Version

# Auto Commit and Push

A GitHub project that automatically commits and pushes all changes that happen in your directory every 6 hours.
Greatly inspired from [this repo](https://github.com/gitwatch/gitwatch) from [gitwatch](https://github.com/gitwatch)

## Prerequisites

- [Cygwin](https://www.cygwin.com/) installed on your Windows machine.
- Git installed and configured with your GitHub repository.
- MinGW (Minimalist GNU for Windows) installed to compile C programs.

## Setup

### Step 1: Install Dependencies

#### Install Cygwin

1. Download the Cygwin setup executable from the official website: https://www.cygwin.com/
2. Run the setup and select the required packages during installation, including the "Base" packages that contain bash.

#### Install MinGW

1. Download the MinGW installer from the official website: https://sourceforge.net/projects/mingw/
2. Run the installer and follow the on-screen instructions to install MinGW.
3. During installation, select the `mingw32-base` and `mingw32-gcc-g++` packages.
4. Add the MinGW `bin` directory (e.g., `C:\MinGW\bin`) to your system's `PATH` environment variable.
   To do this, search for "Environment Variables" in the Start menu, click on Edit the system environment variables, then add the path to the Path variable

### Step 2: Clone the Repository

Clone this repository to your local machine.

```bash
git clone https://github.com/El-pabs/Automatic-git-commit-and-push.git
```

### Step 3: Compile the C Program

1. Create a new file named `startup_program.c` and copy the provided C code into it.
2.  Make sur to change the `username` part here : `#define DEFAULT_BAT_PATH "C:\\cygwin64\\home\\username\\auto_commiter\\run_script.bat"`
3. Open the Command Prompt and navigate to the directory containing `startup_program.c`.
4. Compile the program using the following command:

```
gcc startup_program.c -o startup_program.exe
```

This will create an executable file named `startup_program.exe`.

### Step 4: Configure the Script

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

### Step 5: Configure the Startup Script

1. Create a new folder named `auto_commit_push` in your Cygwin home directory (e.g., `C:\cygwin64\home\yourusername`).
2. Move the `auto_commit_push.sh`, `run_script.bat` and `startup_program.exe` files into the `auto_commit_push` folder.
3. Modify the batch file named `run_script.bat` by making sure to replace `yourusername` with your actual Windows username :

```batch
@echo off
setlocal
set CYGWIN_BIN=C:\cygwin64\bin
set STARTUP_PROGRAM=C:\cygwin64\home\yourusername\auto_commit_push\startup_program.exe
%STARTUP_PROGRAM%
set CYGWIN_SCRIPT_WIN=C:\cygwin64\home\yourusername\auto_commit_push\auto_commit_push.sh
for /f "delims=" %%A in ('%CYGWIN_BIN%\cygpath.exe -u "%CYGWIN_SCRIPT_WIN%"') do set CYGWIN_SCRIPT_UNIX=%%A
endlocal & %CYGWIN_BIN%\bash --login -c "%CYGWIN_SCRIPT_UNIX%"
pause
```


### Step 6: Add the Program to Windows Startup

1. Press `Windows + R` to open the Run dialog, type `shell:startup`, and press Enter. This will open the Startup folder.
2. Right-click in the Startup folder, select `New > Shortcut`.
3. In the "Create Shortcut" window, enter the full path to your `run_script.bat` file (e.g., `C:\cygwin64\home\yourusername\auto_commit_push\run_script.bat`).
4. Click `Next`, give the shortcut a name, and click `Finish`.

### Step 7: Verify the Setup

Restart your computer to ensure that the `startup_program.exe` runs automatically at startup and executes the `run_script.bat` file, which in turn runs the `auto_commit_push.sh` script every 2 hours.

---

### Version Française du README.md

# Auto Commit and Push

Un projet GitHub qui effectue automatiquement des commits et des pushs de toutes les modifications qui se sont produits dans votre répertoire toutes les 6 heures.
Grandement inspiré de [ce repo](https://github.com/gitwatch/gitwatch) de [gitwatch](https://github.com/gitwatch)

## Prérequis

- [Cygwin](https://www.cygwin.com/) installé sur votre machine Windows.
- Git installé et configuré avec votre dépôt GitHub.
- MinGW (Minimalist GNU for Windows) installé pour compiler les programmes C.

## Configuration

### Étape 1 : Installer les Dépendances

#### Installer Cygwin

1. Téléchargez l'exécutable d'installation de Cygwin depuis le site officiel : https://www.cygwin.com/
2. Exécutez l'installation et sélectionnez les packages requis, y compris les packages "Base" qui contiennent bash.

#### Installer MinGW

1. Téléchargez l'installateur MinGW depuis le site officiel : https://sourceforge.net/projects/mingw/
2. Exécutez l'installateur et suivez les instructions à l'écran pour installer MinGW.
3. Pendant l'installation, sélectionnez les packages `mingw32-base` et `mingw32-gcc-g++`.
4. Ajoutez le répertoire `bin` de MinGW (par exemple, `C:\MinGW\bin`) à la variable d'environnement `PATH` de votre système.
   Pour ce faire, recherchez "Variables d'environnement" dans le menu Démarrer, cliquez sur Modifier les variables d'environnement, puis ajoutez le chemin à la variable Path.

### Étape 2 : Cloner le Répertoire

Clonez ce répertoire sur votre machine locale.

```bash
git clone https://github.com/El-pabs/Automatic-git-commit-and-push.git
```

### Étape 3 : Compiler le Programme C

1. Créez un nouveau fichier nommé `startup_program.c` et copiez-y le code C fourni.
2. Changez la valeur `username` du code qui se situe ici : `#define DEFAULT_BAT_PATH "C:\\cygwin64\\home\\username\\auto_commiter\\run_script.bat"`
3. Ouvrez l'invite de commandes et naviguez jusqu'au répertoire contenant `startup_program.c`.
4. Compilez le programme en utilisant la commande suivante :

```
gcc startup_program.c -o startup_program.exe
```

Cela créera un fichier exécutable nommé `startup_program.exe`.

### Étape 4 : Configurer le Script

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

### Étape 5 : Configurer le Script de Démarrage

1. Créez un nouveau dossier nommé `auto_commit_push` dans votre répertoire home Cygwin (par exemple, `C:\cygwin64\home\yourusername`).
2. Déplacez les fichiers `auto_commit_push.sh`, `run_script.bat` et `startup_program.exe` dans le dossier `auto_commit_push`.
3. Modifiez le fichier batch nommé `run_script.bat` dans le même dossier avec le contenu suivant :

```batch
@echo off
setlocal
set CYGWIN_BIN=C:\cygwin64\bin
set STARTUP_PROGRAM=C:\cygwin64\home\yourusername\auto_commit_push\startup_program.exe
%STARTUP_PROGRAM%
set CYGWIN_SCRIPT_WIN=C:\cygwin64\home\yourusername\auto_commit_push\auto_commit_push.sh
for /f "delims=" %%A in ('%CYGWIN_BIN%\cygpath.exe -u "%CYGWIN_SCRIPT_WIN%"') do set CYGWIN_SCRIPT_UNIX=%%A
endlocal & %CYGWIN_BIN%\bash --login -c "%CYGWIN_SCRIPT_UNIX%"
pause
```

Assurez-vous de remplacer `yourusername` par votre nom d'utilisateur Windows réel.

### Étape 6 : Ajouter le Programme au Démarrage de Windows

1. Appuyez sur `Windows + R` pour ouvrir la boîte de dialogue Exécuter, tapez `shell:startup`, et appuyez sur Entrée. Cela ouvrira le dossier de démarrage.
2. Faites un clic droit dans le dossier de démarrage, sélectionnez `Nouveau > Raccourci`.
3. Dans la fenêtre "Créer un raccourci", entrez le chemin complet vers votre fichier `run_script.bat` (par exemple, `C:\cygwin64\home\yourusername\auto_commit_push\run_script.bat`).
4. Cliquez sur `Suivant`, donnez un nom au raccourci, et cliquez sur `Terminer`.

### Étape 7 : Vérifier la Configuration

Redémarrez votre ordinateur pour vous assurer que `startup_program.exe` se lance automatiquement au démarrage et exécute le fichier `run_script.bat`, qui à son tour exécute le script `auto_commit_push.sh` toutes les 2 heures.

Exécutez le fichier batch manuellement pour vous assurer qu'il fonctionne correctement avant de compter sur le Planificateur de Tâches.

```batch
run_script.bat
```
