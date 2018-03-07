#!/bin/bash

ls /home | grep -o '[a-zA-Z]*' > $PWD/users.txt		
#De la carpeta home, filtramos los directorios que contienen el nombre de los usuarios del SO
echo "root" >> users.txt
#Asumimos que root es un usuario obligatorio del sistema y lo agregamos a nuestra base de datos

if test $# -ne 2
	then
		echo 'Error, por favor ingrese usuario y contraseña'	
		exit 1	
fi

usuario=$1		
pass=$2
#Asignamos a la variable usuario el valor del argumento

#----------------- Usuario y contraseña ----------------------
export pass
contrasena=` grep -w "$usuario" /etc/shadow | cut -d: -f2 `
export algo=` echo $contrasena | cut -d'$' -f2`
export salt=` echo $contrasena | cut -d'$' -f3`
genpass=$(perl -le 'print crypt("$ENV{pass}","\$$ENV{algo}\$$ENV{salt}\$")')

if [ "$genpass" != "$contrasena" ]; then
	echo -e 'Contraseña inválida'	
	sleep 2	
	exit 1	
fi

for line in $(cat users.txt)
do
	if [ "$usuario" = "$line" ];then
		clear
		exit 0
	fi
done
if [ "$usuario" != "$line" ]; then
	echo -e "Usuario no encontrado"
fi

#--------------------------------------------------------------











