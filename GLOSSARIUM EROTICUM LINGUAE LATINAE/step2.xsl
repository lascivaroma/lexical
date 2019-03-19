<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"></xsl:output>
    <xsl:template match="sense">
        <xsl:for-each-group group-ending-with="bibl" select="l|bibl">
            <lg>
               <xsl:for-each select="current-group()">
                   <xsl:apply-templates />
               </xsl:for-each>
            </lg>
        </xsl:for-each-group>
    </xsl:template>
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>