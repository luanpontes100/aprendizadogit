#!/bin/bash

read -p "Digite o primeiro valor: " VALOR1
read -p "Digite o segundo valor: " VALOR2

if [[ -z "$VALOR1" || -z "$VALOR2" ]]
then
	echo "Digite 2 paramêtros para podermos usar o script corretamente."
	echo "Fim do script!"
	exit 1
fi

echo -e "\n1 = Soma\n2 = Subtração\n3 = Multiplicação\n4 = Divisão\nQ = Sair"
read -p "Digite qual operação deseja fazer: " ESCOLHA

case "$ESCOLHA" in 
	1) 
		RESULTADO=`echo "scale=2;$VALOR1+$VALOR2" | bc`
		echo "Soma é igual a $RESULTADO"
		;;
	2)
		RESULTADO=`echo "scale=2;$VALOR1-$VALOR2" | bc`
		echo "Subtração é igual a $RESULTADO"
		;;
	3)
		if [ $VALOR1 = 0 -o $VALOR2 = 0 ]
		then
			echo "Script encerrado, não é permitida operação com zeros"
			exit 1
		else
			RESULTADO=`echo "scale=2;$VALOR1*$VALOR2" | bc`
			echo "Multiplicação é igual a $RESULTADO"
		fi
		;;
	4)
		if [ $VALOR1 = 0 -o $VALOR2 = 0 ]
		then
			echo "Script encerrado, não é permitida operação com zeros"
			exit 1
		else
			RESULTADO=`echo "$VALOR1/$VALOR2" | bc`
			RESTO=`echo "$VALOR1%$VALOR2" | bc`
			if [ $RESTO -gt 0 ]
			then 
				echo "Divisão com resto = $RESULTADO"
				echo "Resto = $RESTO"
			else
				echo "Divisão sem resto = $RESULTADO"
			fi
		fi
		;;
	Q)
		echo "Fim do script por escolha do usuário!"
		exit 0
esac
echo "Fim do script!!"
exit 0