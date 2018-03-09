#!/bin/bash
clear
if [ $(whoami) != "root" ]; then
	echo -e 'Debes ingresar a esta shell por medio del superusuario'
	exit 1
fi
echo -ne "\033]0;Bienvenido a nuestra PrebeShell\007"
echo -e '-------------------------------------------'
echo -e '                LOGIN                      '
echo -e '-------------------------------------------'
read -p 'Usuario: ' usuario
echo -n 'Password: '
read -s pass
bash $PWD/login.sh $usuario $pass
echo -ne "\033]0;Bienvenido, $usuario\007"
echo -e "Hola, $usuario"

bash $PWD/instalarMPG.sh

prompt="\033[1;32m$usuario@\033[1;35m$HOSTNAME~\033[1;34m$PWD\033m:~ $ "

while [ opcion != "salir" ]; do
	echo -ne $prompt
	read opcion
	case "$opcion" in
		"prebeplayer")
			bash $PWD/PrebePlayer.sh
		;;
		"conecta4")
			bash $PWD/conectaMain.sh
		;;
		"salir")
			echo "Adios!!!"
			sleep 1
			clear
			exit 1
		;;
		*)
			echo "Opcion no valida"
		;;
	esac
done
