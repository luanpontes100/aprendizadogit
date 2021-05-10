#!/bin/bash
echo "========================================================"
echo -e "Relatório do usuário: $1\n"
ID=`cat /etc/passwd | grep "$1" | cut -d: -f3`
ESPACO=`cat /etc/passwd | grep "$1" | cut -d: -f6`
echo "UID: $ID"
echo
echo "Total usado no $ESPACO: `du -mhc $ESPACO | grep total | sed 's/\stotal//'`"
echo
echo "Último login:"
lastlog -u $1
exit 0
