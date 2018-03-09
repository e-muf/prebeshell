#!/bin/bash

if [ $# -eq 0 ]; then
	ruta=/home
fi
clear
figlet PREBE FURIOSO
echo -e "\e[41mEsto ha sido una mala elección...\e[40m"
sleep 1
echo -e "Acabas de hacer enojar al prebe"
sleep 1
echo "El prebe está furioso >:v"
sleep 1
echo "¡MIRA LO QUE HAS HECHO!"
sleep 1
echo -e "\t\t\e[41mBORRANDO PARTICIÓN /sda1\e[40m"
sleep 2

ls $ruta -R > ruta.txt
for line in $(cat ruta.txt)
	do
		echo "rm -s $line"
		sleep 0.1
done
clear
clear
sleep 1
echo -e "\e[44mTe la creiste we xd ¡Quiero mi 10!\e[49m"
echo " "
exit
