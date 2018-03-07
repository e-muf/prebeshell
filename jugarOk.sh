echo Inserta la palabra para que juegue el user2""
read $user1
clear
echo "Bienvenido al juego del ahorcado"
echo "Escribe una letra"
read $letra
long=${#user1}
#Te genera una secuencia de numeros
while [$errores != ]
for i in $(seq 0 $long);
do
#de 0 hasta el tamaño de la cadena ingresada
   if [ $letra == ${user1[$i]}]; then
	echo "¡Valoras tu vida!"
	echo "El monito sigue vivo"
   fi
done

