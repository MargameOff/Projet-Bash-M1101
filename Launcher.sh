#!/bin/bash
#PROJET BASH
###################################SELECTEUR DE LANGUE####################################################
presence=$(dpkg-query -l | grep "zenity")
if [ "$presence" == "" ]
then
    sudo apt-get install zenity
else
    echo "Zenity deja Installe"
fi
kb=(   en:English
       fr:Francais
       ch:中文
       de:Deutsche
       es:España
       it:Italiano
       la:Latine)

zen_opts=( --width="260" --height="280"
           --title="Language selection"
           --text="Please select your language"
           --print-column="3"
           --radiolist --list 
           --column="" --column="Country" --column='Country Code' )

for k in "${kb[@]}"
do
  zen_opts+=( "" "${k#*:}" "${k%%:*}" )
done
ans=$( zenity "${zen_opts[@]}" 2> /dev/null )
cd Systeme
case $ans in 
  en) bash Interface.sh en
  ;; 
  fr) bash Interface.sh fr
  ;; 
  ch) bash Interface.sh ch
  ;; 
  de) bash Interface.sh de
  ;; 
  es) bash Interface.sh es
  ;; 
  it) bash Interface.sh it
  ;; 
  la) bash Interface.sh la
  ;; 
  *) bash Interface.sh fr
  ;; 
esac
######################################################################################################