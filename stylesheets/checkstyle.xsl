<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xsl:variable name="apos">'</xsl:variable>
  <xsl:output method="text"/>

  <xsl:template match="/checkstyle">
## Checkstyle Report - Dredd
**Version checkstyle:** <xsl:value-of select="@version"/>
### Archivos procesados
    <xsl:apply-templates select="file"/>
  </xsl:template>
  <xsl:template match="file">
#### Archivo: <xsl:value-of select="@name"/>
    <xsl:if test="error">
| tipo | mensaje | línea |
|:----:|:-------:|-------|
<xsl:for-each select="error">|<xsl:value-of select="@severity"/>|<xsl:value-of select="translate(@message, $apos, '&#96;')"/>|<xsl:value-of select="@line"/>|
</xsl:for-each>
    </xsl:if>
    <xsl:if test="not(error)">
##### Archivo OK.
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
