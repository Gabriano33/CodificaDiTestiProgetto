<!-- 
  🔧 CodificaDiTestiProgetto 🔧
  Esame di Codifica di Testi — A.A. 2021/22
  Docente: Prof. Angelo Mario Del Grosso
  Corso di Laurea in Informatica Umanistica (Triennale), Università di Pisa

  👨‍💻 Studenti:
  - Gabriele Pergola (MAT601761)
  - Giuseppe Vincenzo Dylan Toscano (MAT599752)

  📝 Descrizione:
  Il progetto consiste nella codifica digitale di due pagine di manoscritto (fogli 3 e 14 - "Prolusioni 1")
  utilizzando linguaggi di markup secondo gli standard di codifica testuale. I file XML sono stati validati
  e trasformati in HTML per la visualizzazione del contenuto codificato.

  ✅ Validazione effettuata con Xerces:
  java -cp "tools/Xerces-J-bin.2.12.1/xerces-2_12_1/" dom.Counter -v CODIFICA_PERGOLA_TOSCANO.xml

  🔁 Trasformazione in HTML con Saxon-HE 10.3:
  java -jar tools/SaxonHE10-3J/saxon-he-10.3.jar -s:CODIFICA_PERGOLA_TOSCANO.xml -xsl:codifica.xsl -o:pagina3.html

  📂 Output generato:
  pagina3.html – visualizzazione HTML del manoscritto codificato

