#!/bin/bash

proceso1=`pm2 status | sed '7q;d' | awk '{print $4,$18}' | grep -c online` #fiatapi
proceso2=`pm2 status | sed '6q;d' | awk '{print $4,$18}' | grep -c online` #cleanup
proceso3=`pm2 status | sed '5q;d' | awk '{print $4,$18}' | grep -c online` #checkbtcprice


if [[ $proceso1 != 1 ]]
then
  echo "vamo a reiniciar esta vaina fiatapi"
       
#else
 #       echo "no pasa nda"
fi


if [[ $proceso2 != 1 ]]
then
  echo "vamo a reiniciar esta vaina cleanup"

#else
 #       echo "no pasa nda"
fi


if [[ $proceso3 != 1 ]]
then
  echo "vamo a reiniciar esta vaina checkbtcprice"

#else
 #       echo "no pasa nda"
fi



exit
