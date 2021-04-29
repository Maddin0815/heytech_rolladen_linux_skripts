#!/bin/bash

#Die Zuordnung von Kanalnummern zu sprechenden Namen usw. wird in einer zentralen Datei vorgenommen, weil darauf mehrere Skripte zugreifen werden
source /home/openhabian/scripts_prod/Rolladen/Rolladen_Variablen.config

telnet 192.168.100.150 1002 <<EOF
rhi

rhb
$EG_Kueche
$EG_Kueche_Verschattung

rhb
$EG_Esszimmer_Links
$EG_Esszimmer_Links_Verschattung

rhe

EOF

