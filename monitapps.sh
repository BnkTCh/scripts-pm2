#!/bin/bash

proceso1=`pm2 status | sed '7q;d' | awk '{print $4,$18}' | grep -c online` #fiatapi
proceso2=`pm2 status | sed '6q;d' | awk '{print $4,$18}' | grep -c online` #cleanup
proceso3=`pm2 status | sed '5q;d' | awk '{print $4,$18}' | grep -c online` #checkbtcprice

if [[ $proceso1 != 1 ]]
then
  #echo "El proceso FIATAPI se encuentra detenido, por favor revisar"
	var1="FIATAPI"       
else
        var=x
fi


if [[ $proceso2 != 1 ]]
then
  #echo "El proceso CLEANUP se encuentra detenido, por favor revisar"
	var2="CLEANUP"
else
        var=x
fi


if [[ $proceso3 != 1 ]]
then
  #echo "El proceso CHECKBTCPRICE se encuentra detenido, por favor revisar"
	var3="CHECKBTCPRICE"
else
        var=x
fi


if [[ $var != x ]]
then
	echo "los servicios $var1 $var2 $var3 estan detenidos... aiuda!"
fi
echo $var

exit
