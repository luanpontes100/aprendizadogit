#!/bin/bash
DATEAMPM=$(LANG=C date +%I:%M\ %p)
DATE=$(date +%H%M)

if [ $DATE -ge 0600 -a $DATE -le 1200 ]
then
	echo "Bom dia!"
elif [ $DATE -ge 1201 -a $DATE -le 1800 ]
then	
		echo "Boa tarde!"
else
		echo "Boa noite!"
fi

echo "Hora atual: $DATEAMPM"