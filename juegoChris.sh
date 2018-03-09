#!/bin/bash

jugar () {
clear
figlet JUGAR
echo -e "\tBienvenido al juego del ahorcado"
echo " "
echo -e "\e[1;33mJugador1 > Escribe tu nombre por favor:\e[0m"
read player1
echo -e "\e[1;33mJugador2 > Escribe tu nombre por favor:\e[0m"
read player2
echo -e "\e[1;34mJugador1 > escribe una palabra para el jugador2\e[0m"
read -s palabraU2
#tamano de la palabra ingresada
let long=`expr length "$palabraU2"`-1
#declaramos arreglos a utilizar
declare -a aux[$long];
declare -a palabraU1[20];

echo "Jugador2 > tienes 6 intentos " 

intentos=6
partida=0
for i in $(seq 0 $long);
do
	aux[$i]=_
	echo ${aux[$i]};
done

for i in $(seq 0 $long);
do
        palabraU1[$i]=${palabraU2:$i:1}
done

clear
#mientras que contador sea menor o igual a intentos
	while test $partida -le $intentos
	do
echo -e "\e[1;31mPARTIDA: $partida de $intentos	      ¡Hola $player2!\e[0m"
	#contador = 1
	if [ $partida -eq 1 ]
	then
	echo  "            _______    NO    "
	echo  "            |     |          "
	echo  "            | | | |          "
	echo  "            |_____|          "
	echo  "      ____ ___|_|___ ____    "
	echo  "     |                   |   "
	#partida = 2
	elif [ $partida -eq 2 ]
	
	then
	echo  "            _______   TAMPOCO    "
	echo  "            |     |          "
	echo  "            | | | |          "
	echo  "            |_____|          "
	echo  "      ____ ___|_|___ ___     "
	echo  "     ()___)         ()__)    "
	echo  "     // /|  PR       |\ \\   "
	echo  "    // / |           | \ \\  "
	echo  "   (___) |___________| (___) "
	echo  "   (___)   (_______)  (___)  "
	
	elif [ $partida -eq 3 ]
	then
	echo  "            _______   MENOS  "
	echo  "            |     |          "
        echo  "            | | | |          "
	echo  "            |_____|          "
	echo  "      ____ ___|_|___ ___     "
	echo  "     ()___)         ()___)   "
	echo  "     // /|  PROT     |\ \\   "
	echo  "    // / |           | \ \\  "
	echo  "   (___) |___________| (___) "
	echo  "   (___)   (_______)   (___) "
	echo  "   (___)     (___)     (___) "
	echo  "   (___)      |_|      (___) "
	echo  "   (___)  ___/___\___   | |  "
	echo  "    | |  |           |  | |  "
	echo  "    | |  |___________| /___\ "
	
	elif [ $partida -eq 4 ]
	then
	
	echo  "            _______   FALLASTE "
	echo  "            |     |          "
	echo  "            | | | |          "
	echo  "            |_____|          "
	echo  "      ____ ___|_|___ ___     "
	echo  "     ()___)         ()___)   "
	echo  "     // /|  PROTEC   |\ \\   "
	echo  "    // / |           | \ \\  "
	echo  "   (___) |___________| (___) "
	echo  "   (___)   (_______)   (___) "
	echo  "   (___)     (___)     (___) "
	echo  "   (___)      |_|      (___) "
	echo  "   (___)  ___/___\___   | |    "
	echo  "    | |  |           |  | |    "
	echo  "    | |  |___________| /___\   "
	echo  "   /___\  |||     ||| //   \\  "
	echo  "  //   \\ |||     ||| \\   //  "
	echo  "  \\   // |||     |||  \\ //   "
	echo  "   \\ // ()__)   (__()         "
	
	#contador mayor o igual que 5
	elif [ $partida -ge 5 ]
	then
	echo  "            _______          "
	echo  "            |     |          "
	echo  "            | | | |          "
	echo  "            |__=__|          "
	echo  "      ____ ___|_|___ ___     "
	echo  "     ()___)         ()___)   "
	echo  "     // /|  PROTECO  |\ \\   "
	echo  "    // / |     36    | \ \\  "
	echo  "   (___) |___________| (___) "
	echo  "   (___)   (_______)   (___) "
	echo  "   (___)     (___)     (___) "
	echo  "   (___)      |_|      (___) "
	echo  "   (___)  ___/___\___   | |  "
	echo  "    | |  |           |  | |  "
	echo  "    | |  |___________| /___\ "
	echo  "   /___\  |||     ||| //   \\  "
	echo  "  //   \\ |||     ||| \\   //  "
	echo  "  \\   // |||     |||  \\ //   "
	echo  "   \\ // ()__)   (__()         "
	echo  "         ///       \\\         "
	echo  "        ///         \\\        "
	echo  "      _///___     ___\\\_      "
	echo  "     |_______|   |_______|     "
	echo  -e "........ I will found you man/woman  "
	fi
for i in $(seq 0 $long);
do
	echo -n -e "\t${aux[$i]} ";
done
	echo -e "\n"
	echo "Probar con:"
read letra
#Coincidencias
	echo $palabraU2 | grep "$letra" > arch.txt 2>&1 || let partida+=1
for i in $(seq 0 $long);
do
	if [ ${palabraU1[$i]} = "$letra" ];then
		aux[$i]=$letra
fi
done
	for i in $(seq 0 $long);
	do
		echo -n "${aux[$i]} ";
	done
clear
	if [ "$partida" -ge "$intentos" ];
	then
		break
	fi
	i=0
	tot=`while test $i -le $long; do echo -n ${aux[$i]}; let i+=1; done`
	if [ "$tot" == "$palabraU2" ];
	then
		break;
	fi
	done
	if [ "$tot" == "$palabraU2" ];
	then
		echo -e "\e[1;33m¡Felicidades!\e[0m"
		echo "¡Te libraste de Christopher!"
	else
		echo -e "\e[1;31mChristopher te encontró\e[0m".
		echo "Haz perdido."
	fi
	sleep 1
	clear
	return 0
}
instrucciones () {
clear
figlet INSTRUCCIONES
echo -e "\e[1;34mHUYE DE CHRISTOPHER\e[0m"
echo -e "Chistopher es el mejor amigo de Turing, por lo que ha jurado protegerlo con su vida"
echo -e "Haz hecho enojar a Alan y su amigo te está buscando... Debes huir de él."
echo -e "Este Prebejuego requiere de dos jugadores. El primero es quien pondrá la"
echo -e "palabra que el segundo jugador intentará adivinar.Si adivina a la palabra antes"
echo -e "de utilizar el máximo de oportunidades (6), ¡el jugador 2 gana! y escapa del robot."
echo -e "Si no lo consigue, Christopher aparecerá para arreglar las cuentas pendientes."
echo -e "\e[1;46mEscribe 1 para volver al menú--->\e[0m"
read b
sleep 1
clear
return 1
}

clear
while :
do
figlet JUEGO DE CHRISTOPHER
echo -e "\e[1;44m*************		BIENVENIDO		*************\e[0m"
echo -e "   \e[1;46m¿Listo para sentirte  más acorralado que con el semestre? :v\e[0m"
echo ""
echo ""
echo -e "			   Menú                                "
echo " "
echo -e "\e[1;41m<1> Si ya conoces las instrucciones y quieres empezar a jugar...\e[0m"
echo -e "\e[1;42m<2> Para ver el instructivo...\e[0m"
echo -e "\e[1;43m<3> Para salir\e[0m"
read option 
case $option in 
        1)
                clear
                jugar
                ;;
        2)

                instrucciones
                ;;
        3)
                echo "Adiós"
		sleep 1
		clear 
	        exit 1
                ;;
        *)
                echo "Respuesta inválida"
                ;;
  esac
done

