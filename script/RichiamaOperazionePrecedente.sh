#!/bin/bash

temporary="/tmp/.tmp.txt";
session=`cat $temporary`;
h=".history";

if test "$session" = "";then
	echo "ERRORE. Impostare prima il file '.log'";
	echo "> ERROR: log file not selected;" >> $h;
else
	maxIndex=`wc --lines $session |egrep -o '[0-9]*'`;
	if test $maxIndex=0;then
		echo "ERRORE. File '$session' vuoto.";
		exit;
	fi
	echo -en "Inserisci l'indice di un'espressione aritmetica: ";
	read index;
	if test -z "$index";then
		echo "ERRORE. Inserire un indice valido.";
		echo "> ERROR: not valid index;" >> $h;
	else
		if test $index -gt 0 && test $index -le $maxIndex; then
			row=`sed -n $index'p' $session`;
			expression=`echo "$row" |cut -d' ' -f2`;
			echo $expression "=" $(($expression));
			res=$(($expression));
			echo "> expression result: $res;" >> $h;
		else
			echo "ERRORE. Inserire un indice minore o uguale di $maxIndex.";
			echo "> ERROR: index greater than maxIndex ( = $maxIndex);" >> $h;
		fi
	fi
fi
exit
