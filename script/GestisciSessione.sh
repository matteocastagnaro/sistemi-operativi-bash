#!/bin/bash

temporary="/tmp/.tmp.txt";
h=".history"


function imposta(){
	thereisFile="no";
	
	echo -n "imposta: ";
	read choose;

	for file in $(echo "`find -name "*.log" |sort |cut -d"." -f2`" |cut -d'/' -f2); do
		if test "$choose" = "$file"; then
			echo;echo "Il file $choose.log è presente nella directory.";
			echo "> log file selected: $choose.log;" >> $h;
			thereisFile="yes";
			break;
		fi
	done
	
	if test "$thereisFile" = "no";then
		> $choose.log;
		echo "> log file not present. Created $choose.log;" >> $h;
		echo;echo "Creato il file $choose.log.";
	fi
	
	echo "$choose.log" > $temporary;

}

function rimuovi(){
	thereisFile="no";

	echo -n "rimuovi: ";
	read choose;
	
	for file in $(echo "`find -name "*.log" |sort |cut -d"." -f2`" | cut -d'/' -f2); do
		if test "$choose" = "$file"; then
			echo "Il file $choose.log è stato rimosso dalla directory.";
			thereisFile="yes";
			rm $choose.log;
			echo "> log file deleted: $choose.log;" >> $h;
			break;
		fi
	done
	
	if test "$thereisFile" = "no";then
		echo "ERRORE. Impossibile rimuovere $choose.log. File non esistente.";
		echo "> ERROR: log file not deleted: $choose.log not present;" >> $h;
	fi

	> $temporary;
}

listOfLog="$(echo "`find -name "*.log" |sort |cut -d"." -f2`" | cut -d'/' -f2)";

echo;echo "Lista dei file con estensione '.log':";
echo "-------------------------------------";
if test "$listOfLog" = "";then
	echo "(null)";echo;	
else
	echo -n "$listOfLog";echo;
fi
echo "-------------------------------------"
echo;
echo " a) Imposta sessione corrente;";
echo " b) Rimuovi sessione;";
echo " c) Torna al menu;";

read choose

case $choose in
	a) imposta;;
	b) rimuovi;;
	c) exit;
		 echo "> exit to menu;" >> $h;;
	*) echo "ERRORE. Inserire 'a' o 'b'.";
		 echo "> ERROR: insert a valid character;" >> $h;;
esac

exit
