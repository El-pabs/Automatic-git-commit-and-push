#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <windows.h>

#define INTERVAL 7200 // Intervalle de 2 heures en secondes
#define DEFAULT_BAT_PATH "C:\\cygwin64\\home\\robin\\auto_commiter\\run_script.bat"

void executeBatFile(const char *batPath) {
    char command[512];
    sprintf(command, "\"%s\"", batPath); // Construire la commande à exécuter
    system(command); // Exécuter le fichier .bat
}

int main() {
    char batPath[256] = DEFAULT_BAT_PATH; // Initialiser avec la valeur par défaut
    time_t lastRun = 0;

    printf("Entrez le chemin complet vers le fichier .bat (ou appuyez sur Entrée pour '%s') : ", DEFAULT_BAT_PATH);
    fgets(batPath, sizeof(batPath), stdin);
    batPath[strcspn(batPath, "\n")] = 0; // Supprimer le caractère de nouvelle ligne

    // Si l'utilisateur a appuyé sur Entrée sans saisir de chemin, batPath contient la valeur par défaut
    if (strlen(batPath) == 0) {
        strcpy(batPath, DEFAULT_BAT_PATH);
    }

    while (1) {
        time_t currentTime = time(NULL);
        if (difftime(currentTime, lastRun) >= INTERVAL) {
            executeBatFile(batPath);
            lastRun = currentTime;
        }
        Sleep(1000); // Attendre 1 seconde avant de vérifier à nouveau
    }

    return 0;
}