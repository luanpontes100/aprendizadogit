#!/bin/bash
CAMINHO=$HOME/Backup
ARQ="backup_home_$(date +%Y%m%d%H%M).tgz"

ls $CAMINHO > /dev/null 2>&1 || mkdir $CAMINHO

if [[ "$(find $CAMINHO -name 'backup_home*' -mtime -7)" ]] 
then
	read -p "Já existe um arquivo com esse nome, deseja continuar? (s/n) " RESPOSTA
#	if [ "$RESPOSTA" = "s" -o "$RESPOSTA" = "sim" ]
#	then 
#		tar -cvf ~/Backup/backup_home_$HORA.tgz ~ > /dev/null 2>&1
#		echo "backup concluido"
#		echo 'Backup "`ls -t $CAMINHO | head -n1`" foi criado com sucesso'
#	else
#		echo "Script Encerrado"
#		exit 1
#	fi
	case "$RESPOSTA" in
		[S,s][I,i][M,m])
			tar -cvf ~/Backup/$ARQ ~ > /dev/null 2>&1
			echo "backup concluido"
			echo "Backup $ARQ foi criado com sucesso"
			;;
		[N,n][a,A,Ã,ã][O,o])
			echo "Script Encerrado"
			exit 1
			;;
		*)
			echo "Script encerrado por não estar no padrão informado"
	esac
else
	tar -cvf ~/Backup/$ARQ ~ > /dev/null 2>&1
	echo "backup concluido"
	echo "Backup $ARQ foi criado com sucesso"
fi
exit 0
