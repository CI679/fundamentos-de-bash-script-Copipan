#!/bin/bash

# Tipos de variables: Universal -> Número, Bool o una Cadena.
n1=10
n2=7
echo "El valor de n1 es $n1" #Se antepone $ para referirse al valor de la variable

# Estructuras de control condicionales
# Operadores condicionales < (-lt), > (-gt), >= (-le), <= (-ge),
# == (-eq), != (-ne).
if [[ $n1 -gt $n2 ]]; then #Importante los espacios
	echo "La sentencia es verdadera $n1 $n2"
else
	echo "La sentencia es falsa $n1 $n2"
fi

#Todo programa regresa un valor, si es exitoso es 0
res=$?

echo "El programa se ejecutó $res"
if [[ $? -eq 0 ]]; then	#Evalua el comando que se acaba de correr únicamente
	echo "El programa no tuvo errores..."
else
	echo "Fallo de ejecución..."
fi

#Operadores manipular archivos
#-e: indica si existe un archivo o carpeta
#-d: indica si es una carpeta
#-r -w -x: indica si cuenta con los permisos
#-s: indica si el archivo está vacío

file="./file-demo"

if [[ -s $file ]]; then
	echo "El archivo contiene algo."
else
	echo "El archivo se encuentra vacío."
fi

#Operadores lógicos AND (&&) OR (||)

if [ -r $file ] && [ -x $file ]; then
	echo "El archivo se puede leer y ejecutar"
else
	echo "El archivo no se puede leer ni ejecutar"
fi

#Estructura de control selectiva: case

# $ = array donde $# ($1, $2, $3, ..., $n) -h hola
case $1 in
	hola )
		echo "Bienvenido"
	;;
	adios )
		echo "Adiós"
	;;
	*)
		echo "No te entiendo nadota"
	;;
esac

#Estructuras de control iterativas: while, for

#while
user=""
while [[ $user != "admin" ]]; do
	read -p "¿Cuál es tu usuario?" user
done

#for
for i in {1..5}; do #Estructura each en el rango de {}. i = objeto iterador; obtiene el valor dentro de la estructura de una lista o arreglo = {...}
	echo "El número es $i"
done

for ((i=0; i<=5; i++)); do	#Estructura for donde i = índice
	echo "Otro número es $i"
done


invitados=(pedro juan david maria lulu ivan)
for invitado in ${invitados[@]}; do
	echo "Se ha invitado a $invitado"
done

#Funciones

suma(){
	echo "Hola desde suma."
}

resta(){
	echo $(( $1 - $2))
}

suma
total=$(resta 9 4)

echo "El total es $total"
