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
	        echo $line | grep -E '^/'  >> /dev/null
		if [ $? -eq 0 ]; then	
			echo -e "\e[1;35m-----> $line\e[0m"
		else
			echo -e "\e[1;36m------------> $line\e[0m"
		fi
done

echo -e "\e[1;35mEscribe <1> para continuar\e[0m"
read j
clear
