<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs tei"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xsl:template match="tei:cit[ancestor::tei:form]">
       <xsl:for-each select="tokenize(string-join(.//text()), ', ')">
           <m type="suffix"><xsl:value-of select="replace(., '\W+', '')"/></m>
       </xsl:for-each>
    </xsl:template>
    <xsl:template match="node()|comment()|@*">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>