#!/bin/bash
#PROJET BASH
clear
cd ..
repProgramme=$(pwd)
cd Systeme
langue=$1
###################TEXTE########################
case "$langue" in
    fr)
      texte1="Lancer le Programme"
      texte2="Changer la Langue"
      texte3="Manuel"
      texte4="A propos"
      texte5="Appuyer sur [ENTER] pour retourner au menu principal"
      texte6="Entrez un Chiffre: >"
      texte7="Quitter le programme"
      texte8="Appuyer sur [ENTER] pour retourner au Resultats"
      aPropos1="Programme créé Par:"
      lancer1="Vous allez devoir choisir le répertoire à scanner"
      lancer2="Ce répertoire sera scanné en arborescence"
      lancer3="Le contenu des archives sera également analysé"
      lancer4="Appuyer sur [ENTER] pour ouvrir la fenetre de selection"
      lancer5="Merci, le répertoire choisi est donc:"
      lancer6="Vous allez devoir choisir le répertoire où envoyer les résultats"
      lancer7="Les résultats seront stocké dans un répertoire nommé ResultatAnalyse"
      lancer8="Le répertoire à scanner est donc:"
      lancer9="Le répertoire où stocker les resultats est donc:"
      lancer10="Confirmer"
      lancer11="Recommencer"
      lancer12="Retour au menu principal"
      resultats="Resultats Analyse"
      resultats1="Que souhaitez vous ouvrir:"
      resultats2="Analyse par Type"
      resultats3="Analyse par Catégorie"
      resultats4="Analyse par Poids"
      resultats5="Liste des fichier à Risque de Fraude"
      resultats6="Liste des fichiers Non-Identifiable par file"
      resultats7="Liste des archives et de leurs contenus"
      resultats8="Sortie HTML"
    ;;
    en)
      texte1="Start the Program"
      texte2="Change the language"
      texte3="Manual"
      texte4="About"
      texte5="Press [ENTER] to return to the main menu"
      texte6="Enter a Number: >"
      texte7="Exit the program"
      texte8="Press [ENTER] to return to Results"
      aPropos1="Program creat by:"
      lancer1="You will have to choose the directory to scan"
      lancer2="This directory will be scanned in tree structure"
      lancer3="The content of the archives will also be analyzed"
      lancer4="Press [ENTER] to open the selection window"
      lancer5="Thank you, the directory chosen is therefore:"
      lancer6="You will have to choose the directory where to send the results"
      lancer7="The results will be stored in a directory named ResultatAnalysis"
      lancer8="The directory to scan is therefore:"
      lancer9="The directory where to store the results is therefore:"
      lancer10="To confirm"
      lancer11="restart"
      lancer12="Back to main menu"
      resultats="results Analysis"
      resultats1="What do you want to open:"
      resultats2="Analysis by Type"
      resultats3="Category Analysis"
      resultats4="Weight Analysis"
      resultats5="List of files at risk of fraud"
      resultats6="List of Non-Identifiable Files by File"
      resultats7="List of archives and their contents"
      resultats8="HTML output"
    ;;
    ch)
      texte1="启动程序"
      texte2="改变语言"
      texte3="手册"
      texte4="关于"
      texte5="按[ENTER]返回主菜单"
      texte6="输入号码：>"
      texte7="退出程序"
      texte8="按[ENTER]返回结果"
      aPropos1="程序创建者："
      lancer1="您将必须选择要扫描的目录"
      lancer2="该目录将以树形结构进行扫描"
      lancer3="档案的内容也将被分析"
      lancer4="按[ENTER]打开选择窗口"
      lancer5="谢谢，因此选择的目录是："
      lancer6="您将必须选择将结果发送到的目录"
      lancer7="结果将存储在名为ResultatAnalysis的目录中"
      lancer8="因此，要扫描的目录为："
      lancer9="因此，用于存储结果的目录是"
      lancer10="确认"
      lancer11="重新开始"
      lancer12="返回主菜单"
      resultats="分析结果"
      resultats1="您想打开什么："
      resultats2="按类型分析"
      resultats3="分类分析"
      resultats4="体重分析"
      resultats5="有欺诈风险的文件清单"
      resultats6="不可识别文件列表（按文件）"
      resultats7="档案清单及其内容"
      resultats8="HTML输出"
    ;;
    de)
      texte1="Starten Sie das Programm"
      texte2="Ändere die Sprache"
      texte3="Handbuch"
      texte4="Über"
      texte5="Drücken Sie [ENTER], um zum Hauptmenü zurückzukehren"
      texte6="Geben Sie eine Nummer ein :>"
      texte7="Beenden Sie das Programm"
      texte8="Drücken Sie [ENTER], um zu den Ergebnissen zurückzukehren"
      aPropos1="Programm erstellt von:"
      lancer1="Sie müssen das zu scannende Verzeichnis auswählen"
      lancer2="Dieses Verzeichnis wird in Baumstruktur gescannt"
      lancer3="Der Inhalt der Archive wird ebenfalls analysiert"
      lancer4="Drücken Sie [ENTER], um das Auswahlfenster zu öffnen"
      lancer5="Vielen Dank, das ausgewählte Verzeichnis ist daher:"
      lancer6="Sie müssen das Verzeichnis auswählen, in das die Ergebnisse gesendet werden sollen"
      lancer7="Die Ergebnisse werden in einem Verzeichnis namens ResultatAnalysis gespeichert"
      lancer8="Das Verzeichnis zum Scannen des"
      lancer9="Das zu scannende Verzeichnis lautet daher:"
      lancer10="Bestätigen"
      lancer11="Neustart"
      lancer12="Zurück zum Hauptmenü"
      resultats="Analyseergebnisse"
      resultats1="Was möchten Sie öffnen:"
      resultats2="Analyse nach Typ"
      resultats3="Kategorieanalyse"
      resultats4="Gewichtsanalyse"
      resultats5="Liste der betrugsgefährdeten Dateien"
      resultats6="Liste der nicht identifizierbaren Dateien nach Datei"
      resultats7="Liste der Archive und ihrer Inhalte"
      resultats8="HTML-Ausgabe"
    ;;
    la)
      texte1="Satus ad Program"
      texte2="Mutata in lingua"
      texte3="Manuel"
      texte4="fere"
      texte5="Press [MODO VENIAT] redire pelagus menu"
      texte6="Intra enim Number:>"
      texte7="Exit progressio"
      texte8="Press [intrare] redire Results"
      aPropos1="Program per creavit:"
      lancer1="Ut indicem tibi erit eligere scan"
      lancer2="Et hoc est secundum viride in arbore et compages Directory"
      lancer3="Contentum the archives etiam resolvitur"
      lancer4="Press [MODO VENIAT] aperire fenestram delectu"
      lancer5="Lorem Directorium selectum ergoLorem Directorium selectum ergo"
      lancer6="Elige tibi erit usque ad indicem mittere in eventus"
      lancer7="Eventus autem, repositum in nomine ResultatAnalysis Directory"
      lancer8="Directorium ad scan ergo"
      lancer9="Indicem quo congregem eventus est ergo:"
      lancer10="Ad confirmandas"
      lancer11="Sileo"
      lancer12="Ad pelagus menu"
      resultats="analysis Results"
      resultats1="Quid vultis ut faciam vobis aperire:"
      resultats2="Analysis per Type"
      resultats3="Analysis genus"
      resultats4="Analysis pondus"
      resultats5="Index in periculo fraudis files"
      resultats6="Index Non Identifiable Lima per File"
      resultats7="Index archives et auditu suis propriis"
      resultats8="HTML output"
    ;;
    it)
      texte1="Avvia il programma"
      texte2="Cambia la lingua"
      texte3="Manuale"
      texte4="Di"
      texte5="Premere [ENTER] per tornare al menu principale"
      texte6="Immettere un numero: >"
      texte7="Esci dal programma"
      texte8="Premere [INVIO] per tornare ai risultati"
      aPropos1="Programma creato da:"
      lancer1="Dovrai scegliere la directory da scansionare"
      lancer2="Questa directory verrà analizzata nella struttura ad albero"
      lancer3="Verrà inoltre analizzato il contenuto degli archivi"
      lancer4="Premere [ENTER] per aprire la finestra di selezione"
      lancer5="Grazie, la directory scelta è quindi:"
      lancer6="Dovrai scegliere la directory dove inviare i risultati"
      lancer7="I risultati verranno archiviati in una directory denominata ResultatAnalysis"
      lancer8="La directory da scansionare è quindi:"
      lancer9="La directory in cui memorizzare i risultati è quindi:"
      lancer10="Confirmer"
      lancer11="Ricomincia"
      lancer12="Indietro al menù principale"
      resultats="Risultati dell'analisi"
      resultats1="Cosa vuoi aprire:"
      resultats2="Analisi per tipo"
      resultats3="Analisi delle categorie"
      resultats4="Analisi del peso"
      resultats5="Elenco dei file a rischio di frode"
      resultats6="Elenco dei file non identificabili per file"
      resultats7="Elenco degli archivi e del loro contenuto"
      resultats8="Output HTML"
    ;;
    es)
      texte1="Iniciar el programa"
      texte2="Cambiar el idioma"
      texte3="Manual"
      texte4="A proposito"
      texte5="Presione [ENTER] para regresar al menú principal"
      texte6="Ingrese un número:>"
      texte7="Salir del programa"
      texte8="Presione [ENTER] para regresar a Resultados"
      aPropos1="Programa creado por:"
      lancer1="Tendrás que elegir el directorio para escanear"
      lancer2="Este directorio se escaneará en estructura de árbol"
      lancer3="También se analizará el contenido de los archivos"
      lancer4="Presione [ENTER] para abrir la ventana de selección"
      lancer5="Gracias, el directorio elegido es por tanto:"
      lancer6="Tendrás que elegir el directorio donde enviar los resultados"
      lancer7="Los resultados se almacenarán en un directorio llamado ResultatAnalysis"
      lancer8="Por tanto, el directorio a escanear es:"
      lancer9="El directorio donde almacenar los resultados es por tanto:"
      lancer10="Confirmar"
      lancer11="Reiniciar"
      lancer12="Volver al menú principal"
      resultats="Resultados de analisis"
      resultats1="¿Qué quieres abrir?"
      resultats2="Análisis por tipo"
      resultats3="Análisis de categoría"
      resultats4="Análisis de peso"
      resultats5="Lista de archivos en riesgo de fraude"
      resultats6="Lista de archivos no identificables por archivo"
      resultats7="Lista de archivos y su contenido"
      resultats8="Salida HTML"
    ;;
    *)
      texte1="Lancer le Programme"
      texte2="Changer la Langue"
      texte3="Manuel"
      texte4="A propos"
      texte5="Appuyer sur [ENTER] pour retourner au menu principal"
      texte6="Entrez un Chiffre: >"
      texte7="Quitter le programme"
      texte8="Appuyer sur [ENTER] pour retourner au Resultats"
      aPropos1="Programme créé Par:"
      lancer1="Vous allez devoir choisir le répertoire à scanner"
      lancer2="Ce répertoire sera scanné en arborescence"
      lancer3="Le contenu des archives sera également analysé"
      lancer4="Appuyer sur [ENTER] pour ouvrir la fenetre de selection"
      lancer5="Merci, le répertoire choisi est donc:"
      lancer6="Vous allez devoir choisir le répertoire où envoyer les résultats"
      lancer7="Les résultats seront stocké dans un répertoire nommé ResultatAnalyse"
      lancer8="Le répertoire à scanner est donc:"
      lancer9="Le répertoire où stocker les resultats est donc:"
      lancer10="Confirmer"
      lancer11="Recommencer"
      lancer12="Retour au menu principal"
      resultats="Resultats Analyse"
      resultats1="Que souhaitez vous ouvrir:"
      resultats2="Analyse par Type"
      resultats3="Analyse par Catégorie"
      resultats4="Analyse par Poids"
      resultats5="Liste des fichier à Risque de Fraude"
      resultats6="Liste des fichiers Non-Identifiable par file"
      resultats7="Liste des archives et de leurs contenus"
      resultats8="Sortie HTML"
    ;;
esac
################################################
function Bandeau(){
    echo -e "\033[32m#==============================================================================#"
    echo "|               ______          _      _    ______           _                 |"
    echo "|               | ___ \        (_)    | |   | ___ \         | |                |"
    echo "|               | |_/ / __ ___  _  ___| |_  | |_/ / __ _ ___| |__              |"
    echo "|               |  __/ '__/ _ \| |/ _ \ __| | ___ \/ _\` / __| '_ \             |"
    echo "|               | |  | | | (_) | |  __/ |_  | |_/ / (_| \__ \ | | |            |"
    echo "|               \_|  |_|  \___/| |\___|\__| \____/ \__,_|___/_| |_|            |"
    echo "|                             _/ |                                             |"
    echo "|                            |__/                                              |"
    echo -e "#==============================================================================#\033[0;39m"
}
function pause(){
    echo ""
    echo ""
    read -p "$texte8"
    wmctrl -r ':ACTIVE:' -b toggle,fullscreen
    clear
    Resultats
}
function MenuPrincipal(){
    clear
    Bandeau
    echo ""
    echo "                              1. $texte1"
    echo ""
    echo "                              2. $texte2"
    echo ""
    echo "                              3. $texte3"
    echo ""
    echo "                              4. $texte4"
    echo ""
    echo "                              5. $texte7"
    echo ""
    echo ""
    echo ""
    read -p "$texte6" choix
    case $choix in 
  1) MenuLancer
  ;; 
  2) cd ..
    ./Launcher.sh
    cd Systeme
  ;; 
  3) Manuel
  ;; 
  4) MenuAPropos
  ;; 
  5) exit
  ;; 
  *) MenuPrincipal
  ;; 
    esac
}
function MenuAPropos(){
    clear
    Bandeau
    echo ""
    echo "                                 $aPropos1"
    echo ""
    echo "                                   Marius DELEUIL"
    echo ""
    echo "                                   Vincent ROLLET"
    echo ""
    echo "                                   Eliot ZOUANIA"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read -p "                $texte5"
    MenuPrincipal

}
function MenuLancer(){
    clear
    Bandeau
    echo ""
    echo "                   $lancer1"
    echo ""
    echo ""
    echo "                    $lancer2"
    echo ""
    echo ""
    echo "                   $lancer3"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read -p "            $lancer4"
    repAScan=`zenity --title "Veuillez selectionner le dossier à scanner" --file-selection --directory 2> /dev/null`
    case $? in  
    0) MenuLancer2
    ;;
    1) MenuLancer
    ;; 
    *) MenuLancer
    ;; 
    esac
}
function MenuLancer2(){
    clear
    Bandeau
    echo ""
    echo "                      $lancer5"
    echo "                     $repAScan"
    echo ""
    echo "      $lancer6"
    echo ""
    echo ""
    echo "    $lancer7"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    read -p "            $lancer4"
    repRes=`zenity --title "Veuillez selectionner le repertoire où l'on sortira les résultats" --file-selection --directory 2> /dev/null`
    case $? in  
    0) MenuLancerConfirm
    ;;
    1) MenuLancer2
    ;; 
    *) MenuLancer2
    ;; 
    esac
}
function MenuLancerConfirm(){
    clear
    Bandeau
    echo "                      $lancer5"
    echo "                     $repRes"
    echo ""
    echo "                       $lancer8"
    echo "                       $repAScan"
    echo ""
    echo "               $lancer9"
    echo "                       $repRes"
    echo ""
    echo "                              1. $lancer10"
    echo "                              2. $lancer11"
    echo "                              3. $lancer12"
    echo ""
    read -p "$texte6" choix
    case $choix in 
      1)
      ./Analyseur.sh "$repRes" "$repAScan"
      ./Interpretation.sh "$repRes" "$repAScan" "$langue"
      ;; 
      2) MenuLancer
      ;; 
      3) MenuPrincipal
      ;; 
      *) MenuLancerConfirm
      ;; 
    esac
    MenuQuestionSortie
}
function MenuQuestionSortie(){

  zenity --question --title "sortie HTML ?" --text "Voulez-Vous une sortie HTML ?" 2> /dev/null
  case $? in 
    0) clear
    Bandeau
    ./SortieHTML.sh "$repRes" "$repAScan" "$repProgramme"
    sortieHTML=0
    ;; 
    1) sortieHTML=1
    ;; 
    *) MenuQuestionSortie
    ;; 
  esac
  Resultats
}
function Resultats(){
   clear
   Bandeau
    echo "                                 $resultats"
    echo "                             $resultats1"
    echo ""
    echo "                              1. $resultats2"
    echo "                              2. $resultats3"
    echo "                              3. $resultats4"
    echo "                              4. $resultats5"
    echo "                              5. $resultats6"
    echo "                              6. $resultats7"
    if [ "$sortieHTML" == "0" ]
    then
    echo "                              7. $resultats8"
    else
    echo ""
    fi
    echo ""
    echo ""
    echo "                              8. $texte7"
    read -p "$texte6" choix
    if [ "$sortieHTML" == "0" ]
    then
      case $choix in 
    1) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
    clear
    cat "$repRes/ResultatAnalyse/AnalyseParType.txt"
    pause
    ;; 
    2) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
    clear
    cat "$repRes/ResultatAnalyse/AnalyseParCategorie.txt"
    pause
    ;; 
    3) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
    clear
    cat "$repRes/ResultatAnalyse/AnalyseParPoids.txt"
    pause
    ;; 
    4) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
    clear
    cat "$repRes/ResultatAnalyse/ListeRisqueFraude.txt"
    pause
    ;; 
    5) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
    clear
    cat "$repRes/ResultatAnalyse/ListeNonIdentifiable.txt"
    pause
    ;; 
    6) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
    clear
    cat "$repRes/ResultatAnalyse/ListeArchive&Contenus.txt"
    pause
    ;;
    7) xdg-open "$repRes/ResultatAnalyse/Resultat.html" 2> /dev/null
    Resultats
    ;;
    8) rm -rf "$repRes/tmp"
      exit
    ;;
    *) Resultats
    ;; 
      esac
    else
      case $choix in 
      1) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
      clear
      cat "$repRes/ResultatAnalyse/AnalyseParType.txt"
      pause
      ;; 
      2) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
      clear
      cat "$repRes/ResultatAnalyse/AnalyseParCategorie.txt"
      pause
      ;; 
      3) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
      clear
      cat "$repRes/ResultatAnalyse/AnalyseParPoids.txt"
      pause
      ;; 
      4) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
      clear
      cat "$repRes/ResultatAnalyse/ListeRisqueFraude.txt"
      pause
      ;; 
      5) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
      clear
      cat "$repRes/ResultatAnalyse/ListeNonIdentifiable.txt"
      pause
      ;; 
      6) wmctrl -r ':ACTIVE:' -b toggle,fullscreen
      clear
      cat "$repRes/ResultatAnalyse/ListeArchive&Contenus.txt"
      pause
      ;;
      7) Resultats
      ;;
      8) rm -rf "$repRes/tmp"
      exit
      ;;
      *) Resultats
      ;; 
        esac
    fi
    
}
function Manuel(){
  clear
  Bandeau
  cat "$repProgramme/ReadMe/$langue.txt"
  echo ""
  read -p "                $texte5"
  MenuPrincipal
}
MenuPrincipal
