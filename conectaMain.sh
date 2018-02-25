#!/bin/bash

opcion=""
while [ "$opcion" != "salir" ]; do
	clear
	bash $PWD/conectaTitulo.sh
	echo "Junta cuatro fichas para ganar"
	echo "-------------------------------"
	echo "Opciones: "
	echo -e "'man'.    Instrucciones"
	echo -e "'play'.   Jugar"
	echo -e "'salir'.  Salir del juego" 
	read -p ">> " opcion
	case "$opcion" in
		"man")
			clear
			cat $PWD/conectaMan
			echo -n "Presione ENTER para continuar"; read -s
		;;
		"play")
			echo "Hola!!"
			sleep 1
		;;
		"salir")
			echo "Adios!!!"
			sleep 1
			clear
		;;
		*)
			echo "Opcion no valida"
		;;
	esac
done