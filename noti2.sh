#!/bin/bash
# 1. Verifica si estan corriendo los procesos
# 2. Si falla alguno, los vuelve a lanzar
PROCESO1=`ps aux | grep -c /home/ubuntu/hello.js`
if [[ $PROCESO1 != 2 ]]
 then
  echo "vamos a reiniciar"
	#php -f /ruta/nombreProceso1.php &
else
	echo "no pasa nda"
fi


#PROCESO2=`ps aux | grep -c nombreProceso2`
#if [[ $PROCESO2 -eq 1 ]]
 #then
  #php -f /ruta/nombreProceso2.php &
#fi
exit $1
