<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"> 
    
    
    <xsl:output method="html" encoding="UTF-8"  indent="yes"/>
    
    <xsl:template match="/">
        <html>
        
            <head>
                <meta name="viewport" content="width=device-width,initial-scale=1" />
                <title><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></title>
                <script type="text/javascript" src="javascript.js"></script>
                <link  rel="stylesheet" type="text/css" href="style.css" />
            </head>
            <body>
            
                <header>
                    <div id="menu">
                        <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></h1>
                        <a href="#informazioni">Info</a>
                        <a href="#pagina14">Pagina 14</a>
                        <a href="#pagina3">Pagina 3</a>
                        <a href="#bibliografia">Bibliografia</a>
                        <a href="#about">About</a>
                    </div>
                </header>
 
                <section id="informazioni" class="info">
                    <div id="bio">
                        <xsl:apply-templates select="//tei:listPerson" /> 
                    </div>
                </section>


                <section id="caratteristiche" class="info">
                    <div>
                        <xsl:apply-templates select="//tei:msContents" />  
                    </div>
                </section>

                <section id="storia" class="info">
                    <div>
                        <xsl:apply-templates select="//tei:history" />
                    </div>                 
                </section>

                <section id="descrizione" class="info">
                    <div>
                        <xsl:apply-templates select="//tei:physDesc" />
                    </div>
                </section>




                
                <section id="foto_prolusioni">
                    <div id="foto">
                        <xsl:apply-templates select="//tei:facsimile" />
                        <span id="descrizione"></span>
                    </div>
                </section>

                
                <div id="bottoni_annotazioni">
                    <h2> Visualizza fenomeni</h2>
                    <button type="button" id="correzioni"> Correzione</button> 
                    <button type="button" id="termine"> Termine </button> 
                    <button type="button" id="cancellazione"> Cancellazione</button> 
                    <button type="button" id="aggiunte">Aggiunte </button> 
                    <button type="button" id="toponimo">Toponimo</button>
                    <button type="button" id="abbreviazione">Abbreviazione </button>
                </div>

                
                <section id="pagine">
                    
                    <button onclick="toggleElement()" type="button" id="cambia">Cambia pagina</button>
                    
                    <div class="pagina">
                        
                        <xsl:attribute name="id">
                            <xsl:value-of select="//tei:div[@n='14']/@facs"/>
                        </xsl:attribute>
                        
                        <h2> Pagina 14 </h2>
                        
                        <div class="testo_pagina">
                            
                            <div class="testo">
                                
                                <h3>Trascrizione pagina 14</h3>
                                
                                <xsl:apply-templates select="//tei:body/tei:div[@n = '14']" />
                            </div>
                            
                            
                            <div class="testo">
                                
                                <h3> Traduzione pagina 14</h3>
                                
                                <xsl:apply-templates select="//tei:div[@type='Prol_1_NUM_CAR_14_TRADUZIONE']" />
                            </div>
                        </div>
                    </div>
                    <!-- traduzione e trascrizione pagina 3 -->

                    <div class="pagina">
                        <xsl:attribute name="id">
                            <xsl:value-of select="//tei:div[@n='3']/@facs" />
                        </xsl:attribute>

                        <h2> Pagina 3 </h2>
                        
                        <div class="testo_pagina">
                            <div class="testo">
                                <h3>Trascrizione pagina 3</h3>
                                <xsl:apply-templates select="//tei:body/tei:div[@n = '3']" />
                            </div>
                     
                            <div class="testo">
                                <h3> Traduzione pagina 3</h3>
                                <xsl:apply-templates select="//tei:div[@type='Prol_1_NUM_CAR_3_TRADUZIONE']" />
                            </div>
                        </div>
                    </div>
                </section>

                <!-- terminologia -->

                <div id="bottTerminologia">
                    <button onclick="Compari()" type="button" id="terminologia"> Clicca per vedere la terminologia</button>
                </div>

                <section id="terminol" style="display:none;">
                    <h2>Glossario</h2>
                    <xsl:apply-templates select="//tei:back/tei:div/tei:list" />
                </section>
                

                <section id="bibliografia">
                    <h2> Bibliografia </h2>
                    <div class="bibliography">
                        <xsl:apply-templates select="//tei:listBibl" />
                    </div>
                </section>

                <footer id="about">
                    <h2>Informazioni sull'edizione del testo</h2>
                    <xsl:apply-templates select="//tei:editionStmt" />
                </footer>
            </body>
        </html>
        </xsl:template>


    <xsl:template match="tei:listPerson">
        <h2> Informazioni autore </h2>
        
        <h3>Autore</h3>

        <p><xsl:value-of select="//tei:person[@xml:id='FDS']/tei:persName" /></p>
        
        <h3>Data di nascita</h3>
        <p>Nato il <xsl:value-of select="//tei:person/tei:birth/tei:date" /> a <xsl:value-of select="//tei:person/tei:birth//tei:settlement" />. </p>
        <h3>Data di morte</h3>
        <p>Deceduto il <xsl:value-of select="//tei:person/tei:death/tei:date" /> a <xsl:value-of select="//tei:person/tei:death//tei:settlement" />.</p>

    </xsl:template>

<!-- template caratteristiche documento -->
    <xsl:template match="tei:msContents">
        <h2> Caratteristiche documento</h2>
        <h3>Autore</h3>
        <p><xsl:value-of select="//tei:person[@xml:id='FDS']/tei:persName" /></p>
        <h3>Titolo</h3>
        <p><xsl:value-of select="//tei:title" /></p>
        <h3>Conservazione</h3>
        <p>Il manoscritto si trova a <xsl:value-of select="//tei:placeName" /> in <xsl:value-of select="//tei:country" />. </p>
        <h3>Data</h3>
        <!-- Docdate -->
        <p> <xsl:value-of select="//tei:title/tei:date" /></p> 
        <h3> Lingua</h3>
        <p> <xsl:value-of select="//tei:textLang" />.</p>
    </xsl:template>

<!-- tamplate descrizione caratteristiche-->
    <xsl:template match="tei:physDesc">
        <h2>Descrizione</h2>
        <h3>Grandezza documento</h3> 
        
        <p>Il manoscritto si compone in: <xsl:apply-templates select="//tei:extent" /></p>
        <h3>Condizioni</h3>
        <p><xsl:value-of select="//tei:condition" /></p>
        <h3>Interventi sul manoscritto</h3>
        <p><xsl:value-of select="//tei:handDesc/tei:p"/></p>
        <h3>Numero di identificazione</h3>
        <p><xsl:value-of select="//tei:idno" /></p>
    </xsl:template>

<!-- template storia -->
    <xsl:template match="tei:history">
        <h2> La storia del manoscritto</h2>
        <p> <xsl:value-of select="//tei:origin/tei:p" /></p>
    </xsl:template>

<!-- template stampa pagine -->
    <xsl:template match="tei:facsimile">
        <h2>Le pagine originali</h2>
        <xsl:for-each select="tei:surface">
            <xsl:element name="img">
                <xsl:attribute name="class">immagini</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

<!-- elenco righe documento  -->
    <xsl:template match="tei:lb">
        <xsl:element name="br" />
        <xsl:element name="b">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs" />
            </xsl:attribute>
            <xsl:attribute name="class">numero</xsl:attribute>
            <xsl:value-of select="@n"/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:ab">
        <xsl:element name="br" />
        <xsl:element name="b">
            <xsl:attribute name="class">pericope</xsl:attribute><br />
            Pericope <xsl:value-of select="@n" />
            
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- correzioni editoriali fatte con choice-->
    <xsl:template match="//tei:choice/tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:choice/tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!--termini-->
    <xsl:template match="tei:term">
        <xsl:element name="span">
            <xsl:element name="a">
                <xsl:attribute name="class">terms</xsl:attribute>
                <xsl:attribute name="href"><xsl:value-of select="@ref" /></xsl:attribute>
                <xsl:apply-templates />
            </xsl:element>
        </xsl:element>
    </xsl:template>


    <!--cancellazioni-->
    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!--per segnalare la cancellatura dell'autore illeggibile-->
    <xsl:template match="tei:gap">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>@ @ @ @ @
        </xsl:element>
    </xsl:template>

    <!--aggiunte-->
    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!--toponimi con attributo placeName-->
    <xsl:template match="tei:placeName">
        <xsl:element name="span">
            <xsl:attribute name="class">placeName</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!--abbreviazioni-->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates  />
        </xsl:element>
    </xsl:template>

    <!-- espansione dell'abbreviazione -->
        <xsl:template match="tei:expan">
            <xsl:element name="span">
                <xsl:attribute name="class">expan</xsl:attribute>
                <xsl:apply-templates  />
            </xsl:element>
        </xsl:template>

    <!-- glossario -->
    <xsl:template match="tei:list">
        <xsl:for-each select="tei:label | tei:item">
           <br />
            <xsl:element name="span" >
                <xsl:attribute name="class">gloss</xsl:attribute>
                <i><xsl:value-of select="tei:term[@xml:lang='fr']"/></i>
                <xsl:value-of select="tei:gloss" />
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
        <xsl:template match="tei:listBibl">
        <xsl:element name="ul">
            <xsl:for-each select="tei:bibl">
                    <xsl:element name="li">
                        
                        <b><xsl:value-of select="tei:title"/></b>,
                        <xsl:for-each select="tei:author">
                            <i><xsl:value-of select="." /></i>,
                        </xsl:for-each>
                        <xsl:for-each select="tei:pubPlace">
                            <xsl:value-of select="."/>,
                        </xsl:for-each>
                        <xsl:value-of select="tei:publisher"/>,
                        <xsl:value-of select="tei:date"/>
                        
                    </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>


<xsl:template match="tei:editionStmt">
  <p><xsl:value-of select="current()/tei:edition" /></p>
  <p>Professore coordinatore del progetto: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMG']"/></p>
  <p>Studenti responsabili della codifica: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='GP']"/> e <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='GVDT']"/></p>
</xsl:template>




</xsl:stylesheet>
