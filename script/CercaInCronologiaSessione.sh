#!/bin/bash

temporary="/tmp/.tmp.txt";
session=`cat $temporary`;
h=".history";

if test "$session" = "";then
	echo "ERRORE. Impostare prima il file '.log'";
	echo "> ERROR: log file not selected;" >> $h;
	exit;
else
	echo -en "Pattern da ricercare nella cronologia: ";
	read pattern;
	if test -z "`grep $pattern $session`";then
		echo "ERRORE. Pattern non trovato.";
		echo "> ERROR: pattern not found in log file;" >> $h;
	else	
		echo;grep $pattern $session |sort -nr;
		echo "> show pattern in stdout;" >> $h;
	fi
fi
exit;
