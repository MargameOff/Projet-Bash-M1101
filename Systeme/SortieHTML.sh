#!/bin/bash
#PROJET BASH
echo "                  GENERATION DU FICHIER HTML..."
##########################RECUPERATION DES REPERTOIRES################################################
TMP2="$1"
TMP="$TMP2/tmp"
REP="$2"
resRep="$TMP2/ResultatAnalyse"
repProgramme="$3"
######################################################################################################


########################RECUPERATION DES RESULTATS POUR LE HTML#######################################
nbType=`cat "$TMP/Analyser2.txt" | cut -d ':' -f2 | sort | uniq | wc -l`
nbCat=`cat "$repProgramme/Filtre.txt" | cut -d ':' -f3 | sort | uniq | wc -l`
poidsTotal="`echo $(echo "scale=6;$(cat "$TMP/AnalyserCat.txt" |cut -d ':' -f2 | awk '{s+=$1} END {print s}')/1000000" | bc -l)`Mo"
nbNonIdentifiable=`grep ^.*:.*:.*:.*:data "$TMP/Analyser2.txt" | wc -l`
nbFichierFraude=`grep ^.*:.*:.*:.*:.*:1 "$TMP/Analyser2.txt" | wc -l`
nbArchive=`grep ^.*:.*:.*:.*:archive "$TMP/Analyser2.txt" | wc -l`
nbTotalFichier=`cat "$TMP/Analyser2.txt" | wc -l`
nbInconnuFiltre=`grep ^.*:.*:.*:.*:.*:.*:Inconnu\ Dans\ Le\ Filtre "$TMP/Analyser2.txt" | wc -l`
######################################################################################################
echo "<!DOCTYPE html>
<html>
	<head>
		<meta charset=\"utf-8\" />
        <title>Résultats du Scan Fichier / Projet Bash</title>
        <link rel=\"stylesheet\" href=\"https://cdn.discordapp.com/attachments/782382664442314752/782384499622543360/style.css\">
        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">
		<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>
        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>
        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    </head>
	<body>
        <div class=\"modal fade\" id=\"modalEtatarbo\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">
            <div class=\"modal-dialog modal-dialog-centered modal-lg\" role=\"document\">
                <div class=\"modal-content back\">
                    <div class=\"modal-header\">
                        <h3 class=\"modal-title\" id=\"exampleModalCenterTitle\">Résultats <span class=\"nom_arbo\">Globaux</span>
                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                        <span aria-hidden=\"true\">&times;</span>
                        </button>
                    </div>
                    <div class=\"modal-body middle\">
                        <div class=\"modal-gradient\">
                            <h5>Le Programme a analysé <span class=\"nom_arbo\">$nbTotalFichier</span> fichiers pesant <span class=\"nom_arbo\">$poidsTotal</span> au total</h5>
                        </div>
                        <br>
                        <div class=\"modal-gradient\">
                            <h5>On y retrouve <span class=\"nom_arbo\">$nbType</span> types de fichiers et <span class=\"nom_arbo\">$nbCat</span> catégories de fichiers différentes</h>
                        </div>
						<br>
						<div class=\"modal-gradient\">
                            <h5>Il a repéré également <span class=\"nom_arbo\">$nbFichierFraude</span> fichiers à risque de fraude, avec <span class=\"nom_arbo\">$nbInconnuFiltre</span> fichiers où les paramètres ne sonts pas présent dans le Filtre </h>
                        </div>
						<br>
						<div class=\"modal-gradient\">
                            <h5>Enfin, on observera <span class=\"nom_arbo\">$nbArchive</span> archives et <span class=\"nom_arbo\">$nbNonIdentifiable</span> fichiers Non-Identifiable par la commande file dans la recursion</h>
                        </div>
						<br>
                        <div class=\"modal-code\">
                            <h5>Contenu du filtre (Filtre.txt) :</h5>
                            <pre>`cat "$repProgramme/Filtre.txt"`</pre>
                        </div>
                            
                    </div>
                    <div class=\"modal-footer\">
                        <p style=\"margin: 0 auto; padding: 0.5em 0em;\">&copy; Projet Bash M1101 | DELEUIL, ROLLET, ZOUANIA</p>
                        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Fermer</button> 
                    </div>
                </div>
            </div>
        </div>
        
       <div class=\"modal fade\" id=\"modalfarbo1\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLongTitle\" aria-hidden=\"true\">
            <div class=\"modal-dialog modal-dialog-centered modal-xl\" role=\"document\">
                <div class=\"modal-content\">
                    <div class=\"modal-header\">
                        <h3 class=\"modal-title middle\" id=\"exampleModalCenterTitle\">Analyse par <span class=\"nom_arbo\">Type</span> de Fichier</h3>
                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                        <span aria-hidden=\"true\">&times;</span>
                        </button>
                    </div>
                    <div class=\"modal-body middle\">" >> "$resRep/Resultat.html"
cat "$TMP/Analyser2.txt" | cut -d ':' -f2 | sort | uniq | while read line || [[ -n $line ]];
do
compteur=0
plusPetit=`grep "^$line" "$TMP/AnalyserType.txt" | cut -d ':' -f3`
plusGrand=`grep "^$line" "$TMP/AnalyserType.txt" | cut -d ':' -f4`

echo "
						<h4 class=\"display-5 text-center\">Fichier <span class=\"nom_arbo\">$line</span></h4>
						<div class=\"row d-flex justify-content-center\">
							<ul>
								<li>On retrouve $(grep "^.*:$line" "$TMP/Analyser2.txt" | wc -l) fichiers $line pour un poids total de $(echo "$(echo "scale=6;$(grep "^$line" "$TMP/AnalyserType.txt" | cut -d ':' -f2)/1000000" | bc -l)Mo")</li>
								<li>Le fichier le plus petit est $plusPetit et fait $(echo "$(echo "scale=6;$(grep "^$plusPetit" "$TMP/Analyser2.txt" | cut -d ':' -f3)/1000000" | bc -l)Mo")</li>
								<li>Le fichier le plus grand est $plusGrand et fait $(echo "$(echo "scale=6;$(grep "^$plusGrand" "$TMP/Analyser2.txt" | cut -d ':' -f3)/1000000" | bc -l)Mo")</li>
							</ul>
						</div>  
						<table class=\"table\">
						  <thead class=\"thead-dark\">
							<tr>
							  <th scope=\"col\">N°</th>
							  <th scope=\"col\">Nom du Fichier</th>
							  <th scope=\"col\">Chemin d'acces</th>
							  <th scope=\"col\">Taille en Mo</th>
							  <th scope=\"col\">Authenticité de l'extension</th>
							  <th scope=\"col\">Extension privilégié pour le fichier</th>
							</tr>
						  </thead>
						  <tbody>" >> "$resRep/Resultat.html"
	grep ^.*:$line "$TMP/Analyser2.txt" > "$TMP/AnalyseTmp.txt"
	while read line2
    do
	compteur=$(($compteur+1))
	cheminFichier=$(echo "$line2" | cut -d ':' -f1)
    nomFichier=$(basename -- "$cheminFichier")
    wola=$(grep "^/home.*$line" "$TMP/Analyser2.txt")
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
	echo "
							<tr>
							  <th scope=\"row\">$compteur</th>
							  <td>$nomFichier</td>
							  <td>$cheminFichierF</td>
							  <td>$poidsFichierMo</td>
							  <td class=\"$couleurAuthentique\">$authenticite</td>
							  <td>$extReco</td>
							</tr>">> "$resRep/Resultat.html"
	done<"$TMP/AnalyseTmp.txt"
	echo "
						  </tbody>
						</table>
						<br>" >> "$resRep/Resultat.html"
done
                    echo "</div>
					<div class=\"modal-footer\">
                        <p style=\"margin: 0 auto; padding: 0.5em 0em;\">&copy; Projet Bash M1101 | DELEUIL, ROLLET, ZOUANIA</p>
                        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button> 
                    </div>
                </div>
            </div>
        </div>
        
		<div class=\"modal fade\" id=\"modalfarbo2\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLongTitle\" aria-hidden=\"true\">
            <div class=\"modal-dialog modal-dialog-centered modal-xl\" role=\"document\">
                <div class=\"modal-content\">
                    <div class=\"modal-header\">
                        <h3 class=\"modal-title middle\" id=\"exampleModalCenterTitle\">Analyse par <span class=\"nom_arbo\">Catégorie</span> de Fichier</h3>
                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                        <span aria-hidden=\"true\">&times;</span>
                        </button>
                    </div>
					
                    <div class=\"modal-body middle\">" >> "$resRep/Resultat.html"
cat "$TMP/Analyser2.txt" | cut -d ':' -f5 | sort | uniq | while read line || [[ -n $line ]];
do
compteur=0
plusPetit=$(grep ^$line "$TMP/AnalyserCat.txt" | cut -d ':' -f3)
plusGrand=$(grep ^$line "$TMP/AnalyserCat.txt" | cut -d ':' -f4)
echo "
						<h4 class=\"display-5 text-center\">Catégorie <span class=\"nom_arbo\">$line</span></h4>
						<div class=\"row d-flex justify-content-center\">
							<ul>
								<li>On retrouve $(grep "^.*:.*:.*:.*:$line" "$TMP/Analyser2.txt" | wc -l) fichiers de la catégorie $line pour un poids total de $(echo "$(echo "scale=6;$(grep "^$line" "$TMP/AnalyserCat.txt" | cut -d ':' -f2)/1000000" | bc -l)Mo")</li>
								<li>Le fichier le plus petit est $plusPetit et fait $(echo "$(echo "scale=6;$(grep "^$plusPetit" "$TMP/Analyser2.txt" | cut -d ':' -f3)/1000000" | bc -l)Mo")</li>
								<li>Le fichier le plus grand est $plusGrand et fait $(echo "$(echo "scale=6;$(grep "^$plusGrand" "$TMP/Analyser2.txt" | cut -d ':' -f3)/1000000" | bc -l)Mo")</li>
							</ul>
						</div>  
						<table class=\"table\">
						  <thead class=\"thead-dark\">
							<tr>
							  <th scope=\"col\">N°</th>
							  <th scope=\"col\">Nom du Fichier</th>
							  <th scope=\"col\">Chemin d'acces</th>
							  <th scope=\"col\">Taille en Mo</th>
							  <th scope=\"col\">Type du Fichier</th>
							  <th scope=\"col\">Authenticité de l'extension</th>
							  <th scope=\"col\">Extension privilégié pour le fichier</th>
							</tr>
						  </thead>
						  <tbody>" >> "$resRep/Resultat.html"
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
		echo "
							<tr>
							  <th scope=\"row\">$compteur</th>
							  <td>$nomFichier</td>
							  <td>$cheminFichierF</td>
							  <td>$poidsFichierMo</td>
							  <td>$typeFichier</td>
							  <td class=\"$couleurAuthentique\">$authenticite</td>
							  <td>$extReco</td>
							</tr>">> "$resRep/Resultat.html"
	done<"$TMP/AnalyseTmp.txt"
	echo "
						  </tbody>
						</table>
						<br>" >> "$resRep/Resultat.html"
done
echo "
					</div>
					<div class=\"modal-footer\">
                        <p style=\"margin: 0 auto; padding: 0.5em 0em;\">&copy; Projet Bash M1101 | DELEUIL, ROLLET, ZOUANIA</p>
                        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button> 
                    </div>
                </div>
            </div>
        </div>
		
		<div class=\"modal fade\" id=\"modalfarbo3\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLongTitle\" aria-hidden=\"true\">
            <div class=\"modal-dialog modal-dialog-centered modal-xl\" role=\"document\">
                <div class=\"modal-content\">
                    <div class=\"modal-header\">
                        <h3 class=\"modal-title middle\" id=\"exampleModalCenterTitle\">Analyse par <span class=\"nom_arbo\">Poids</span> de Fichier</h3>
                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                        <span aria-hidden=\"true\">&times;</span>
                        </button>
                    </div>
					
                    <div class=\"modal-body middle\">
						<table class=\"table\">
						  <thead class=\"thead-dark\">
							<tr>
							  <th scope=\"col\">N°</th>
							  <th scope=\"col\">Nom du Fichier</th>
							  <th scope=\"col\">Chemin d'acces</th>
							  <th scope=\"col\">Taille en Mo</th>
							  <th scope=\"col\">Type du Fichier</th>
							  <th scope=\"col\">Authenticité de l'extension</th>
							  <th scope=\"col\">Extension privilégié pour le fichier</th>
							</tr>
						  </thead>
						  <tbody>" >> "$resRep/Resultat.html"
compteur=0
cat "$TMP/Analyser3.txt" | sort -n -r | while read line || [[ -n $line ]];
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
	echo "
							<tr>
							  <th scope=\"row\">$compteur</th>
							  <td>$nomFichier</td>
							  <td>$cheminFichierF</td>
							  <td>$poidsFichierMo</td>
							  <td>$typeFichier</td>
							  <td class=\"$couleurAuthentique\">$authenticite</td>
							  <td>$extReco</td>
							</tr>" >> "$resRep/Resultat.html"
done
echo "
						  </tbody>
						</table>
                    </div>
					<div class=\"modal-footer\">
                        <p style=\"margin: 0 auto; padding: 0.5em 0em;\">&copy; Projet Bash M1101 | DELEUIL, ROLLET, ZOUANIA</p>
                        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button> 
                    </div>
                </div>
            </div>
        </div>
		
		
		<div class=\"modal fade\" id=\"modaldarbo1\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLongTitle\" aria-hidden=\"true\">
            <div class=\"modal-dialog modal-dialog-centered modal-xl\" role=\"document\">
                <div class=\"modal-content\">
                    <div class=\"modal-header\">
                        <h3 class=\"modal-title middle\" id=\"exampleModalCenterTitle\">Liste des Fichiers avec risque de <span class=\"nom_arbo\">Fraude</span> à l'extension</h3>
                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                        <span aria-hidden=\"true\">&times;</span>
                        </button>
                    </div>
					
                    <div class=\"modal-body middle\">
						<table class=\"table\">
						  <thead class=\"thead-dark\">
							<tr>
							  <th scope=\"col\">N°</th>
							  <th scope=\"col\">Nom du Fichier</th>
							  <th scope=\"col\">Chemin d'acces</th>
							  <th scope=\"col\">Taille en Mo</th>
							  <th scope=\"col\">Type du Fichier</th>
							  <th scope=\"col\">Extension privilégié pour le fichier</th>
							</tr>
						  </thead>
						  <tbody>" >> "$resRep/Resultat.html"
compteur=0
grep ^.*:.*:.*:.*:.*:1 "$TMP/Analyser2.txt" | while read line || [[ -n $line ]];
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
	echo "
							<tr>
							  <th scope=\"row\">$compteur</th>
							  <td>$nomFichier</td>
							  <td>$cheminFichierF</td>
							  <td>$poidsFichierMo</td>
							  <td>$typeFichier</td>
							  <td>$extReco</td>
							</tr>" >> "$resRep/Resultat.html"
done
echo "
						  </tbody>
						</table>
                    </div>
					<div class=\"modal-footer\">
                        <p style=\"margin: 0 auto; padding: 0.5em 0em;\">&copy; Projet Bash M1101 | DELEUIL, ROLLET, ZOUANIA</p>
                        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button> 
                    </div>
                </div>
            </div>
        </div>

		<div class=\"modal fade\" id=\"modaldarbo2\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLongTitle\" aria-hidden=\"true\">
            <div class=\"modal-dialog modal-dialog-centered modal-xl\" role=\"document\">
                <div class=\"modal-content\">
                    <div class=\"modal-header\">
                        <h3 class=\"modal-title middle\" id=\"exampleModalCenterTitle\">Liste des Fichiers <span class=\"nom_arbo\">Non-Identifiable par file</span></h3>
                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                        <span aria-hidden=\"true\">&times;</span>
                        </button>
                    </div>
					
                    <div class=\"modal-body middle\">
						<table class=\"table\">
						  <thead class=\"thead-dark\">
							<tr>
							  <th scope=\"col\">N°</th>
							  <th scope=\"col\">Nom du Fichier</th>
							  <th scope=\"col\">Chemin d'acces</th>
							  <th scope=\"col\">Taille en Mo</th>
							</tr>
						  </thead>
						  <tbody>" >> "$resRep/Resultat.html"
compteur=0
grep ^.*:.*:.*:.*:data "$TMP/Analyser2.txt" | while read line || [[ -n $line ]];
do
    compteur=$(($compteur+1))
    cheminFichier=$(echo "$line" | cut -d ':' -f1)
    cheminFichierF="$REP/$cheminFichier"
    (echo "$cheminFichier" | grep -Eq "/home/.*" ) && cheminFichierF=$cheminFichier
    nomFichier=$(basename -- "$cheminFichier")
    poidsFichier=$(echo "$line" | cut -d ':' -f3)
    poidsFichierMo="`echo $(echo "scale=6;$poidsFichier/1000000" | bc -l)`Mo"
	echo "
							<tr>
							  <th scope=\"row\">$compteur</th>
							  <td>$nomFichier</td>
							  <td>$cheminFichierF</td>
							  <td>$poidsFichierMo</td>
							</tr>" >> "$resRep/Resultat.html"
done
echo "
						  </tbody>
						</table>
                    </div>
					<div class=\"modal-footer\">
                        <p style=\"margin: 0 auto; padding: 0.5em 0em;\">&copy; Projet Bash M1101 | DELEUIL, ROLLET, ZOUANIA</p>
                        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button> 
                    </div>
                </div>
            </div>
        </div>

		<div class=\"modal fade\" id=\"modaldarbo3\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLongTitle\" aria-hidden=\"true\">
            <div class=\"modal-dialog modal-dialog-centered modal-xl\" role=\"document\">
                <div class=\"modal-content\">
                    <div class=\"modal-header\">
                        <h3 class=\"modal-title middle\" id=\"exampleModalCenterTitle\">Liste des <span class=\"nom_arbo\">Archives</span> et leurs contenus</h3>
                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                        <span aria-hidden=\"true\">&times;</span>
                        </button>
                    </div>
					
                    <div class=\"modal-body middle\">" >> "$resRep/Resultat.html"
grep ^.*:.*:.*:.*:archive "$TMP/Analyser2.txt" | cut -d ':' -f1 | while read line || [[ -n $line ]];
do
nomArchive=$(basename -- "$line")
compteur=0
echo "
						<h4 class=\"display-5 text-center\">Archive <span class=\"nom_arbo\">$line</span></h4>  
						<table class=\"table\">
						  <thead class=\"thead-dark\">
							<tr>
							  <th scope=\"col\">N°</th>
							  <th scope=\"col\">Nom du Fichier</th>
							  <th scope=\"col\">Chemin d'acces</th>
							  <th scope=\"col\">Taille en Mo</th>
							  <th scope=\"col\">Type du Fichier</th>
							  <th scope=\"col\">Authenticité de l'extension</th>
							  <th scope=\"col\">Extension privilégié pour le fichier</th>
							</tr>
						  </thead>
						  <tbody>" >> "$resRep/Resultat.html"
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
		echo "
							<tr>
							  <th scope=\"row\">$compteur</th>
							  <td>$nomFichier</td>
							  <td>$cheminFichierF</td>
							  <td>$poidsFichierMo</td>
							  <td>$typeFichier</td>
							  <td class=\"$couleurAuthentique\">$authenticite</td>
							  <td>$extReco</td>
							</tr>" >> "$resRep/Resultat.html"
	done< "$TMP/AnalyseTmp.txt"
	echo "
						  </tbody>
						</table>
						<br>" >> "$resRep/Resultat.html"
done
echo "
                    </div>
					<div class=\"modal-footer\">
                        <p style=\"margin: 0 auto; padding: 0.5em 0em;\">&copy; Projet Bash M1101 | DELEUIL, ROLLET, ZOUANIA</p>
                        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button> 
                    </div>
                </div>
            </div>
        </div>

        <header>
            <div class=\"jumbotron\">
				<div class=\"d-flex justify-content-center\">
					<img src=\"https://cdn.discordapp.com/attachments/782382664442314752/782382687871565844/Bash.png\" class=\"img-card\" alt=\"Image d'un fichier\" style=\"max-height: 200px;\"/>
				</div>
                <div class=\"row d-flex justify-content-center\"><h1>Projet Bash | M1101</h1></div>
                <div class=\"row d-flex justify-content-center\"><h3>Programme executé sur $REP</h3></div>
                <div class=\"row d-flex justify-content-center mt-3\">
                    <a href=\"#\" class=\"btn-rgb\" data-toggle=\"modal\" data-target=\"#modalEtatarbo\">Voir Les Résultats 
                        <span class=\"nom_arbo\"> Généraux</span>
                    </a>            
                </div> 
            </div>
        </header>
        <div class=\"container-fluid\">

			<div class=\"card-group\" style=\"margin-top: 1em; margin-bottom: 2em;\">
                <div class=\"card file-card col-sm-7\">
                    <div class=\"card-body\">
                        <div class=\"row\">
                            <div class=\"col-sm-9\">
                                <h4 class=\"card-title\">Analyse par <span class=\"nom_arbo\">Type </span>de Fichier</h4>
                                <hr>
                                <p class=\"card-text\">Résultats de l'Analyse selon les <span class=\"nom_arbo\">$nbType</span> types détectés !</p>
                                <a href=\"#\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#modalfarbo1\">Voir les Résultats</a>
                            </div>
                            <div class=\"col-sm-3 d-flex justify-content-center\">
                                <img src=\"https://cdn.discordapp.com/attachments/782382664442314752/782382923374002176/type.svg\" class=\"img-card\" alt=\"Image d'un fichier\"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class=\"card dir-card col-sm-5\">
                    <div class=\"card-body\">
                        <div class=\"row\">
                            <div class=\"col-md-9\">
                                <h4 class=\"card-title\">Liste des Fichiers avec risque de <span class=\"nom_arbo\">Fraude</span> à l'extension</h4>
								<hr>
                                <p class=\"card-text\">Retrouvez la liste des <span class=\"nom_arbo\">$nbFichierFraude</span> fichiers avec risque de fraude à l'extension et de leurs extensions recommandés</p>
                                <a href=\"#\" class=\"btn-purple\" data-toggle=\"modal\" data-target=\"#modaldarbo1\">Voir la liste</a>
                            </div>
							<div class=\"col-sm-3 d-flex justify-content-center\">
                                <img src=\"https://cdn.discordapp.com/attachments/782382664442314752/782382918756073472/fraude.svg\" class=\"img-card\" alt=\"Image d'un fichier\"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<div class=\"card-group\" style=\"margin-top: 1em; margin-bottom: 2em;\">
                <div class=\"card file-card col-sm-6\">
                    <div class=\"card-body\">
                        <div class=\"row\">
                            <div class=\"col-sm-9\">
                                <h4 class=\"card-title\">Analyse par <span class=\"nom_arbo\">Catégorie </span>de Fichier</h4>
                                <hr>
                                <p class=\"card-text\">Résultats de l'Analyse selon les <span class=\"nom_arbo\">$nbCat</span> catégories Prédéfini !</p>
                                <a href=\"#\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#modalfarbo2\">Voir les Résultats</a>
                            </div>
                            <div class=\"col-sm-3 d-flex justify-content-center\">
                                <img src=\"https://cdn.discordapp.com/attachments/782382664442314752/782382929938481172/categorie.svg\" class=\"img-card\" alt=\"Image d'un fichier\"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class=\"card dir-card col-sm-6\">
                    <div class=\"card-body\">
                        <div class=\"row\">
                            <div class=\"col-md-9\">
                                <h4 class=\"card-title\">Liste des Fichiers <span class=\"nom_arbo\">Non-Identifiable par file</span></h4>
								<hr>
                                <p class=\"card-text\">Retrouvez la liste des <span class=\"nom_arbo\">$nbNonIdentifiable</span> fichiers Non-Identifiable par file</p>
                                <a href=\"#\" class=\"btn-purple\" data-toggle=\"modal\" data-target=\"#modaldarbo2\">Voir la liste</a>
                            </div>
							<div class=\"col-sm-3 d-flex justify-content-center\">
                                <img src=\"https://cdn.discordapp.com/attachments/782382664442314752/782383869990535198/corompu.svg\" class=\"img-card\" alt=\"Image d'un fichier\"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<div class=\"card-group\" style=\"margin-top: 1em; margin-bottom: 3em;\">
                <div class=\"card file-card col-sm-5\">
                    <div class=\"card-body\">
                        <div class=\"row\">
                            <div class=\"col-sm-9\">
                                <h4 class=\"card-title\">Analyse par <span class=\"nom_arbo\">Poids </span>des Fichiers</h4>
                                <hr>
                                <p class=\"card-text\">Résultats de l'Analyse des <span class=\"nom_arbo\">$poidsTotal</span> par ordre décroissants</p>
                                <a href=\"#\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#modalfarbo3\">Voir les Résultats</a>
                            </div>
                            <div class=\"col-sm-3 d-flex justify-content-center\">
                                <img src=\"https://cdn.discordapp.com/attachments/782382664442314752/782382921104490496/poids.svg\" class=\"img-card\" alt=\"Image d'un fichier\"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class=\"card dir-card col-sm-7\">
                    <div class=\"card-body\">
                        <div class=\"row\">
                            <div class=\"col-md-9\">
                                <h4 class=\"card-title\">Liste des <span class=\"nom_arbo\">Archives</span> et leurs contenus</h4>
								<hr>
                                <p class=\"card-text\">Retrouvez la liste des <span class=\"nom_arbo\">$nbArchive</span> Archives et leurs contenus</p>
                                <a href=\"#\" class=\"btn-purple\" data-toggle=\"modal\" data-target=\"#modaldarbo3\">Voir la liste</a>
                            </div>
							<div class=\"col-sm-3 d-flex justify-content-center\">
                                <img src=\"https://cdn.discordapp.com/attachments/782382664442314752/782382925916274748/archive.svg\" class=\"img-card\" alt=\"Image d'un fichier\"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

			</div>
			
			
			<footer>
				<p class=\"text-center small\">Droits réservés à DELEUIL Marius & ROLLET Vincent & ZOUANIA Eliot</p>
			</footer>
        </div>
	</body>
</html>" >> "$resRep/Resultat.html"
clear