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
		echo "${VALOR1}/${VALOR2}/${VALOR3}"
}

function_f () {
}
