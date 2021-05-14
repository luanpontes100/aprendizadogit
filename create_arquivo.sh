#!/bin/bash

echo -e "Bem vindo ao programa de criação de arquivos, siga os passos indicados e aguarde a criação" 
read -p "Digite o nome do arquivo que deseja criar: " ARQ
read -p "Digite o tamanho do arquivo que deseja criar(em bytes): " SIZE
read -p "Digite os caracteres que o arquivo será preenchido: " CHAR

if [[ "$(find . -name $ARQ)" ]]; then
	echo "ARQUIVO JÁ EXISTE, SERÁ LIMPADO PARA CONTINUAR O PROCESSO"
	echo "" > $ARQ
	echo "ARQUVIO ZERADO"
fi	
until [ $(stat --printf=%s $ARQ) -ge $SIZE ]; do
	echo "$CHAR" >> $ARQ
	ARQ_SIZE=$(stat --printf=%s $ARQ)
	echo "ARQUIVO: $ARQ_SIZE"
        echo "`expr \( $ARQ_SIZE \* 100 \) % $SIZE`"	
	if [ $(expr \( $ARQ_SIZE \* 100 \) % $SIZE ) -eq 0 ]; then
		PORCENT=$(expr \( $ARQ_SIZE \* 100 \) \/ $SIZE)
		echo "PORCENTAGEM É: $PORCENT"
		echo
	else
		continue
        fi	
	if [ $(expr $PORCENT % 10) -eq 0 ]; then
		echo 
		echo "CONCLUÍDO: $PORCENT % - Tamanho do arquivo = $ARQ_SIZE"
	fi
done

