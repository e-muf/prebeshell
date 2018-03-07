

rojo='\033[01;31m'
verde='\033[01;32m'
azul='\033[00;94m'
amarillo='\033[01;93m'
color_base='\033[01;32m'
   
arr=( "" "" "" "" "" "" "" "" "")


  tablero_inicial () {
   echo -e "\t${amarillo}"
   echo -e "\t\t ${arr[0]:-0} | ${arr[1]:-1} | ${arr[2]:-2}\t "
   echo -e "\t\t-----------"
   echo -e "\t\t ${arr[3]:-3} | ${arr[4]:-4} | ${arr[5]:-5}\t "
   echo -e "\t\t-----------"
   echo -e "\t\t ${arr[6]:-6} | ${arr[7]:-7} | ${arr[8]:-8}\t "
  }

  tablero () {
   clear
   echo -e "\t${amarillo}"
   echo -e "\t\t ${arr[0]:-0} | ${arr[1]:-1} | ${arr[2]:-2}\t "
   echo -e "\t\t-----------"
   echo -e "\t\t ${arr[3]:-3} | ${arr[4]:-4} | ${arr[5]:-5}\t "
   echo -e "\t\t-----------"
   echo -e "\t\t ${arr[6]:-6} | ${arr[7]:-7} | ${arr[8]:-8}\t "
  }

  nombre_jugador () {
   if [ -z $jugador1 ]; then
    read -e -p "Introduce el nombre del primer jugador: " jugador1
    sleep 1
   fi
   
   if [ -z $jugador2 ]; then
    read -e -p "Introduce el nombre del segundo jugador: " jugador2
    sleep 1
   fi
     
   if [ -z $jugador1 ] ; then 
     echo -e "${rojo}El nombre del jugandor no puede estar vacío" 
     nombre_jugador
   elif [ -z $jugador2 ]; then
     echo -e "${rojo}El nombre del jugandor no puede estar vacío" 
     nombre_jugador
   fi
   }
   
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
       
  revisa ()  {
   for k in `seq 0 $( expr ${#arr[@]} - 1) `
    do
     if [ ! -z ${arr[$k]} ] ; then
      arreglo[$k]=$k
       if [ "9"  -eq ${#arreglo[@]} ] ; then
        pkill mpg123
        mpg123 -q sad.mp3 &
        sleep 2
        echo -e "${verde}\nNadie gana :( \n"
        sleep 10
        pkill mpg123
        exit
       fi 
     fi
    done
  }
           
  elegir () { 
   celda_vacia
   if [ "$celda" == "empty" ]; then
    arr[$col]="$valor"
   else  
    color_base=${rojo}
    mensaje="La caja no puede estar vacía, Re-Enter $usuario : "
    elegir 
   fi
  } 
         
  celda_vacia () {
   echo -e -n "${color_base}"
   read -e -p "$mensaje" col
   case "$col" in
    [0-8]) if [  -z ${arr[$col]}   ]; then
    celda=empty
   else 
    celda=notempty 
   fi;;
     *)  color_base=$rojo
     mensaje="$usuario Escribe un número entre 0 a 8 : "
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
echo -ne "\033]0;¡Juego del gato!\007"

echo -e "\t ${color_base}---------------------------------"
echo -e "\t | ¡Bienvenido al juego de gato! |"
echo -e "\t --------------------------------- \n"
tablero_inicial

echo -e "${azul}"
echo -e "\nPara continuar escribe y :"
read -n 1 -p ">>" y
echo -e "\n"
sleep 1
     
    if  [ "$y" == "y" ]  ||  [ "$y" == "Y" ]; then
     mpg123 -q soundtrack.mp3 &
     echo -e "GET READY"
     sleep 3
     echo -e "GO!"
     sleep 2
     clear
     nombre_jugador
    else
     echo -e "\n¡Vuelve pronto!"
     exit 
    fi
                
 tablero
  while :
   do
    ((i++))
    value=`expr $i % 2`
    if  [ "$value" == "0" ]; then
     usuario=$jugador1
     echo -e "\n ${azul}"
     mensaje="$usuario introduce tu elección : "
     valor="X"
     elegir 
    else 
     usuario=$jugador2
     echo -e "\n ${azul}"
     mensaje="$usuario introduce tu elección : "
     valor="O"
     elegir 
   fi
 
    tablero
    reglas
    revisa 
  done