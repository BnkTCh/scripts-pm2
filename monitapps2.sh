#!/bin/bash

proceso1=`pm2 status | sed '7q;d' | awk '{print $4,$18}' | grep -c online` #fiatapi
proceso2=`pm2 status | sed '6q;d' | awk '{print $4,$18}' | grep -c online` #cleanup
proceso3=`pm2 status | sed '5q;d' | awk '{print $4,$18}' | grep -c online` #checkbtcprice

if [[ $proceso1 = 1 ]]
then
        varOn1="FIATAPI"
else
	varOff1="FIATAPI"		        	
fi


if [[ $proceso2 = 1 ]]
then
        varOn2="CLEANUP"
else
	varOff2="CLEANUP"	
fi


if [[ $proceso3 = 1 ]]
then
        varOn3="CHECKBTCPRICE"	        
else
	varOff3="CHECKBTCPRICE"	
fi

varOn="$varOn1 $varOn2 $varOn3"
var=`echo $varOn | grep -c "$varOn"`
varOff="$varOff1 $varOff2 $varOff3"

#mensaje="'{\"sms\":\"Los procesos $varOff no se están ejecutando por favor revisarlos\"}'"


if [[ $var != 1 ]]
then
	#echo "error en $varOff"
	curl -H "Content-Type: application/json" -X POST   -d "{\"sms\":\"Los procesos $varOff no se están ejecutando, por favor revisarlos\"}" https://4fj5ga6su4.execute-api.us-east-1.amazonaws.com/default/bnkmonitapps
#else
#echo "todo gucci"	
fi 


exit
