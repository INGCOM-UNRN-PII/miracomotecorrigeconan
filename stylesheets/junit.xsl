<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <!-- Match the root element -->
    <xsl:template match="/">
        <!-- Call the template to process each testsuite -->
        <xsl:apply-templates select="//testsuite"/>
    </xsl:template>

    <!-- Template to process each testsuite -->
    <xsl:template match="testsuite">
        <!-- Print the testsuite name -->
        <xsl:value-of select="@name"/>
        <xsl:text>&#10;</xsl:text>
        
        <!-- Print the total number of tests, failures, and errors -->
        <xsl:text>Total tests: </xsl:text>
        <xsl:value-of select="@tests"/>
        <xsl:text>, Failures: </xsl:text>
        <xsl:value-of select="@failures"/>
        <xsl:text>, Errors: </xsl:text>
        <xsl:value-of select="@errors"/>
        <xsl:text>&#10;</xsl:text>
        
        <!-- Print the test cases -->
        <xsl:apply-templates select="testcase"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Template to process each testcase -->
    <xsl:template match="testcase">
        <!-- Print the testcase name and status -->
        <xsl:text>- </xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>: </xsl:text>
        <xsl:choose>
            <xsl:when test="failure">
                <xsl:text>Failed</xsl:text>
            </xsl:when>
            <xsl:when test="error">
                <xsl:text>Error</xsl:text>
            </xsl:when>
            <xsl:when test="skipped">
                <xsl:text>Skipped</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Passed</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>

