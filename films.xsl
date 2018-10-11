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
            </head>
            <body>
                <h1>Cinématographie</h1>
                <h1>Table des matiètes</h1>
                <ul> <xsl:apply-templates select="films/film" mode="tdm"/></ul>
                <xsl:apply-templates select="films/film" mode="complet">
                    <xsl:sort select="exploitation/nbEntrees" order="descending" data-type="number"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="film" mode="complet">
        <h2>
            <xsl:if test="@sortie > 2006">
                <em id="new">Nouveauté</em> 
            </xsl:if>
            <xsl:value-of select="titre"/>
        </h2>
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
        <p class="histoireStyle">
            <xsl:value-of select="scenario"/>
        </p> 
    </xsl:template>
    
    <xsl:template match="film" mode="tdm">
        <li>
            <xsl:value-of select="titre"/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>

<!-- TODO customize transformation rules 
     syntax recommendation http://www.w3.org/TR/xslt 
-->
 
