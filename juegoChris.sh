#!/bin/bash

jugar () {
clear
echo -e "\tBienvenido al juego del ahorcado"
echo " "
echo "Jugador1 > Escribe tu nombre por favor:"
read player1
echo "Jugador2 > Escribe tu nombre por favor:"
read player2
echo "Jugador1 > escribe una palabra para el jugador2"
read palabraU2
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
echo "PARTIDA: $partida de $intentos		¡Hola $player2!"
	#contador = 1
	if [ $partida -eq 1 ]
	then
	echo  "            _______          "
	echo  "            |     |          "
	echo  "            | | | |          "
	echo  "            |_____|          "
	echo  "      ____ ___|_|___ ____    "
	echo  "     |                   |   "
	#partida = 2
	elif [ $partida -eq 2 ]
	
	then
	echo  "            _______          "
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
	echo  "            _______          "
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
	
	echo  "            _______          "
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
	echo  -e " \t\t..... PERDISTE    "
	fi
for i in $(seq 0 $long);
do
	echo -n -e "\t${aux[$i]} ";
done
	echo -e "\n"
	echo "Probar con:"
read letra
#Coincidencias
	echo $palabraU2 | grep "$letra" > nul 2>&1 || let partida+=1
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
		echo "¡Felicidades!"
		echo "¡Te libraste de Christopher!"
	else
		echo "Christopher te encontró".
		echo "Haz perdido."
	fi
	sleep 1
	return 0
}
instrucciones () {
clear
echo -e "\t \tINSTRUCCIONES"
echo -e "\tHUYE DE CHRISTOPHER"
echo -e "Chistopher es el mejor amigo de Turing, por lo que ha jurado protegerlo con su vida"
echo -e "Haz hecho enojar a Alan y su amigo te está buscando... Debes huir de él."
echo -e "Este Prebejuego requiere de dos jugadores. El primero es quien pondrá la"
echo -e "palabra que el segundo jugador intentará adivinar.Si adivina a la palabra antes"
echo -e "de utilizar el máximo de oportunidades (6), ¡el jugador 2 gana! y escapa del robot."
echo -e "Si no lo consigue, Christopher aparecerá para arreglar las cuentas pendientes."
echo "Escribe 1 para volver al menú--->"
read b
sleep 1
clear
return 1
}

clear
while :
do
echo -e "*************BIENVENIDO AL JUEGO DE CHRISTOPHER*************\n"
echo "¿Listo para sentirte  más acorralado que con el semestre? :v"
echo ""
echo ""
echo "-----------------------------Menú---------------------------"
echo "<1> Si ya conoces las instrucciones y quieres empezar a jugar..."
echo "<2> Para ver el instructivo..."
echo "<3> Para salir"
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
                exit 1
                ;;
        *)
                echo "Respuesta inválida"
                ;;
  esac
done

