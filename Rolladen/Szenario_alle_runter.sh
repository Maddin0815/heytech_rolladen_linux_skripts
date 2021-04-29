#!/bin/bash

#Die Zuordnung von Kanalnummern zu sprechenden Namen usw. wird in einer zentralen Datei vorgenommen, weil darauf mehrere Skripte zugreifen werden
source /home/openhabian/scripts_prod/Rolladen/Rolladen_Variablen.config

telnet 192.168.1.151 1002 <<EOF
rhi

rhb
$EG_Buero
down

rhb
$EG_DU_WC
down

rhb
$EG_Kueche
down

rhb
$EG_Esszimmer_Links
down

rhb
$EG_Esszimmer_Rechts
down

rhb
$EG_Wohnzimmer_Links
down

rhb
$EG_Wohnzimmer_Rechts
down

rhe

EOF

