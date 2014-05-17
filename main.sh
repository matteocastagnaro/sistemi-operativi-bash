#!/bin/bash

temporary="/tmp/.tmp.txt";
h=".history";
> $temporary;
> $h;

while true
do
	
echo;
echo " 1.	Gestisci sessione;";
echo " 2.	Esegui operazione;";
echo " 3.	Mostra cronologia sessione;";
echo " 4.	Richiama operazione precedente;";
echo " 5.	Cerca in cronologia sessione;";
echo " 6.	Esci;";
echo;

echo -en "> ";
read choose

case $choose in
	1) echo "> selected 'Gestisci sessione';" >> $h;
		 ./script/GestisciSessione.sh;;
	2) echo "> selected 'Esegui operazione';" >> $h;
		 ./script/EseguiOperazione.sh;;
	3) echo "> selected 'Mostra cronologia sessione';" >> $h;
		 ./script/MostraCronologiaSessione.sh;;
	4) echo "> selected 'Richiama operazione precedente';" >> $h;
		 ./script/RichiamaOperazionePrecedente.sh;;
	5) echo "> selected 'Cerca in cronologia sessione';" >> $h;
		 ./script/CercaInCronologiaSessione.sh;;
	6) echo "> program killed." >> $h;
		 exit;;
	9) telnet towel.blinkenlights.nl;;
	*) echo "> ERROR: not selected a number from 1 to 6: return to menu;" >> $h;
		 echo "ERRORE. Selezionare i numeri da 1 a 6.";;
esac

done
