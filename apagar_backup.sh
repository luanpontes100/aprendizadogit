#!/bin/bash
################## LIMPAR BACKUP ###############
#### SCRIPT PARA LIMPAR OS BACKUPS ANTIGOS E DEIXAR SOMENTE UM POR MÊS ##########
############ FEITO PARA FREEBSD, PODE PRECISAR DE ADAPTAÇÕES PARA LINUX ########
### Inicialização das váriaveis e do array EXCLUSAO
### POSICAO guarda a posição do array e tempo guarda o tempo maior dos arquivos de um determinado
### mês em formato epoch para fazer comparação em formato inteiro
EXCLUSAO=()
POSICAO=0
TEMPO=0
cd /mnt/iqnus
for FOLDER in $(ls | egrep "gitlab|zabbix"); do
	cd $FOLDER;
### Pega todas as datas disponiveis para rodar o script no formado MÊS/ANO
	for DATE in $(find . -type f -exec stat -t "%m/%Y" -f "%N/%Sm" {} \; | cut -d \/ -f 3,4 | sort -h | uniq); do
			### Se só existir um arquivo em uma determinada data não é feito nada pois entendesse que está concluído
			if [ $(find . -type f -exec stat -t "%m/%Y" -f "%N/%Sm" {} \; | grep "$DATE" | wc -l | sed 's/  //g') = 1 ]; then
				echo "Data $DATE já concluída"
				continue
			else
			## pega todos os arquivos da data e verifica um por um se o epoch é maior que o que está guardado, caso seja menor é inserido
			## no array EXCLUSAO para ser excluído
				for FILE in $(find . -type f -exec stat -t "%s/%m/%Y" -f "%N/%Sm" {} \; | grep "$DATE" ); do
					if [ $(echo $FILE | cut -d\/ -f 3) -gt $TEMPO ]; then
						if [ -n "$ARQUIVO" ];then
							EXCLUSAO[$POSICAO]=$(echo $ARQUIVO | cut -d\/ -f 2)
							POSICAO=$(expr $POSICAO + 1)
						fi
						TEMPO=$(echo $FILE | cut -d\/ -f 3) 
						ARQUIVO=$(echo $FILE | cut -d\/ -f 2)
					else
						EXCLUSAO[$POSICAO]=$(echo $FILE | cut -d\/ -f 2)
						POSICAO=$(expr $POSICAO + 1)
					fi
				done
				echo -e "ARRAY da data $DATE na pasta $FOLDER: \n ${EXCLUSAO[@]} \n FIM da data $DATE \n"
                echo -e "ARQUIVO MAIS VELHO da data $DATE: $ARQUIVO \n TEMPO MAIS VELHO: $TEMPO \n"
				## limpa o array e zera a posição e o tempo para a próxima data
				unset EXCLUSAO
				POSICAO=0
				TEMPO=0
			fi
	done
	cd /mnt/iqnus
done