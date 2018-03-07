#!/bin/bash
echo -e "*************BIENVENIDO AL JUEGO DEL AHORCADO*************\n"
echo "¿Listo para sentirte  más ahorcado que con el semstre? :v"
echo ""
echo ""
echo "-----------------------------Menú---------------------------"
echo "1) Si ya conoces las instrucciones y quieres empezar a jugar..."
echo "2) Para ver el instructivo..."
echo "3) Salir"

while :
do
  read option 
  case $option in 
	1)
		clear
		echo "El juego ha iniciado"
		;;
	2)
	      
		echo "Redireccionar al menú"
		;;
	3)
		echo "...Volviendo al menú principal"
		sleep 1
		;;
	*)
		echo "Respuesta inválida"
		;;
  esac
done

