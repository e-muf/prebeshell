#!/bin/bash

bash $PWD/conectaTitulo.sh
echo "Junta cuatro fichas para ganar"
echo "-------------------------------"

declare -a fila1
declare -a fila2
declare -a fila3
declare -a fila4
declare -a fila5
declare -a fila6

for ((i=0;i<7;i+=1)); do
	fila1[i]=0
	fila2[i]=0
	fila3[i]=0
	fila4[i]=0
	fila5[i]=0
	fila6[i]=0
done

tabla(){

	for ((i=0;i<6;i+=1)); do
		for ((j=0;))
		echo -ne "| |\t"
		echo -ne "| |\t"
		echo -ne "| |\t"
		echo -ne "| |\t"
		echo -ne "| |\t"
		echo -ne "| |\t"
		echo -e "\n"
	done
}