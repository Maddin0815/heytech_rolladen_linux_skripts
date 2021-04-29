#!/bin/bash

#Die Zuordnung von Kanalnummern zu sprechenden Namen usw. wird in einer zentralen Datei vorgenommen, weil darauf mehrere Skripte zugreifen werden
source /home/openhabian/scripts_prod/Rolladen/Rolladen_Variablen.config

telnet 192.168.100.150 1002 <<EOF
rhi

rhb
$EG_Buero
up

rhb
$EG_DU_WC
up

rhb
$EG_Kueche
up

rhb
$EG_Esszimmer_Links
up

rhb
$EG_Esszimmer_Rechts
up

rhb
$EG_Wohnzimmer_Links
up

rhb
$EG_Wohnzimmer_Rechts
up

rhe

EOF

