                   ______          _      _    ______             _                 
                   | ___ \        (_)    | |   | ___ \           | |                
                   | |_/ / __ ___  _  ___| |_  | |_/ / __ _ ___  | |__              
                   |  __/ '__/ _ \| |/ _ \ __| | ___ \/ _\`/ __\ | '_  \             
                   | |  | | | (_) | |  __/ |_  | |_/ / (_| \__ \ | | | |           
                   \_|  |_|  \___/| |\___|\__| \____/ \__,_|___/_| |_|_|            
                                 _/ |                                             
                                |__/                                              
                 THIS READ-ME IS AVALIBLE IN OTHER LANGUAGE IN THE PROGRAM
Realized by:
Eliot ZOUANIA
Maruis DELEUIL
Vincent ROLLET


To test the program please follow the instructions below:

-Open the terminal (Linux: Terminal, Windows: Cygwin (http://cygwin.com/setup-x86_64.exe))

-Go to the software directory:

-> cd <Directory>
(example): -> cd / home / project-fr

-Start the program with the following command:

./Launcher.sh


-select language: -English
-French
- 中文
-Beutsche
-España
-Italiano
-Latin

- Type the number corresponding to choice of actions

-In case of problem, do not hesitate to contact us by email at the address: marius.deleuil@etu.univ-amu.fr
                                                                          : vincent.rollet@etu.univ-amu.fr
                                                                          : eliot.zouania@etu.univ-amu.fr

The Subject (in french):
On veut lister les fichiers d'un utilisateur, selon leurs types et leurs tailles. L'application en script Bash (uniquement, pas de développement dans un autre langage, pas d'appel à des applications) parcourt les répertoires et les sous-répertoires à partir d'un chemin de base, liste les fichiers présents en récupérant leur taille (via la commande ls par exemple) et détermine de quel type ils sont (via la commande file).

Les types de fichier possibles (cf les fichiers test fournis) sont :

    texte simple
    document (EXCEL ODT HTML PDF)
    archive (tar.gz)
    image (GIF JPG SVG PNG)
    son (MP3)

    vidéos (MP4 GIF animé)

L'application doit être basée sur un fichier d'initialisation qui permet de spécifier les types à lister, avec un format à définir, comme par exemple :

SVG:Scalable Vector Graphics:image

MPEG:audio Monaural:son

La sortie de l'application est la liste, pour chaque type, de la taille totale en megaoctets des fichiers de ce type, du nom, de la taille et du chemin du fichier de taille la plus grande de ce type, et de taille la plus petite. Si des fichiers ont une extension qui ne correspond pas à leur type, il faut les lister (soupçon de fraude).

Les fichiers archive doivent être détectés et parcourus comme des répertoires, i.e. on liste également leurs tailles dans les autres types. Si on y trouve un fichier audio mp3, sa taille est ajoutée à la taille des fichiers mp3 globale par exemple.

Attention, ne vous fiez pas aux noms ou aux extensions des fichiers. Certains fichiers ne seront pas reconnus (data), il faudra des catégories "divers", pour ces "data" supplémentaires.

Vous pouvez apporter des ajouts aux points précédents (sortie en HTML, test date et heure...) mais ils ne seront notés en bonus que si les points obligatoires sont remplis.
