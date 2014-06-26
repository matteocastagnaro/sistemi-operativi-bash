#!/bin/bash

temporary="/tmp/.tmp.txt";
sessione=`cat $temporary`;
h=".history";

if test -z "$sessione";then
	echo "ERRORE. Impostare prima il file '.log'";
	echo "> ERROR: log file not selected;" >> $h;
	exit;
else
	if test -z "`cat $sessione`";then
		echo "File $sessione vuoto!"
	else
		echo -n "Pattern da ricercare nella cronologia: ";
		read pattern	
			while read n
			do
				if test -n "`echo $n | cut -d' ' -f2 | grep -e "$pattern"`"; then
					res=$res"\n"$n
				fi
			done < $sessione
		
			if test -z "$res";then
				echo "ERRORE. Pattern non trovato.";
				echo "> ERROR: pattern not found in log file;" >> $h;
			else
				echo -e "$res" | sort -nr;
				echo "> show pattern in stdout;" >> $h;
			fi
		
	fi
fi
