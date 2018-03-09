#!/bin/bash
clear
echo -e "\t \e[1;42mTREE\e[49m"
if [ $# -eq 0 ]; then
	ruta=/home
fi

sleep 1

ls $ruta -R > ruta.txt
for line in $(cat ruta.txt)
	do
		echo "$line"
		sleep 0.1
done

echo "Escribe <1> para continuar"
read j
clear
