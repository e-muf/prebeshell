#!/bin/bash
clear

if [ $# -eq 2 ]; then
	carpeta=$1
	archivo=$2
fi
if [ $# -ne 2 ]; then
	echo "faltan argumentos"
	exit 0
fi

sleep 1

ls $carpeta -R > carpeta.txt
for line in $(cat carpeta.txt)
do
		if [ $archivo == $line ]; then	
			echo -e "\e[1;35m ARCHIVO $line ENCONTRADO\e[0m"
			exit 0
		fi
done
echo -e "\e[1;36m EL ARCHIVO NO EXISTE EN ESTA CARPETA\e[0m"
sleep 2
clear
