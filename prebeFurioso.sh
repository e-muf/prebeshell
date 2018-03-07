#!/bin/bash

if [ $# -eq 0 ]; then
	ruta=/home
fi
clear
echo "El prebe está furioso >:v"
echo "BORRANDO PARTICIÓN /sda1"

sleep 2

ls $ruta -R > ruta.txt
for line in $(cat ruta.txt)
	do
		echo "rm -s $line"
		sleep 0.1
done
clear
#Insertar imagen
clear
sleep 1
echo "Te la creiste we xd ¡Quiero mi 10!"
