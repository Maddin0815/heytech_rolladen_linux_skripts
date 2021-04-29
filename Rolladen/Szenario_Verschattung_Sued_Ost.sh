#!/bin/bash

#Die Zuordnung von Kanalnummern zu sprechenden Namen usw. wird in einer zentralen Datei vorgenommen, weil darauf mehrere Skripte zugreifen werden
source /home/openhabian/scripts_prod/Rolladen/Rolladen_Variablen.config

telnet 192.168.1.151 1002 <<EOF
rhi

rhb
$EG_Buero
$EG_Buero_Verschattung

rhb
$EG_DU_WC
$EG_DU_WC_Verschattung

rhe

EOF

