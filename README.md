# CodificaDiTestiProgetto 

Il progetto in questione è stato realizzato per l'esame di Codifica di Testi (programma AA 2021/22), a cura del professor Angelo Mario Del Grosso, corso di Laurea in Informatica Umanistica (triennale). 

Studenti responsabili: 
Gabriele Pergola (MAT601761) 
Giuseppe Vincenzo Dylan Toscano (MAT599752) 

Sono state codificate due pagine di manoscritto, in particolare i fogli 3 e 14 - 

prolusioni 1 Il progetto è stato validato con Xerces con il seguente comando: 
java -cp "tools/Xerces-J-bin.2.12.1/xerces-2_12_1/" dom.Counter -v CODIFICA_PERGOLA_TOSCANO.xml 

I file XML e XSL sono stati trasformati con Saxon-HE 10.3 in un file HTML "pagina3.html" con il seguente comando: 
$ java -jar tools/SaxonHE10-3J/saxon-he-10.3.jar -s:CODIFICA_PERGOLA_TOSCANO.xml -xsl:codifica.xsl -o:pagina3.html
