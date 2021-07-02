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

	 cut_date $1
	if [ $VALOR1 -eq $VALOR2 -a $VALOR1 -le 12 -a $VALOR2 -le 12 ]; then
		echo "${VALOR1}/${VALOR2}/${VALOR3}"
		TIPO=1
 	elif [ $VALOR1 -le 12 -a $VALOR2 -le 12 ]; then
		echo "Impossivel determinar data"
		TIPO=0
	elif [ $VALOR1 -le 31 -a $VALOR2 -le 12 ]; then
		echo "${VALOR2}/${VALOR1}/${VALOR3}"
		TIPO=1
	elif [ $VALOR2 -le 31 -a $VALOR1 -le 12 ]; then
		echo "${VALOR1}/${VALOR2}/${VALOR3}"
		TIPO=2
	else
		echo "Data Inválida"
		TIPO=3
	fi	

}

function_b (){

	cut_date $1
	echo "${VALOR1}/${VALOR2}/${VALOR3}"

}


function_e (){

	function_i $1 > /dev/null
	case $TIPO in
		0)
		   	echo "Impossível determinar o padrão de data."
	 	   	echo "1 - BR (DD/MM/AAAA)"
		   	echo "2 - US (MM/DD/AAAA)"
		   	read -p "Informe o formato(1 ou 2): " TIPO
		   	if [ $TIPO -eq 1 ]; then
				echo "$VALOR1 de `date --date="$VALOR2/01/2021" +%B` de $VALOR3"
		   	else
				echo "$VALOR2 de `date --date="$VALOR1/01/2021" +%B` de $VALOR3"
	  	   	fi
			;;
		
		1)
			echo "$VALOR1 de `date --date="$VALOR2/01/2021" +%B` de $VALOR3"
			;;
		
		2)
			echo "$VALOR2 de `date --date="$VALOR1/01/2021" +%B` de $VALOR3"
			;;
		
		3)
			echo "Data inválida"
	
	esac

}


if [ $# -le 1 ]; then
	echo "número insuficiente de parametros"
	echo "Uso: [Opções] [DATA]"
        echo -e "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /\nOpções:"
        echo "-f,--format = Retorna 0 para BR, 1 para US e 2 quando impossível determinar, 3 Inválido"
        echo "-i,--inverter = Inverte formato BR para US e US para BR. Inclui as Barras"
        echo "-b,--barras = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981"
        echo "-e,--extenso = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1981"
else
	OPTION="$1"
	case $OPTION in

		-e|--extenso) 
			function_e $2
			;;
		-f|--formato)
			function_f $2
			;;
		-i|--inverter)
			function_i $2
			;;
		-b|--barras)
			function_b $2
			;;
		-h|--help)
			echo "Uso: [Opções] [DATA]"
			echo -e "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /\nOpções:"
			echo "-f,--format = Retorna 0 para BR, 1 para US e 2 quando impossível determinar, 3 Inválido"
			echo "-i,--inverter = Inverte formato BR para US e US para BR. Inclui as Barras"
			echo "-b,--barras = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981"
			echo "-e,--extenso = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1981"
			;;
		*)
			echo "Opção inválida"
			echo -e "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /\nOpções:"
                	echo "-f = Retorna 0 para BR, 1 para US e 2 quando impossível determinar, 3 Inválido"
                	echo "-i = Inverte formato BR para US e US para BR. Inclui as Barras"
                	echo "-b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981"
                	echo "-e = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1981"
	esac
fi	



#function_f $2
#function_i $2
#function_b $2
#function_e $2
