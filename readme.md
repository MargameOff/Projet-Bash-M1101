<h1 align="center">Welcome to Bash Project - File Type Scanner 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://twitter.com/MargameOfficial" target="_blank">
    <img alt="Twitter: MargameOfficial" src="https://img.shields.io/twitter/follow/MargameOfficial.svg?style=social" />
  </a>
</p>

> Bash Project in System Module for IUT Informatique 1st year

## Usage

```sh
./Launcher.sh
```

## Author

👤 **Marius DELEUIL**

* Twitter: [@MargameOfficial](https://twitter.com/MargameOfficial)
* Github: [@MargameOff](https://github.com/MargameOff)

## Show your support

Give a ⭐️ if this project helped you!

## Subject (In French)

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

***
