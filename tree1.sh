#!/bin/bash
# -*- coding: utf-8 -*-

echo 

if [ $# -eq 0 ]; then
	ruta=/home/$USER
fi

if [ $# -eq 1 ]; then
	ruta=$1 
fi

echo $ruta

ls $ruta >> /dev/null

if [ $? -eq 2 ]; then
	clear
	echo "Ruta no existe"
	exit 2
fi

ls $ruta -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//\xE2\x9E\xA1   /g' -e 's/^/ /' -e 's/ / /'

for fichero in /home/*
do
	if [ -d $fichero ]; then
		echo "$fichero"
	fi
done

ls -R /home | grep "^d"