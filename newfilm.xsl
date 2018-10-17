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
                <table>
                    <tr><th>affiche</th><th>titre</th><th>liste acteurs</th><th>scenario</th><th>nb entrées</th><th>date de sortie</th></tr>
                    <xsl:for-each select="films/film">
                        <tr>
                            <td>
                                <xsl:element name="img"><xsl:attribute name="src"><xsl:value-of select="//image/@ref"/></xsl:attribute></xsl:element>
                            </td>
                            <td>
                                <xsl:value-of select="titre"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

<!-- TODO customize transformation rules 
     syntax recommendation http://www.w3.org/TR/xslt 
-->
 
