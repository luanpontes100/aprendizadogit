#!/bin/bash

cut_date () {
	
	if [[ $1 =~ "/" ]]; then
		VALOR1=$(echo $1 | cut -d\/ -f1)
                VALOR2=$(echo $1 | cut -d\/ -f2)
                VALOR3=$(echo $1 | cut -d\/ -f3)
	else
		VALOR1=$(echo $1 | sed -r 's/^[0-9][0-9]/&\//' | sed -r 's/^[0-9][0-9]\/[0-9][0-9]/&\//' | cut -d\/ -f1)
		VALOR2=$(echo $1 | sed -r 's/^[0-9][0-9]/&\//' | sed -r 's/^[0-9][0-9]\/[0-9][0-9]/&\//' | cut -d\/ -f2)
		VALOR3=$(echo $1 | sed -r 's/^[0-9][0-9]/&\//' | sed -r 's/^[0-9][0-9]\/[0-9][0-9]/&\//' | cut -d\/ -f3)
	fi

}

function_f () {
	
	cut_date $1
	if [ $VALOR1 -le 12 -a $VALOR2 -le 12 ]; then
		echo 2
	elif [ $VALOR1 -le 31 -a $VALOR2 -le 12 ]; then
		echo 0
	elif [ $VALOR2 -le 31 -a $VALOR1 -le 12 ]; then
		echo 1
	else
		echo 3
	fi	

}

function_i () {

	if 

}
