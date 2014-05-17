-- PRIMO ELABORATO DI SISTEMI OPERATIVI AA 2013/2014 --

Il progetto verte sulla creazione di un semplice sistema di calcolo scritto in linguaggio di scripting.

Testo:

Si vuole realizzare uno script bash che implementi un semplice sistema di calcolo.
Eseguendo lo script, apparira' il seguente menu' interattivo:

	1. Gestisci sessione
	2. Esegui operazione
	3. Mostra cronologia sessione
	4. Richiama operazione precedente
	5. Cerca in cronologia sessione
	6. Esci

Il comportamento per ciascuna voce del menu deve essere il seguente.
	Il comando Gestisci sessione deve per prima cosa mostrare un elenco di file sessione (*.log) nella directory corrente ordinati
	per nome, mostrando un file sessione per riga, senza stamparne l'estensione .log.
	Ad esempio, se la cartella contiene i file sessione first.log e second.log, l'output deve essere il seguente:
		first
		second
	Successivamente, deve essere visualizzato il seguente sotto-menu' interattivo:
		a) Imposta sessione corrente
		b) Rimuovi sessione

	Il comando Imposta sessione corrente deve chiedere all'utente di inserire il nome della sessione corrente (ad esempio session).
	A questo punto lo script deve controllare se il file sessione corrispondente (ad esempio session.log) sia gia' presente o meno
	nella directory corrente. Se il file non e' presente, deve essere creato vuoto. L'esecuzione dello script poi deve tornare al
	menu' interattivo iniziale.

	Il comando Rimuovi sessione deve chiedere all'utente di inserire il nome di una sessione da rimuovere (ad esempio session). Lo
	script deve poi controllare che esista il file sessione corrispondente (ad esempio session.log). In caso il file non sia
	presente, lo script deve stampare a video un messaggio di errore e terminare l'esecuzione. Se invece il file e' presente, deve
	essere rimosso. L'esecuzione dello script poi deve tornare al menu' interattivo iniziale.Il comando Esegui operazione deve per
	prima cosa accertarsi che sia stata impostata la sessione corrente dall'utente mediante l'esecuzione del comando 1.a (Gestisci
	sessione → Imposta sessione corrente). In caso contrario, lo script deve stampare a video un messaggio di errore e terminare 
	l'esecuzione. Lo script deve poi chiedere all'utente di inserire un'espressione aritmetica da calcolare. 
	L'espressione aritmetica dovra' essere contenuta su una sola riga di testa e puo' contenere un numero arbitrario di operazioni
	tra interi (+, -, *, /). Lo script deve poi restituire il risultato dell'espressione aritmetica fornita dall'utente e
	memorizzare in coda al file sessione l'espressione aritmetica (solo l'espressione, non il risultato), preceduta da un numero
	progressivo (partendo da 1) e “: ”.

	Il comando Mostra cronologia sessione deve mostrare la cronologia delle espressioni aritmetiche calcolate durante la sessione
	corrente leggendola dal file sessione. Ogni espressione aritmetica va stampata nello stesso formato con cui e' stata

	Il comando Richiama operazione precedente deve chiedere all'utente di inserire l'indice di un'espressione aritmetica gia'
	calcolata in precedenza all'interno della cronologia salvata nel file sessione. Lo script deve poi verificare che il numero
	fornito dall'utente sia effettivamente un indice valido (e che quindi sia maggiore di 0 e minore o uguale al numero di
	espressioni aritmetiche salvate nella cronologia). In caso di indice non valido, lo script deve stampare a video un messaggio 
	di errore e terminare l'esecuzione. Se invece l'indice e' valido, lo script deve recuperare l'espressione aritmetica
	corrispondente dal file sessione e visualizzare il seguente output:
		<espressione> = <risultato>
	dove <espressione> e' l'espressione aritmetica corrispondente all'indice fornita, mentre <risultato> e' il risultato
	dell'espressione calcolata. Si noti l'assenza dell'indice corrispondente all'espressione nella stampa a video.

	Infine, il comando Cerca cronologia sessione deve chiedere all'utente di inserire un certo pattern da ricercare all'intero
	delle espressioni aritmetiche all'interno della cronologia della sessione. Questo pattern potrebbe essere un operatore, un
	numero, o un'espressione aritmetica a sua volta.
	Lo script dovra' quindi stampare tutte le espressioni aritmetiche nella cronologia della sessione che contengano al loro
	interno il pattern fornito dall'utente in ordine decrescente di indice, mantenendo la stampa del loro indice. Questo significa
	che dovranno essere stampate per prime le espressioni piu' recenti (quindi con indice piu' alto) rispetto a quelle meno recenti
	(quindi con indice piu' basso).
