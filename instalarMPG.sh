#!/bin/bash

man mpg123 >> /dev/null

if [ $? -ne 0 ]; then
	echo -e "A continuación estaremos instalando los paquetes indispensables para el funcionamiento de la prebeshell"
	echo -e '----------------------------------------------'
	read -p "Quieres instalar mpg123? (S/n)" op
	if [ $op == "S" || $op == "s" ]; then
		sudo apt-get -y install mpg123 
	fi
fi
clear

man figlet >> /dev/null
if [ $? -ne 0 ]; then
	read -p "Quieres instalar figlet? (S/n)" op
	if [ $op == "S" || $op == "s" ]; then
		sudo apt-get install figlet
	fi
fi
clear

exit 0

