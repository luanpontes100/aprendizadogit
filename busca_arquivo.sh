#!/bin/bash

IFS=$'\n'
for NOME in $(cat /etc/passwd)
do
	IDUSER=$(echo $NOME | cut -d : -f 3)
        if [ $IDUSER -ge 1 -a $IDUSER -le 1000000 ]; then
		USUARIO=$(echo $NOME | cut -d : -f 1)
        	DIR=$(echo $NOME | cut -d : -f 6)
		JPG=$(find $DIR -name '*.jpg' | wc -l)
		MP4=$(find $DIR -name '*.mp4' | wc -l)
		MP3=$(find $DIR -name '*.mp3' | wc -l)
		echo  "Usuário: $USUARIO"
		echo  "Arquivos JPG: $JPG"
		echo  "Arquivos MP4: $MP4"
		echo -e "Arquivos MP3: $MP3\n"
	fi
done
IFS=$' \t\n'

