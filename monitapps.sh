#!/bin/bash

proceso1=`pm2 list | grep checkbtcprice | grep -c online` #checkbtcprice
proceso2=`pm2 list | grep cleanup | grep -c online` #cleanup
proceso3=`pm2 list | grep fiatapi | grep -c online` #fiatapi

if [[ $proceso1 = 1 ]]
then
        varOn1="CHECKBTCPRICE"
else
	varOff1="CHECKBTCPRICE"		        	
fi


if [[ $proceso2 = 1 ]]
then
        varOn2="CLEANUP"
else
	varOff2="CLEANUP"	
fi


if [[ $proceso3 = 1 ]]
then
        varOn3="FIATAPI"	        
else
	varOff3="FIATAPI"	
fi

varOn="$varOn1 $varOn2 $varOn3"
var=`echo $varOn | grep -c "$varOn"`
varOff="$varOff1 $varOff2 $varOff3"

#mensaje="'{\"sms\":\"Los procesos $varOff no se están ejecutando por favor revisarlos\"}'"


if [[ $var != 1 ]]

then
	echo -e "\nerror en $varOff"
	date +%c
	pm2 list
	curl -H "Content-Type: application/json" -X POST   -d "{\"sms\":\"Los procesos $varOff no se están ejecutando, por favor revisarlos\"}" https://4fj5ga6su4.execute-api.us-east-1.amazonaws.com/default/bnkmonitapps

#else
#	echo -e "\ntodo OK"
#	date +%c	
fi 


exit

