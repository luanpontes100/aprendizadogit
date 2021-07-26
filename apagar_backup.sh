#!/bin/bash
################## LIMPAR BACKUP ###############
#### SCRIPT PARA LIMPAR OS BACKUPS ANTIGOS E DEIXAR SOMENTE UM POR MÊS ##########
############ FEITO PARA FREEBSD, PODE PRECISAR DE ADAPTAÇÕES PARA LINUX ########
EXCLUSAO=()
POSICAO=0
TEMPO=0
cd /mnt/iqnus
<<<<<<< HEAD
for FOLDER in $(ls | egrep "gitlab|zabbix"); do
	cd $FOLDER;
	for DATE in $(stat -t "%m/%Y" -f "%N/%Sm" * | cut -d \/ -f 2,3 | sort -h | uniq); do
			if [ $(find . -exec stat -t "%m/%Y" -f "%N/%Sm" {} \; | grep "$DATE" | wc -l | sed 's/  //g') = 1 ]; then
				echo "Data $DATE já concluída"
				continue
			else
				for FILE in $(find . -exec stat -t "%s/%m/%Y" -f "%N/%Sm" {} \; | grep "$DATE" ); do
					if [ $(echo $FILE | cut -d\/ -f 3) -gt $TEMPO ]; then
						TEMPO=$(echo $FILE | cut -d\/ -f 3) 
						ARQUIVO=$(echo $FILE | cut -d\/ -f 2)
						
					else
						EXCLUSAO[$POSICAO]=$(echo $FILE | cut -d\/ -f 2)
						POSICAO=$(expr $POSICAO + 1)
					fi
				done
			
	done
=======
for FOLDER in $(ls); do
	cd $FOLDER
	find . -newermt "2021-06-01" ! -newermt "2021-07-01" -exec stat -t "%s" -f "%N/%Sm" {} \;
	

>>>>>>> c27fd808093d8a024c85a5f97a9089a5a1e2ff28
