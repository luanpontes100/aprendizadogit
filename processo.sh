#!/bin/bash


while true
do
	PROCESSO=$(ps afx | grep "$1" | grep -v grep | grep -v "processo.sh")
	#echo $1
	echo $PROCESSO
	#if [ $PROCESSO -eq 0 ]
	#then
#		echo "ATENÇÃO!!!!!11!1!!!1! O processo $TESTE NÃO está em execução"
	sleep 2
#fi
done

