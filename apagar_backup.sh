#!/bin/bash
################## LIMPAR BACKUP ###############
#### SCRIPT PARA LIMPAR OS BACKUPS ANTIGOS E DEIXAR SOMENTE UM POR MÊS ##########
cd /mnt/iqnus
for i in $(ls); do
	cd $i;
	find /home/backups -mtime +2 -exec rm -r {} \;

