#!/bin/bash
#PROJET BASH
###################################SELECTEUR DE LANGUE####################################################
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
  en) ./Interface.sh en
  ;; 
  fr) ./Interface.sh fr
  ;; 
  ch) ./Interface.sh ch
  ;; 
  de) ./Interface.sh de
  ;; 
  es) ./Interface.sh es
  ;; 
  it) ./Interface.sh it
  ;; 
  la) ./Interface.sh la
  ;; 
  *) ./Interface.sh fr
  ;; 
esac
######################################################################################################