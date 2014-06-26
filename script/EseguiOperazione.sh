#!/bin/bash

temporary="/tmp/.tmp.txt";
session=`cat $temporary`;
h=".history";

if test -z "$session";then
	echo "ERRORE. Impostare prima il file '.log'";
	echo "> ERROR: log file not selected;" >> $h;
else
	echo -n "inserisci un'espressione logica: ";
	read expCS;
	exp=`echo "$expCS" |sed -e "s/ //g"`;
	echo "> removed spaces from epression;" >> $h;
	if [[ "$exp" =~ [0-9][-,+,*,/][0-9]+$ ]];then
		echo "Risultato: " $(($exp));
		numRows=`wc --lines $session |egrep -o '[0-9]*'`;
		echo $((numRows+1))": $exp" >> $session;
		echo "> add expression '$exp' to log file;" >> $h;
	else
		echo "ERRORE. Inserire solo valori numerici e operandi validi.";
	fi
fi
exit;
