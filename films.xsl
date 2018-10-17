<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : films.xsl
    Created on : 10 octobre 2018, 11:53
    Author     : CGERBER
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="iso-8859-1" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head> 
                <title> cinematographie </title> 
                <meta charset="UTF-8"/> 
                <link rel="stylesheet" type="text/css" href="films.css"/>
                <link rel="stylesheet" type="text/css" href="scroll.css"/>
                <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
                <script type="text/javascript" src="scroll.js"></script>
            </head>
            <body>
                <div id="main">
                    
                    <section>
                    <h1>Table des matières</h1>
                    <ul><xsl:apply-templates select="films/film" mode="tdm"/></ul></section>

                    <section><h1>Table des matières des acteurs</h1><ul><xsl:apply-templates select="films/acteurDescription"/></ul></section>

                    <xsl:apply-templates select="films/film" mode="complet">
                        <xsl:sort select="exploitation/nbEntrees" order="descending" data-type="number"/>
                    </xsl:apply-templates>       
                </div> 

                <script type="text/javascript">
                    $("#main").onepage_scroll({
                    sectionContainer: "section",
                    easing: "ease",
                    animationTime: 1000,
                    pagination: true,
                    updateURL: false,
                    beforeMove: function(index) {},
                    afterMove: function(index) {},
                    loop: false,
                    keyboard: true,
                    responsiveFallback: false
                    });
                </script>  
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="film" mode="complet">
        <section>
            <a>
                <xsl:attribute name="name"><xsl:value-of select="titre"/></xsl:attribute>
                <h2>
                <xsl:if test="@sortie > 2006">
                    <em id="new">Nouveauté</em> 
                </xsl:if>
                <xsl:value-of select="titre"/>
                </h2>
            </a>
            <i>Film de <xsl:value-of select="//heures"/>h<xsl:value-of select="//minutes"/> sorti en <xsl:value-of select="@sortie"/></i>
            <br/>
            <b>Réalisé par <xsl:value-of select="realisateur"/></b> 
            <ul>
                <xsl:for-each select=".//acteur">
                    <li>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
            <xsl:element name="img">
            <xsl:attribute name="src"><xsl:value-of select="//image/@ref"/></xsl:attribute>
            </xsl:element>
            <p class="histoireStyle">
                <xsl:for-each select="scenario/* | scenario/text() ">
                    <xsl:choose>
                        <xsl:when test="name() = 'ev' or name() = 'keyword' or name() = 'personnage'">
                            <font>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="name()"/>
                                </xsl:attribute>
                                <xsl:value-of select="."/>
                            </font>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </p> 
        </section>
    </xsl:template>
    
    <xsl:template match="film" mode="tdm">
        <li>
            <a>
                <xsl:attribute name="href">#<xsl:value-of select="titre"/></xsl:attribute>
                <xsl:value-of select="titre"/> (<xsl:value-of select="count(.//acteur)"/> acteurs)
                <xsl:for-each select=".//keyword">
                    &#91;<xsl:value-of select="."/>&#93;
                </xsl:for-each>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="acteurDescription">
        <li>
            <xsl:variable name="id" select="@id"/>
            <em>
                <xsl:attribute name="id"><xsl:value-of select="sexe"/></xsl:attribute>
                <xsl:value-of select="prenom"/> 
            </em>&#160;
            <xsl:value-of select="nomA"/>,
            <xsl:value-of select="dateNaissance"/>  
            (<xsl:value-of select="count(/films/film[.//acteur/@ref = $id])"/> films 
            <xsl:for-each select="/films/film[.//acteur/@ref = $id]">&#160;
                <a>
                <xsl:attribute name="href">#<xsl:value-of select="titre"/></xsl:attribute>
                [<xsl:value-of select="position()"/>]
                </a>
            </xsl:for-each>)
        </li>
    </xsl:template>
    
</xsl:stylesheet>

<!-- TODO customize transformation rules 
     syntax recommendation http://www.w3.org/TR/xslt 
-->
 
