<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pmd="http://pmd.sourceforge.net/report/2.0.0">
  <xsl:variable name="newline" select="'&#10;'" />
  <xsl:output method="text"/>

  <!-- Root template -->
  <xsl:template match="/pmd:pmd">
## PMD
    <xsl:apply-templates select="pmd:file"/>
    <xsl:apply-templates select="pmd:error"/>
    <xsl:apply-templates select="pmd:suppressedviolation"/>
    <xsl:apply-templates select="pmd:configerror"/>
  </xsl:template>

  <!-- File template -->
  <xsl:template match="pmd:file">
### Archivo <xsl:value-of select="@name"/>
    <xsl:apply-templates select="pmd:violation"/>
  </xsl:template>

  <!-- Violation template -->
  <xsl:template match="pmd:violation">
#### <xsl:value-of select="@rule"/> de <xsl:value-of select="@ruleset"/> en la línea <xsl:value-of select="@beginline"/>
 - Descripción: <xsl:value-of select="translate(., $newline, ' ')"/>
 - Encontrado en: package: `<xsl:value-of select="@package"/>`, clase: `<xsl:value-of select="@class"/>` método: `<xsl:value-of select="@method"/>` variable: `<xsl:value-of select="@variable"/>`
 [+Información](<xsl:value-of select="@externalInfoUrl"/>)
 
  </xsl:template>

  <!-- Error template -->
  <xsl:template match="pmd:error">
    <xsl:text>Error in file: </xsl:text><xsl:value-of select="@filename"/><xsl:text>&#10;</xsl:text>
    <xsl:text>  Message: </xsl:text><xsl:value-of select="@msg"/><xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <!-- Suppressed Violation template -->
  <xsl:template match="pmd:suppressedviolation">
    <xsl:text>Suppressed Violation in file: </xsl:text><xsl:value-of select="@filename"/><xsl:text>&#10;</xsl:text>
    <xsl:text>  Suppression Type: </xsl:text><xsl:value-of select="@suppressiontype"/><xsl:text>, Message: </xsl:text><xsl:value-of select="@msg"/><xsl:text>&#10;</xsl:text>
    <xsl:text>  User Message: </xsl:text><xsl:value-of select="@usermsg"/><xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <!-- Config Error template -->
  <xsl:template match="pmd:configerror">
    <xsl:text>Configuration Error - Rule: </xsl:text><xsl:value-of select="@rule"/><xsl:text>&#10;</xsl:text>
    <xsl:text>  Message: </xsl:text><xsl:value-of select="@msg"/><xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

</xsl:stylesheet>

