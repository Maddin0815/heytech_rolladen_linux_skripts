#!/bin/bash

#Die Zuordnung von Kanalnummern zu sprechenden Namen und die Verschattungsprozente werden in einer zentralen Datei vorgenommen, weil darauf mehrere Skripte zugreifen werden
source /home/openhabian/scripts_prod/Rolladen/Rolladen_Variablen.config


#Der erste übergebene Parameter wird mit dem Namen des Rolladens aus o.g. Datei verglichen und der zugehörige Kanal gesetzt:
#Außerdem wird der Prozentwert für die Verschattung des jeweiligen Rolladens gesetzt.
#Wenn der erste übergebene Parameter ein Szenario enthält, wird dieses ausgeführt und das Skript danach beendet.
case $1 in
		EG_Buero)
		Rolladenkanal=$EG_Buero
		Verschattungsprozent=$EG_Buero_Verschattung
		;;

		EG_DU_WC)
		Rolladenkanal=$EG_DU_WC
		Verschattungsprozent=$EG_DU_WC_Verschattung
		;;

        EG_Kueche)
                Rolladenkanal=$EG_Kueche
		Verschattungsprozent=$EG_Kueche_Verschattung
        ;;

        EG_Esszimmer_Links)
                Rolladenkanal=$EG_Esszimmer_Links
		Verschattungsprozent=$EG_Esszimmer_Links_Verschattung
        ;;

        EG_Esszimmer_Rechts)
                Rolladenkanal=$EG_Esszimmer_Rechts
		Verschattungsprozent=$EG_Esszimmer_Rechts_Verschattung
        ;;

        EG_Wohnzimmer_Links)
                Rolladenkanal=$EG_Wohnzimmer_Links
		Verschattungsprozent=$EG_Wohnzimmer_Links_Verschattung
        ;;

        EG_Wohnzimmer_Rechts)
                Rolladenkanal=$EG_Wohnzimmer_Rechts
        ;;

        Szenario_alle_hoch)
                /home/openhabian/scripts_prod/Rolladen/Szenario_alle_hoch.sh
		exit
        ;;

        Szenario_alle_runter)
                /home/openhabian/scripts_prod/Rolladen/Szenario_alle_runter.sh
		exit
        ;;

        Szenario_Verschattung_Sued_Ost)
                /home/openhabian/scripts_prod/Rolladen/Szenario_Verschattung_Sued_Ost.sh
		exit
        ;;

        Szenario_Verschattung_Sued_West)
                /home/openhabian/scripts_prod/Rolladen/Szenario_Verschattung_Sued_West.sh
		exit
        ;;

        Szenario_Verschattung_West)
                /home/openhabian/scripts_prod/Rolladen/Szenario_Verschattung_West.sh
		exit
        ;;

esac

#Der zweite übergebene Parameter sagt was mit dem einzelnen Rolladen gemacht werden soll und setzt den Modus, der weiter unten dann abgefragt wird.
case $2 in
	hoch)
		Rolladenbefehl="up"
		Modus="einzeln_steuern"
	;;

	runter)
		Rolladenbefehl="down"
		Modus="einzeln_steuern"
	;;

	stopp)
		Rolladenbefehl="off"
		Modus="einzeln_steuern"
	;;

	verschatten)
                Modus="einzeln_verschatten"
        ;;

esac


#Rolladen einzeln hoch/runter fahren oder anhalten
if [ $Modus == "einzeln_steuern" ]
then
telnet 192.168.1.151 1002 <<EOF
rhi

rhb
$Rolladenkanal
$Rolladenbefehl

rhe

EOF
fi


#Rolladen einzeln auf Verschattung fahren
if [ $Modus == "einzeln_verschatten" ]
then
telnet 192.168.1.151 1002 <<EOF
rhi

rhb
$Rolladenkanal
$Verschattungsprozent

rhe

EOF
fi

