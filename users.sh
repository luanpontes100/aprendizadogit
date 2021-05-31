#!/bin/bash

#OLDIFS=$IFS
IFS=$'\n'

echo -e "USUARIO \t UID \t DIR HOME \t NOME OU DESCRIÇÃO"
for NOME in $(cat /etc/passwd) 
do
	IDUSER=$(echo $NOME | cut -d : -f 3)
	if [ $IDUSER -ge 1000 -a $IDUSER -le 60000 ] 
	then
		USUARIO=$(echo $NOME | cut -d : -f 1)
		DIR=$(echo $NOME | cut -d : -f 6)
		DESC=$(echo $NOME | cut -d : -f 5)
		echo -e "$USUARIO \t\t $IDUSER \t $DIR \t $DESC"
	fi
done
IFS=$' \t\n'


