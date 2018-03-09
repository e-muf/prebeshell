#!/bin/bash

######## EL JUEGO DEL GATO MAS SALVAJE, EPICO Y SANGRIENTO QUE TE DEJARA PESADILLAS Y TENDRAS QUE DORMIR ACOMPAÑADO ########
# Alerta de clasificacion B+15

# Autor: David Alejandro Silva López alias el prebe 15 :'v
# Curso Linux PROTECO

# ---------------------------------------------------------------------------------------------------------------- #
# --------------------------------- Ahora si, agarrense que se viene lo shidoooo --------------------------------- #
# ---------------------------------------------------------------------------------------------------------------- #

# Mini-diccionario de colores, porque que hueva estar escribiendolos a cada rato, luego se olvidan
# Asi nada mas escribes ${nombre_color}, chequenlo y de preferencia haganlo tambien en sus juegos :v
rojo='\033[01;31m'
verde='\033[01;32m'
azul='\033[00;94m'
amarillo='\033[01;93m'
color_base='\033[01;32m'
   
# Un arreglo, la parte fundamental del jueguito    
arr=( "" "" "" "" "" "" "" "" "")


  tablero_inicial () {            # Hace echos para mostrar el tablero en la primer parte del programa
   echo -e "\t${amarillo}"
   echo -e "\t\t ${arr[0]:-0} | ${arr[1]:-1} | ${arr[2]:-X}\t "
   echo -e "\t\t-----------"
   echo -e "\t\t ${arr[3]:-3} | ${arr[4]:-0} | ${arr[5]:-X}\t "
   echo -e "\t\t-----------"
   echo -e "\t\t ${arr[6]:-6} | ${arr[7]:-7} | ${arr[8]:-8}\t "
  }

  tablero () {                    # Hace echos del arreglo y muestra el tablero despues del login
   clear
   echo -e "\t${amarillo}"
   echo -e "\t\t ${arr[0]:-0} | ${arr[1]:-1} | ${arr[2]:-2}\t "
   echo -e "\t\t-----------"
   echo -e "\t\t ${arr[3]:-3} | ${arr[4]:-4} | ${arr[5]:-5}\t "
   echo -e "\t\t-----------"
   echo -e "\t\t ${arr[6]:-6} | ${arr[7]:-7} | ${arr[8]:-8}\t "
  }

  ### ¿Que se hace en nombre_jugador?
  # Aqui se pide el nombre de cada jugador y se almacenan en las variables jugador1 y jugador2
  # esto se hace para que se vea mas cool el juego :v 

  nombre_jugador () {
   if [ -z $jugador1 ]; then                                        #Si el tamano de la cadena jugador1 == 0 
    read -e -p ">> Introduce el nombre del primer jugador: " jugador1
    sleep 1
   fi
   
   if [ -z $jugador2 ]; then                                         #Si el tamano de la cadena jugador2 == 0
    read -e -p ">> Introduce el nombre del segundo jugador: " jugador2
    sleep 1
   fi

   
    #Aqui se hace una verificacion de que el nombre del jugador no quede vacío, y se hace con la bandera -z 
   if [ -z $jugador1 ] ; then 
     echo -e "${rojo}El nombre del jugandor no puede estar vacío" 
     nombre_jugador                                  #Uso recursividad de la fcn para que se pida hasta que se ingrese nombre
   elif [ -z $jugador2 ]; then
     echo -e "${rojo}El nombre del jugandor no puede estar vacío" 
     nombre_jugador
   fi
   }

   ### ¿Que hace la fcn reglas?
   # Esta fcn revisa a ver si ya gano alguien, si se cumplen las siguientes reglas, entonces es porque alguien 
   # ya gano y se ejecuta la fcn ganaste
   
     reglas () {
      if [ $valor == "${arr[0]}" ] && [ $valor == "${arr[1]}" ] && [ $valor == "${arr[2]}" ] ; then
      ganaste
      elif [ $valor == "${arr[3]}" ] && [ $valor == "${arr[4]}" ] && [ $valor == "${arr[5]}" ] ; then
      ganaste
      elif [ $valor == "${arr[6]}" ] && [ $valor == "${arr[7]}" ] && [ $valor == "${arr[8]}" ] ; then
      ganaste
      elif [ $valor == "${arr[0]}" ] && [ $valor == "${arr[3]}" ] && [ $valor == "${arr[6]}" ] ; then
      ganaste;
      elif [ $valor == "${arr[1]}" ] && [ $valor == "${arr[4]}" ] && [ $valor == "${arr[7]}" ] ; then
      ganaste
      elif [ $valor == "${arr[2]}" ] && [ $valor == "${arr[5]}" ] && [ $valor == "${arr[8]}" ] ; then
      ganaste
      elif [ $valor == "${arr[0]}" ] && [ $valor == "${arr[4]}" ] && [ $valor == "${arr[8]}" ] ; then
      ganaste
      elif [ $valor == "${arr[2]}" ] && [ $valor == "${arr[4]}" ] && [ $valor == "${arr[6]}" ] ; then
      ganaste
      fi
     }
       
      # seq expresa lo que recorrera el ciclo for desde 0 hasta ...
      # La palabra expr sirve para realizar la operacion que se declare despues 
      # El simbolo del gatito sirve para revisar el valor de la posicion del arreglo
      # [@] es para que se mueva en el arreglo

      #### ¿Que es lo que hace lo que viene a continuacion?
      # La fcn revisa, entrara al arreglo y revisara que es lo que tiene adentro, si ya tiene un valor, entonces lo guardara
      # si no tiene nada, entonces lo dejara nulo. Esto con el objetivo de que despues lo vuelva a revisar, y si ya lo reviso 
      # por completo y todo esta lleno, entonces ya no volvera a pedir nada y sonara la cancion y mostrara el mensaje de nadie gana

  revisa ()  {
   for k in `seq 0 $( expr ${#arr[@]} - 1) `          
    do
     if [ ! -z ${arr[$k]} ] ; then
      arreglo[$k]=$k
       if [ "9"  -eq ${#arreglo[@]} ] ; then
        pkill mpg123                            # Detiene la cancion de fondo
        mpg123 -q sad.mp3 &                     # Play a la cancion triste
        sleep 2
        echo -e "${verde}\nNadie gana :( \n"    # echo mensaje de salida
        sleep 10
        pkill mpg123                            # Detiene la cancion triste
        exit
       fi 
     fi
    done
  }
  

  ### ¿Que hace la fcn elegir?
  # Para cuando se llega aqui, ya se tiene un valor en la variable valor, asi que solo se revisa si la celda esta vacia
  # Si lo esta, entonces asigna el valor. Si el ususario no ingresa ningun valor de 0 o X, entonces hara echo del mensaje          
  # Al igual que el de nombre_usuario existe recursividad ya que no debe quedar esta peticion vacia

  elegir () { 
   celda_vacia
   if [ "$celda" == "empty" ]; then
    arr[$col]="$valor"
   else  
    color_base=${rojo}
    mensaje=">> La caja no puede estar vacía, Re-Enter $usuario : "
    elegir 
   fi
  } 
  

  ### ¿Que hace la fcn celda_vacia?
  # Revisa en el arreglo la posicion que se selecciono, si esta vacia entonces te deja pasar, 
  # pero si no, entonces te vuelve a pedir que escojas un numero de una celda vacia
  # Nuevamente existe la recursividad porque este dato no puede estar vacio 

  celda_vacia () {
   echo -e -n "${color_base}"
   read -e -p "$mensaje" col
   case "$col" in
    [0-8]) if [  -z ${arr[$col]}   ]; then
    celda=empty
    #numero_celda = ${arr[$col]}
   else 
    celda=notempty
    #numero_celda = ${arr[$col]} 
   fi;;
     *)  color_base=$rojo
     mensaje=">> $usuario Escribe un número entre 0 a 8 : "
     celda_vacia;;
   esac
   echo -e -n "${azul}"
  }

  ganaste () {
    echo -e "${verde}\n ¡Felicidades $usuario tú GA-NAS-TE!\n"
    pkill mpg123
    mpg123 -q aplausos.mp3 &
    sleep 10
    pkill mpg123
    break ;
    }
     
# Main
clear
echo -ne "\033]0;¡Juego del gato!\007"    #Esto le cambia el nombre a la ventana de la terminal, esta chido!
echo -e "${verde}"
more gato_ban.txt       # Imprime banner que esta en un archivo txt
tablero_inicial         # Imprime el tablero de la pantalla principal

echo -e "\n*** Para una mejor experiencia usa audifonos ***"
echo -e "${azul}"
echo -e "\n¿Ya te los pusiste? Para continuar escribe s :"      # Se pide la s de start
read -n 1 -p ">>" s                 # Lee lo que se escribio y lo redirecciona a la variable s
echo -e "\n"
sleep 1
     
    if  [ "$s" == "s" ]  ||  [ "$s" == "S" ]; then    # Se hace la comparacion y si es correcta, comienza la partida
     mpg123 -q soundtrack.mp3 &                   # Se reproduce la cancion de Mario Oddissey pa poner ambiente
     echo -e "GET READY"                          # Esto es para que se vea mas pro, y ademas porque la cancion tarda en reproducirse
     sleep 3
     echo -e "GO!"                                # Sorry, aun no soy tan pro :'v
     sleep 2
     clear
     nombre_jugador                               # Pide los nombre de los jugadores
    else
     echo -e "\n¡Vuelve pronto!"                  # Mensaje de salida
     exit 
    fi
                
 tablero                  # Muestra el tablero, ahora si el chido 

 #Se va a pedir una y otra vez a cada usuario que escoja su numero cuando llegue su turno

  while :
   do
    ((i++))
    value=`expr $i % 2`
    if  [ "$value" == "0" ]; then
     usuario=$jugador1
     echo -e "\n ${azul}"
     mensaje=">> $usuario introduce tu elección : "
     valor="X"
     elegir 
    else 
     usuario=$jugador2
     echo -e "\n ${azul}"
     mensaje=">> $usuario introduce tu elección : "
     valor="O"
     elegir 
   fi
 
    tablero
    reglas
    revisa 
  done