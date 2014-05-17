#!/bin/bash

temporary="/tmp/.tmp.txt";
session=`cat $temporary`;
h=".history";

if test "$session" = "";then
	echo "ERRORE. Impostare prima il file '.log'";
	echo "> ERROR: log file not selected;" >> $h;
else
	echo;echo "Lista sessione corrente - '$session':";
	if test -z "`cat $session`";then
		echo "(null)";
		echo "> null log file content;" >> $h;
	else
		cat $session;
		echo "> show log file content;" >> $h;
	fi
fi

exit;
