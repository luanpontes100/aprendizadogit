#!/bin/bash
################## LIMPAR BACKUP ###############
#### SCRIPT PARA LIMPAR OS BACKUPS ANTIGOS E DEIXAR SOMENTE UM POR MÊS ##########
cd /mnt/iqnus
for FOLDER in $(ls); do
	cd $FOLDER
	find . -newermt "2021-06-01" ! -newermt "2021-07-01" -exec stat -t "%s" -f "%N/%Sm" {} \;
	

