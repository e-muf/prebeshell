#! /bin/bash

#echo -e "\e[34m TEXTOACOLOR \e"

#Aqui se construirá el menu principal
function Main(){			
clear
echo 'Hola'
}


#Comienza el reproductor mp3
function MusicPlayer (){	
echo -ne "\033]0;Bienvenido a la PrebePlayer\007"			
clear
echo -e '\e[31m Regresar al menu anterior [r]\n \e[94m'
echo -e '------------------------------------------------------------------------------------------------'
echo -e '\n\e[32m- Biblioteca Musical -\n \e[94m'
more Musica/Lista.txt
echo -e '------------------------------------------------------------------------------------------------'

echo '(Introduce el nombre de la cancion sin espacios)'		#En posibilidad de cambios
echo 'Reproducir: '
read name
echo -e 'Reproduciendo...\n'
echo 'Pausar/reproducir [s] o barra espaciadora [ ]' #banderas propias del comando mpg123
echo 'Reproducir otra cancion presione [q]'
echo -ne "\033]0;Estás escuchando: $name\007"
mpg123 -q Musica/$name.mp3		#Para esto es necesario tener mpg123 instalado (investigar bien sus banderas)
echo -ne "\033]0;Terminal\007"
}

MusicPlayer	#Por el momento ejecuta la unica funcion avanzada
