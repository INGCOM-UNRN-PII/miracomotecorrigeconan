<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" />

    <!-- Template to match the root element -->
    <xsl:template match="/">
# JaCoCo Report
        <xsl:apply-templates select="//package" />
    </xsl:template>

    <!-- Template to transform package elements -->
    <xsl:template match="package">
        <xsl:text>&#10;</xsl:text>
        <xsl:text>## Paquete: </xsl:text><xsl:value-of select="@name" />
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="class" />
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Template to transform class elements -->
    <xsl:template match="class">
        <xsl:text>&#10;</xsl:text>
        <xsl:text>### Clase: </xsl:text><xsl:value-of select="@name" />
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="method" />
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Template to transform method elements -->
    <xsl:template match="method">
        <xsl:text>&#10;</xsl:text>
        <xsl:text>#### Método: </xsl:text><xsl:value-of select="@name" />
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="counter" />
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Template to transform counter elements -->
    <xsl:template match="counter">
        <xsl:text>&#10;</xsl:text>
        <xsl:text>- </xsl:text>
        <xsl:value-of select="@type" /><xsl:text>: </xsl:text>
        <xsl:value-of select="@covered" /><xsl:text> / </xsl:text>
        <xsl:value-of select="@missed" /><xsl:text> (cubierto / pasado)</xsl:text>
    </xsl:template>
</xsl:stylesheet>

