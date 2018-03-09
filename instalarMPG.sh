#!/bin/bash

man mpg123 >> /dev/null

if [ $? -ne 0 ]; then
	echo -e "A continuación estaremos instalando los paquetes indispensables para el funcionamiento de la prebeshell"
	echo -e '----------------------------------------------'
	sudo apt-get install mpg123
fi
exit 0

