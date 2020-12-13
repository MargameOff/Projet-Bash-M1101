#!/bin/bash
#PROJET BASH
function pause(){
    echo ""
    echo ""
    read -p "$textePause"
    clear
}
##############################################TEXTE###################################################
case "$3" in
    fr)
        textePause="Appuyer sur [ENTER] pour continuer ..."
        texte1="================================================================================================\n                                  Analyse par Type de Fichier\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Authenticité | Extension recommandé\n================================================================================================"
        texte2="==================================================================================================================\n                                           Analyse par Catégorie de Fichier\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Authenticité | Extension recommandé\n=================================================================================================================="
        texte3="==================================================================================================================\n                                          Analyse par Poids des Fichiers\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Authenticité | Extension recommandé\n=================================================================================================================="
        texte4="===================================================================================================\n                      Liste des Fichiers avec risque de Fraude à l'extension\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Extension recommandé\n==================================================================================================="
        texte5="===================================================================================================\n                      Liste des Fichiers Non-Identifiable par file\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Extension recommandé\n==================================================================================================="
        texte6="===================================================================================================\n                      Liste des Archives et leurs contenus\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Extension recommandé\n==================================================================================================="
        texte7="    -Le plus petit fichier est"
        texte8="    -Le plus grand fichier est"
        texte9="    -Ce type fait"
        texte10="    -Cette catégorie fait"
        mot1="Authentique"
        mot2="Extension deja authentique"
        mot3="Falsifié"
        mot4="Inconnu Dans Le Filtre"
    ;;
    en)
        textePause="Press [ENTER] to continue ..."
        texte1="================================================================================================\n                                  File Type Analysis\nranking | file name | Access path | Weight in Mo | Authenticity | Recommended extension\n================================================================================================"
        texte2="==================================================================================================================\n                                           Analysis by File Category\nranking | file name | Access path | Weight in Mo | File type | Authenticity | Recommended extension\n=================================================================================================================="
        texte3="==================================================================================================================\n                                          File Weight Analysis\nranking | file name | Access path | Weight in Mo | File type | Authenticity | Recommended extension\n=================================================================================================================="
        texte4="===================================================================================================\n                      List of Files with risk of Fraud to the extension\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Extension recommandé\n==================================================================================================="
        texte5="===================================================================================================\n                      List of Non-Identifiable Files by file command\nranking | file name | Access path | Weight in Mo | File type | Recommended extension\n==================================================================================================="
        texte6="===================================================================================================\n                      List of Archives and their contents\nranking | file name | Access path | Weight in Mo | File type | Recommended extension\n==================================================================================================="
        texte7="    -The smallest file is"
        texte8="    -The largest file is"
        texte9="    -This type does"
        texte10="    -This category makes"
        mot1="Authentic"
        mot2="Already authentic extension"
        mot3="Falsified"
        mot4="Unknown In Filter"
    ;;
    ch)
        textePause="按[ENTER]继续..."
        texte1="================================================================================================\n                                  文件类型分析\n排名|文件名|访问路径钼重量真实性|推荐的扩展名\n================================================================================================"
        texte2="==================================================================================================================\n                                           按文件类别分析\n排名|文件名|访问路径钼重量文件类型真实性|推荐的扩展名\n=================================================================================================================="
        texte3="==================================================================================================================\n                                          文件重量分析\n排名|文件名|访问路径钼重量文件类型真实性|推荐的扩展名\n=================================================================================================================="
        texte4="===================================================================================================\n                      具有扩展名欺诈风险的文件列表\n排名|文件名|访问路径钼重量文件类型推荐的扩展名\n==================================================================================================="
        texte5="===================================================================================================\n                      无法识别的文件列表每个文件\n排名|文件名|访问路径钼重量文件类型推荐的扩展名\n==================================================================================================="
        texte6="===================================================================================================\n                      档案清单及其内容\n排名|文件名|访问路径钼重量文件类型推荐的扩展名\n==================================================================================================="
        texte7="    -最小的文件是"
        texte8="    -最大的文件是"
        texte9="    -这个家伙"
        texte10="    -此类别使"
        mot1="真实"
        mot2="已经是真实的扩展"
        mot3="伪造的"
        mot4="筛选器中未知"
    ;;
    de)
        textePause="Drücken Sie [ENTER], um fortzufahren ..."
        texte1="================================================================================================\n                                  Dateitypanalyse\nRanking | Dateiname | Zugangspfad | Gewicht in Mo | Authentizität | Empfohlene Erweiterung\n================================================================================================"
        texte2="==================================================================================================================\n                                           Analyse nach Dateikategorie\nRanking | Dateiname | Zugangspfad | Gewicht in Mo | Dateityp | Authentizität | Empfohlene Erweiterung\n=================================================================================================================="
        texte3="==================================================================================================================\n                                          Dateigewichtsanalyse\nRanking | Dateiname | Zugangspfad | Gewicht in Mo | Dateityp | Authentizität | Empfohlene Erweiterung\n=================================================================================================================="
        texte4="===================================================================================================\n                      Liste der Dateien mit Betrugsrisiko für die Erweiterung\nRanking | Dateiname | Zugangspfad | Gewicht in Mo | Dateityp | Empfohlene Erweiterung\n==================================================================================================="
        texte5="===================================================================================================\n                      Liste der nicht identifizierbaren Dateien nach Datei\nRanking | Dateiname | Zugangspfad | Gewicht in Mo | Dateityp | Empfohlene Erweiterung\n==================================================================================================="
        texte6="===================================================================================================\n                      Liste der Archive und ihrer Inhalte\nRanking | Dateiname | Zugangspfad | Gewicht in Mo | Dateityp | Empfohlene Erweiterung\n==================================================================================================="
        texte7="    -Die kleinste Datei ist"
        texte8="    -Die größte Datei ist"
        texte9="    -Dieser Typ tut es"
        texte10="    -Diese Kategorie macht"
        mot1="Authentisch"
        mot2="Bereits authentische Erweiterung"
        mot3="Gefälscht"
        mot4="Im Filter unbekannt"
    ;;
    la)
        textePause="Press [MODO VENIAT] pergere ..."
        texte1="================================================================================================\n                                  Genus tabellae Analysis\nranking | lima nomen | Aditus viam | Pondus in toto | veritas | Suspendisse extensio\n================================================================================================"
        texte2="==================================================================================================================\n                                           Analysis per File Categoriae\nranking | lima nomen | Aditus viam | Pondus in toto | Genus tabellae | veritas | Suspendisse extensio\n=================================================================================================================="
        texte3="==================================================================================================================\n                                          Pondus Analysis File\nranking | lima nomen | Aditus viam | Pondus in toto | Genus tabellae | veritas | Suspendisse extensio\n=================================================================================================================="
        texte4="===================================================================================================\n                      Album cum periculo fraudem tractus Files\nranking | lima nomen | Aditus viam | Pondus in toto | Genus tabellae | Suspendisse extensio\n==================================================================================================="
        texte5="===================================================================================================\n                      Index Non Identifiable Lima per File\nranking | lima nomen | Aditus viam | Pondus in toto | Genus tabellae | Suspendisse extensio\n==================================================================================================="
        texte6="===================================================================================================\n                      List of Washington contentis\nranking | lima nomen | Aditus viam | Pondus in toto | Genus tabellae | Suspendisse extensio\n==================================================================================================="
        texte7="    -Minima Scapus"
        texte8="    -Scapus maxima"
        texte9="    -Et hoc genus documenti agit"
        texte10="    -Hoc genus facit"
        mot1="Authentica"
        mot2="Iam veri extensio"
        mot3="falsificatum"
        mot4="In ignotum editions Filter"
    ;;
    it)
        textePause="Premere [ENTER] per continuare ..."
        texte1="================================================================================================\n                                  Analisi per tipo di file\nclassifica | nome file | Percorso di accesso | Peso in Mo | Autenticità | Estensione consigliata\n================================================================================================"
        texte2="==================================================================================================================\n                                           Analisi per categoria di file\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Autenticità | Estensione consigliata\n=================================================================================================================="
        texte3="==================================================================================================================\n                                          Analisi del peso del file\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Autenticità | Estensione consigliata\n=================================================================================================================="
        texte4="===================================================================================================\n                      Elenco di file con rischio di frode per l'estensione\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Estensione consigliata\n==================================================================================================="
        texte5="===================================================================================================\n                      Elenco di file non identificabili per file\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Estensione consigliata\n==================================================================================================="
        texte6="===================================================================================================\n                      Elenco degli archivi e del loro contenuto\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Estensione consigliata\n==================================================================================================="
        texte7="    -Il file più piccolo è"
        texte8="    -Il file più grande è"
        texte9="    -Questo tipo di file fa"
        texte10="    -Questa categoria fa"
        mot1="Autentico"
        mot2="Estensione già autentica"
        mot3="Falsificato"
        mot4="Sconosciuto nel filtro"
    ;;
    es)
        textePause="Premere [ENTER] per continuare ..."
        texte1="================================================================================================\n                                  Analisi per tipo di file\nclassifica | nome file | Percorso di accesso | Peso in Mo | Autenticità | Estensione consigliata\n================================================================================================"
        texte2="==================================================================================================================\n                                           Analisi per categoria di file\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Autenticità | Estensione consigliata\n=================================================================================================================="
        texte3="==================================================================================================================\n                                          Analisi del peso del file\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Autenticità | Estensione consigliata\n=================================================================================================================="
        texte4="===================================================================================================\n                      Elenco di file con rischio di frode per l'estensione\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Estensione consigliata\n==================================================================================================="
        texte5="===================================================================================================\n                      Elenco di file non identificabili per file\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Estensione consigliata\n==================================================================================================="
        texte6="===================================================================================================\n                      Elenco degli archivi e del loro contenuto\nclassifica | nome file | Percorso di accesso | Peso in Mo | Tipo di file | Estensione consigliata\n==================================================================================================="
        texte7="    -Il file più piccolo è"
        texte8="    -Il file più grande è"
        texte9="    -Questo tipo lo fa"
        texte10="    -Questa categoria fa"
        mot1="Autentico"
        mot2="Estensione già autentica"
        mot3="Falsificato"
        mot4="Sconosciuto nel filtro"
    ;;
    *)
        textePause="Appuyer sur [ENTER] pour continuer ..."
        texte1="================================================================================================\n                                  Analyse par Type de Fichier\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Authenticité | Extension recommandé\n================================================================================================"
        texte2="==================================================================================================================\n                                           Analyse par Catégorie de Fichier\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Authenticité | Extension recommandé\n=================================================================================================================="
        texte3="==================================================================================================================\n                                          Analyse par Poids des Fichiers\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Authenticité | Extension recommandé\n=================================================================================================================="
        texte4="===================================================================================================\n                      Liste des Fichiers avec risque de Fraude à l'extension\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Extension recommandé\n==================================================================================================="
        texte5="===================================================================================================\n                      Liste des Fichiers Non-Identifiable par file\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Extension recommandé\n==================================================================================================="
        texte6="===================================================================================================\n                      Liste des Archives et leurs contenus\nclassement | nom du fichier | Chemin d'acces | Poids en Mo | Type de fichier | Extension recommandé\n==================================================================================================="
        texte7="    -Le plus petit fichier est"
        texte8="    -Le plus grand fichier est"
        texte9="    -Ce type fait"
        texte10="    -Cette catégorie fait"
        mot1="Authentique"
        mot2="Extension deja authentique"
        mot3="Falsifié"
        mot4="Inconnu Dans Le Filtre"
    ;;
esac
######################################################################################################


######################################INITIALISATION RESULTATS########################################
TMP2="$1"
TMP="$TMP2/tmp"
REP="$2"
resRep="$TMP2/ResultatAnalyse"
rm -rf "$resRep"
mkdir "$resRep"
clear
echo "ANALYSE EN COURS..."
######################################################################################################

#####################################ANALYSE PAR TYPE#################################################
echo -e "$texte1" >> "$resRep/AnalyseParType.txt"
echo "" >> "$resRep/AnalyseParType.txt"
echo "" >> "$resRep/AnalyseParType.txt"
cat "$TMP/Analyser2.txt" | cut -d ':' -f2 | sort | uniq | while read line || [[ -n $line ]];
do
    compteur=0
    echo "----------------------------------------------$line:----------------------------------------------" >> "$resRep/AnalyseParType.txt"
    plusPetit=$(grep ^$line "$TMP/AnalyserType.txt" | cut -d ':' -f3)
    plusGrand=$(grep ^$line "$TMP/AnalyserType.txt" | cut -d ':' -f4)
    poidsType="`echo $(echo "scale=6;$(grep ^$line "$TMP/AnalyserType.txt" | cut -d ':' -f2)/1000000" | bc -l)`Mo"
    echo -e "$texte7 $plusPetit" >> "$resRep/AnalyseParType.txt"
    echo -e "$texte8 $plusGrand" >> "$resRep/AnalyseParType.txt"
    echo -e "$texte9 $poidsType" >> "$resRep/AnalyseParType.txt"
    echo "" >> "$resRep/AnalyseParType.txt"
    grep ^.*:$line "$TMP/Analyser2.txt" > "$TMP/AnalyseTmp.txt"
    while read line2
    do
        
        compteur=$(($compteur+1))
        cheminFichier=$(echo "$line2" | cut -d ':' -f1)
        nomFichier=$(basename -- "$cheminFichier")*
        cheminFichierF="$REP/$cheminFichier"
        (echo "$cheminFichier" | grep -Eq "/home/.*" ) && cheminFichierF=$cheminFichier
        poidsFichier=$(echo "$line2" | cut -d ':' -f3)
        poidsFichierMo="`echo $(echo "scale=6;$poidsFichier/1000000" | bc -l)`Mo"
        extReco=$(echo "$line2" | cut -d ':' -f7)
        if [ $(echo "$line2" | cut -d ':' -f6) == "0" ]
        then
            authenticite="$mot1"
            couleurAuthentique="valide"
            extReco="$mot2"
        else
            authenticite="$mot3"
            couleurAuthentique="invalide"
            if [ "$extReco" == "Inconnu Dans Le Filtre" ]
            then
                authenticite="$mot4"
                extReco="////"
            fi
            
        fi
        echo "$compteur | $nomFichier | $cheminFichierF | $poidsFichierMo | $authenticite | $extReco" >> "$resRep/AnalyseParType.txt"
        echo "" >> "$resRep/AnalyseParType.txt"
    done<"$TMP/AnalyseTmp.txt"
    echo "" >> "$resRep/AnalyseParType.txt"
done
######################################################################################################


################################ANALYSE PAR CATEGORIE#################################################
echo -e "$texte2" >> "$resRep/AnalyseParCategorie.txt"
echo "" >> "$resRep/AnalyseParCategorie.txt"
echo "" >> "$resRep/AnalyseParCategorie.txt"
cat "$TMP/Analyser2.txt" | cut -d ':' -f5 | sort | uniq | while read line || [[ -n $line ]];                             #Debut de boucle à chaque ligne de fichierAAnalyser.txt
do
    compteur=0
    echo "----------------------------------------------$line:----------------------------------------------" >> "$resRep/AnalyseParCategorie.txt"
    plusPetit=$(grep ^$line "$TMP/AnalyserCat.txt" | cut -d ':' -f3)
    plusGrand=$(grep ^$line "$TMP/AnalyserCat.txt" | cut -d ':' -f4)
    poidsCat="`echo $(echo "scale=6;$(grep ^$line "$TMP/AnalyserCat.txt" | cut -d ':' -f2)/1000000" | bc -l)`Mo"
    echo -e "$texte7 $plusPetit" >> "$resRep/AnalyseParCategorie.txt"
    echo -e "$texte8 $plusGrand" >> "$resRep/AnalyseParCategorie.txt"
    echo -e "$texte9 $poidsCat" >> "$resRep/AnalyseParCategorie.txt"
    echo "" >> "$resRep/AnalyseParCategorie.txt"
    grep ^.*:.*:.*:.*:$line "$TMP/Analyser2.txt" > "$TMP/AnalyseTmp.txt"
    while read line2
    do
        compteur=$(($compteur+1))
        typeFichier=$(echo "$line2" | cut -d ':' -f2)
        cheminFichier=$(echo "$line2" | cut -d ':' -f1)
        cheminFichierF="$REP/$cheminFichier"
        (echo "$cheminFichier" | grep -Eq "/home/.*" ) && cheminFichierF=$cheminFichier
        nomFichier=$(basename -- "$cheminFichier")
        poidsFichier=$(echo "$line2" | cut -d ':' -f3)
        poidsFichierMo="`echo $(echo "scale=6;$poidsFichier/1000000" | bc -l)`Mo"
        extReco=$(echo "$line2" | cut -d ':' -f7)
        if [ $(echo "$line2" | cut -d ':' -f6) == "0" ]
        then
            authenticite="$mot1"
            couleurAuthentique="valide"
            extReco="$mot2"
        else
            authenticite="$mot3"
            couleurAuthentique="invalide"
            if [ "$extReco" == "Inconnu Dans Le Filtre" ]
            then
                authenticite="$mot4"
                extReco="////"
            fi
        fi
        echo "$compteur | $nomFichier | $cheminFichierF | $poidsFichierMo | $typeFichier | $authenticite | $extReco" >> "$resRep/AnalyseParCategorie.txt"
        echo "" >> "$resRep/AnalyseParCategorie.txt"
    done<"$TMP/AnalyseTmp.txt"
    
    echo "" >> "$resRep/AnalyseParCategorie.txt"
done
######################################################################################################


#############################ANALYSE PAR POIDS#######################################################
echo -e "$texte3" >> "$resRep/AnalyseParPoids.txt"
echo "" >> "$resRep/AnalyseParPoids.txt"
echo "" >> "$resRep/AnalyseParPoids.txt"
compteur=0
cat "$TMP/Analyser3.txt" | sort -n -r | while read line || [[ -n $line ]];                             #Debut de boucle à chaque ligne de fichierAAnalyser.txt
do
    compteur=$(($compteur+1))
    typeFichier=$(echo "$line" | cut -d ':' -f3)
    cheminFichier=$(echo "$line" | cut -d ':' -f2)
    cheminFichierF="$REP/$cheminFichier"
    (echo "$cheminFichier" | grep -Eq "/home/.*" ) && cheminFichierF=$cheminFichier
    nomFichier=$(basename -- "$cheminFichier")
    poidsFichier=$(echo "$line" | cut -d ':' -f1)
    poidsFichierMo="`echo $(echo "scale=6;$poidsFichier/1000000" | bc -l)`Mo"
    extReco=$(echo "$line" | cut -d ':' -f8)
    if [ $(echo "$line" | cut -d ':' -f7) == "0" ]
    then
        authenticite="$mot1"
        couleurAuthentique="valide"
        extReco="$mot2"
    else
        authenticite="$mot3"
        couleurAuthentique="invalide"
        if [ "$extReco" == "Inconnu Dans Le Filtre" ]
        then
            authenticite="$mot4"
            extReco="////"
        fi
    fi
    echo "$compteur | $nomFichier | $cheminFichierF | $poidsFichierMo | $typeFichier | $authenticite | $extReco" >> "$resRep/AnalyseParPoids.txt"
    echo "" >> "$resRep/AnalyseParPoids.txt"
done
######################################################################################################


###############################LISTE RISQUE DE FRAUDE################################################
echo -e "$texte4" >> "$resRep/ListeRisqueFraude.txt"
echo "" >> "$resRep/ListeRisqueFraude.txt"
echo "" >> "$resRep/ListeRisqueFraude.txt"
compteur=0
grep ^.*:.*:.*:.*:.*:1 "$TMP/Analyser2.txt" | while read line || [[ -n $line ]];                             #Debut de boucle à chaque ligne de fichierAAnalyser.txt
do
    compteur=$(($compteur+1))
    typeFichier=$(echo "$line" | cut -d ':' -f2)
    cheminFichier=$(echo "$line" | cut -d ':' -f1)
    cheminFichierF="$REP/$cheminFichier"
    (echo "$cheminFichier" | grep -Eq "/home/.*" ) && cheminFichierF=$cheminFichier
    nomFichier=$(basename -- "$cheminFichier")
    poidsFichier=$(echo "$line" | cut -d ':' -f3)
    poidsFichierMo="`echo $(echo "scale=6;$poidsFichier/1000000" | bc -l)`Mo"
    extReco=$(echo "$line" | cut -d ':' -f7)
    echo "$compteur | $nomFichier | $cheminFichierF | $poidsFichierMo | $typeFichier | $extReco" >> "$resRep/ListeRisqueFraude.txt"
    echo "" >> "$resRep/ListeRisqueFraude.txt"
done
##############################LISTE NON IDENTIFIABLE##################################################


######################################################################################################
echo -e "$texte5" >> "$resRep/ListeNonIdentifiable.txt"
echo "" >> "$resRep/ListeNonIdentifiable.txt"
echo "" >> "$resRep/ListeNonIdentifiable.txt"
compteur=0
grep ^.*:.*:.*:.*:data "$TMP/Analyser2.txt" | while read line || [[ -n $line ]];                             #Debut de boucle à chaque ligne de fichierAAnalyser.txt
do
    compteur=$(($compteur+1))
    cheminFichier=$(echo "$line" | cut -d ':' -f1)
    cheminFichierF="$REP/$cheminFichier"
    (echo "$cheminFichier" | grep -Eq "/home/.*" ) && cheminFichierF=$cheminFichier
    nomFichier=$(basename -- "$cheminFichier")
    poidsFichier=$(echo "$line" | cut -d ':' -f3)
    poidsFichierMo="`echo $(echo "scale=6;$poidsFichier/1000000" | bc -l)`Mo"
    echo "$compteur | $nomFichier | $cheminFichierF | $poidsFichierMo"  >> "$resRep/ListeNonIdentifiable.txt"
    echo "" >> "$resRep/ListeNonIdentifiable.txt"
done
######################################################################################################


#############################LISTE ARCHIVE ET DES CONTENUS############################################
echo -e "$texte6" >> "$resRep/ListeArchive&Contenus.txt"
echo "" >> "$resRep/ListeArchive&Contenus.txt"
echo "" >> "$resRep/ListeArchive&Contenus.txt"
grep ^.*:.*:.*:.*:archive "$TMP/Analyser2.txt" | cut -d ':' -f1 | while read line || [[ -n $line ]];
do
    nomArchive=$(basename -- "$line")
    compteur=0
    echo "----------------------------------------------$nomArchive:----------------------------------------------" >> "$resRep/ListeArchive&Contenus.txt"
    echo "" >> "$resRep/ListeArchive&Contenus.txt"
    grep "^.*/tmp/archive/$nomArchive" "$TMP/Analyser2.txt" > "$TMP/AnalyseTmp.txt"
    while read line2
    do
        compteur=$(($compteur+1))
        cheminFichier=$(echo "$line2" | cut -d ':' -f1)
        cheminFichierF="$REP/$cheminFichier"
        (echo "$cheminFichier" | grep -Eq "/home/.*" ) && cheminFichierF=$cheminFichier
        nomFichier=$(basename -- "$cheminFichier")
        poidsFichier=$(echo "$line2" | cut -d ':' -f3)
        poidsFichierMo="`echo $(echo "scale=6;$poidsFichier/1000000" | bc -l)`Mo"
        extReco=$(echo "$line2" | cut -d ':' -f7)
        typeFichier=$(echo "$line2" | cut -d ':' -f2)
        if [ $(echo "$line2" | cut -d ':' -f6) == "0" ]
        then
            authenticite="$mot1"
            couleurAuthentique="valide"
            extReco="$mot2"
        else
            authenticite="$mot3"
            couleurAuthentique="invalide"
            if [ "$extReco" == "Inconnu Dans Le Filtre" ]
            then
                authenticite="$mot4"
                extReco="////"
            fi
        fi
        echo "$compteur | $nomFichier | $cheminFichierF | $poidsFichierMo | $typeFichier | $authenticite | $extReco" >> "$resRep/ListeArchive&Contenus.txt"
        echo "" >> "$resRep/ListeArchive&Contenus.txt"
    done< "$TMP/AnalyseTmp.txt"
    echo "" >> "$resRep/ListeArchive&Contenus.txt"
done
######################################################################################################