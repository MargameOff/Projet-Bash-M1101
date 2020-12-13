#!/bin/bash
#PROJET BASH 
cd ..
repProgramme=$(pwd)                                                                                                                             #Enregistre le Répertoire où se trouve le programme
Filtre="$repProgramme/Filtre.txt"                                                                                                               #Enregistre le lieux du repertoire Filtre
REP="$2"
resRep="$1"
TMP="$resRep/tmp"
cd "$REP"
echo "ANALYSE EN COURS..."
rm -rf "$TMP" "$resRep/ResultatAnalyse"
mkdir "$TMP" "$TMP/archive"                                                                                                                     #Création des dossiers temporaires
find * -type f > "$TMP/fichierAAnalyser.txt"                                                                                                    #Création du fichier fichierAAnalyser.txt qui contiend la liste en arboréscence des fichier à traiter
cat "$TMP/fichierAAnalyser.txt" | while read line || [[ -n $line ]];                                                                            #Debut de boucle à chaque ligne de fichierAAnalyser.txt
do
    typeFichier=$(file -b "$line" | cut -d ' ' -f1)                                                                                             #recupere le "Vrai" type du fichier et stock dans la variable typeFichier
    nomFichier=$(basename -- "$line")                                                                                                           #recupere le nom de base du fichier sans l'arborescence et stock dans la variable nomFichier
    if [ "$typeFichier" == "gzip" ]                                                                                                             #On verifie si le fichier est une archive gzip
    then
        mkdir "$TMP/archive/$nomFichier"                                                                                                        #On créer un repertoire avec le nom du fichier dans le tmp/archive
        tar -zxf "$line" -C "$TMP/archive/$nomFichier"                                                                                          #On extait le contenue dans le dossier créé precedement
    fi    
done
find "$TMP/archive" -type f >> "$TMP/fichierAAnalyser.txt"                                                                                      #On ajoute les archives extraites dans fichierAAnalyser.txt
cat "$TMP/fichierAAnalyser.txt" | while read line || [[ -n $line ]];                                                                            #Debut de boucle à chaque ligne de fichierAAnalyser.txt
do
    typeFichier=$(file -b "$line" | cut -d ' ' -f1)                                                                                             #recupere le "Vrai" type du fichier et stock dans la variable typeFichier
    tailleFichier=$(wc -c "$line" | cut -d ' ' -f1)                                                                                             #recupere la taille en Bytes du fichier et stock dans la variable tailleFichier
    nomFichier=$(basename -- "$line")                                                                                                           #recupere le nom de base du fichier sans l'arborescence et stock dans la variable nomFichier
    extensionNomFichier="${nomFichier##*.}"                                                                                                     #recupere l'extension du fichier et stock dans la variable extensionNomFichier
    if [ "$nomFichier" == "$extensionNomFichier" ]                                                                                              #Verifie si nomFichier = extensionNomFichier, si est egale, ca veux dire que le fichier n'a pas d'extension !
    then
        extensionNomFichier=""                                                                                                                  #On définit donc la variable extension à rien car aucune extension
    fi
    echo "$line:$typeFichier:$tailleFichier:.$extensionNomFichier" >> "$TMP/Analyser1.txt"                                                      #enregistre les infos dans un fichier Analyser1.txt situé dans le dossier tmp séparé par des :
done
cat "$TMP/Analyser1.txt" | while read line || [[ -n $line ]];                                                                                   #Debut de boucle à chaque ligne de Analyser1.txt
do
    vraiTypeAnalyse=$(echo "$line" | cut -d ':' -f2)                                                                                            #recupere le "vrai" type de l'analyse
    extensionAnalyse=$(echo "$line" | cut -d ':' -f4)                                                                                           #recupere l'extension du fichier de l'analyse
    typeReconnu=`grep ^$vraiTypeAnalyse "$Filtre"`                                                                                              #verifie si le type est reconnu dans le fichier Filtre, si il ne l'ai pas, t = ""    
    if [ "$typeReconnu" == "" ]                                                                                                                 #verifie si typeReconnu contiens du texte
    then
        categorie="autre"                                                                                                                       #ajoute le fichier à la catégorie autre (voir categorie dans Filtre)
        sortieFiltre="1:Inconnu Dans Le Filtre"                                                                                                 #revoie 1 et ne peut pas donner de bonne extension vu que l'on a pas de données dans le filtre
    else
        categorie=`echo "$typeReconnu" | cut -d ':' -f3`                                                                                        #met la categorie dans laquelle est associé le fichier
        extensionFiltre=$(grep $vraiTypeAnalyse "$Filtre" | cut -d ':' -f4)                                                                     #recupere l'extension que devrais avoir le fichier selon son type via le dossier d'initialisation Filtre 
        if [ "$extensionFiltre" == "$extensionAnalyse" ]                                                                                        #Debut de boucle verification de l'authenticité de l'extension
        then
            sortieFiltre="0"                                                                                                                    #renvoie 0 si l'extension est authentique
        else
            sortieFiltre="1:$extensionFiltre"                                                                                                   #revoie 1 et l'extension qui est authentique
        fi
    fi
    echo "$line:$categorie:$sortieFiltre" >> "$TMP/Analyser2.txt"                                                                               #enregistre les infos dans un fichier Analyser2.txt situé dans le dossier tmp séparé par des :
done
cat "$TMP/Analyser2.txt" | while read line || [[ -n $line ]];                                                                                   #Debut de boucle à chaque ligne de Analyser2.txt pour faire l'analyse pour le poids
do
    poidsFichier=$(echo "$line" | cut -d ':' -f3)                                                                                               #recupère le poids dans la ligne et le stock dans la variable poidsFichier
    echo "$poidsFichier:$line" >> "$TMP/Analyser3.txt"                                                                                          #réenregistre line avec le poids en 1er dans AnalysePoids.txt
done
cat "$TMP/Analyser2.txt" | cut -d ':' -f2 | sort | uniq | while read line || [[ -n $line ]];                                                    #Cut qui récupère chaque type uniquement et debut de boucle à chaque ligne de ce resultat
do
    nomPlusGrandFichier=""                                                                                                                      #J'initialise la variable nomPlusGrandFichier pour y stoquer le nom du plus gros fichier par type de fichier
    nomPlusPetitFichier=""                                                                                                                      #J'initialise la variable nomPlusPetitFichier pour y stoquer le nom du plus petit fichier par type de fichier
    plusPetitFichier=999999999999999999                                                                                                         #J'initialise la variable PlusPetitFichier et y stoque une valeur extreme, elle servira a comparer et save la plus petite
    plusGrandFichier=0                                                                                                                          #J'initialise la variable PlusGrandFichier et y stoque la valeur 0, elle servira a comparer et save la plus grande
    grep ^.*:$line "$TMP/Analyser2.txt" > "$TMP/AnalyseTmp.txt"                                                                                 #recupère chaqu'un des fichier qui appartienne au type de la boucle, 
    total=`cat "$TMP/AnalyseTmp.txt" | cut -d ':' -f3 | awk '{s+=$1} END {print s}'`                                                            #recupère la  taille des fichiers du type de la boucle et les additionnent entre eux
    while read line2                                                                                                                            #Debut de boucle à chaque ligne de AnalyseTmp.txt (je n'utilise pas la boucle habituelle du programme car je veux garder les variables après)
    do
        tailleFichier=$(echo "$line2" | cut -d ':' -f3)                                                                                         #recupere la taille du fichier que l'on vas traiter
        if [ "$tailleFichier" -gt "$plusGrandFichier" ]                                                                                         #debut de condition If qui compare si le fichier traité est plus gros que PlusGrandFichier
        then
            plusGrandFichier=$tailleFichier                                                                                                     #-Vrai, alors je determine plusGrandFichier sur la valeur de tailleFichier
            nomPlusGrandFichier=$(echo "$line2" | cut -d ':' -f1)                                                                               #-Vrai, alors je determine nomPlusGrandFichier sur le nom du fichier traité que je recupere avec un cut de la ligne
        fi                                                                                                                                      #Fin de condition
        if [ "$tailleFichier" -lt "$plusPetitFichier" ]                                                                                         #Debut de condition If qui compare si le fichier traité est plus petit que PlusPetitFichier
        then
            plusPetitFichier=$tailleFichier                                                                                                     #-Vrai, alors je determine plusPetitFichier sur la valeur de tailleFichier
            nomPlusPetitFichier=$(echo "$line2" | cut -d ':' -f1)                                                                               #-Vrai, alors je determine nomPlusPetitFichier sur le nom du fichier traité que je recupere avec un cut de la ligne
        fi                                                                                                                                      #Fin de condition
    done<"$TMP/AnalyseTmp.txt"
    echo "$line:$total:$nomPlusPetitFichier:$nomPlusGrandFichier" >> "$TMP/AnalyserType.txt"                                                    #Renvoie en sortie dans AnalyserType.txt le vrai type:total:nomPlusPetitFichier:nomPlusGrandFichier
done
cat "$Filtre" | cut -d ':' -f3 | sort | uniq | while read line || [[ -n $line ]];                                                               #Cut qui récupère chaque catégorie uniquement et debut de boucle à chaque ligne de ce resultat
do
    poidsTotal=0                                                                                                                                #Remet la variable poidsTotal à 0 pour recalculer le poids pour la catégorie
    nomPlusGrandFichier=""                                                                                                                      #J'initialise la variable nomPlusGrandFichier pour y stoquer le nom du plus gros fichier par type de fichier
    nomPlusPetitFichier=""                                                                                                                      #J'initialise la variable nomPlusPetitFichier pour y stoquer le nom du plus petit fichier par type de fichier
    plusPetitFichier=999999999999999999                                                                                                         #J'initialise la variable PlusPetitFichier et y stoque une valeur extreme, elle servira a comparer et save la plus petite
    plusGrandFichier=0                                                                                                                          #J'initialise la variable PlusGrandFichier et y stoque la valeur 0, elle servira a comparer et save la plus grande
    grep ^.*:.*:.*:.*:$line "$TMP/Analyser2.txt" > "$TMP/AnalyseTmp.txt"                                                                        #recupère chaqu'un des fichier qui appartienne à la catégorie de la boucle
    poidsTotal=`cat "$TMP/AnalyseTmp.txt" | cut -d ':' -f3 | awk '{s+=$1} END {print s}'`                                                       #recupère la  taille des fichiers de la catégorie de la boucle et les additionnent entre eux
    while read line2                                                                                                                            #Debut de boucle à chaque ligne de AnalyseTmp.txt (je n'utilise pas la boucle habituelle du programme car je veux garder les variables après)
    do
        tailleFichier=$(echo "$line2" | cut -d ':' -f3)                                                                                         #recupere la taille du fichier que l'on vas traiter
        if [ "$tailleFichier" -gt "$plusGrandFichier" ]                                                                                         #debut de condition If qui compare si le fichier traité est plus gros que PlusGrandFichier
        then
            plusGrandFichier=$tailleFichier                                                                                                     #-Vrai, alors je determine plusGrandFichier sur la valeur de tailleFichier
            nomPlusGrandFichier=$(echo "$line2" | cut -d ':' -f1)                                                                               #-Vrai, alors je determine nomPlusGrandFichier sur le nom du fichier traité que je recupere avec un cut de la ligne
        fi                                                                                                                                      #Fin de condition
        if [ "$tailleFichier" -lt "$plusPetitFichier" ]                                                                                         #Debut de condition If qui compare si le fichier traité est plus petit que PlusPetitFichier
        then
            plusPetitFichier=$tailleFichier                                                                                                     #-Vrai, alors je determine plusPetitFichier sur la valeur de tailleFichier
            nomPlusPetitFichier=$(echo "$line2" | cut -d ':' -f1)                                                                               #-Vrai, alors je determine nomPlusPetitFichier sur le nom du fichier traité que je recupere avec un cut de la ligne
        fi                                                                                                                                      #Fin de condition
    done<"$TMP/AnalyseTmp.txt"
    echo "$line:$poidsTotal:$nomPlusPetitFichier:$nomPlusGrandFichier" >> "$TMP/AnalyserCat.txt"                                                #Renvoie en sortie dans AnalyserCat.txt le vrai type:total:nomPlusPetitFichier:nomPlusGrandFichier
done
cd "$repProgramme/Systeme"                                                                                                                      #Retourne à la source du programme