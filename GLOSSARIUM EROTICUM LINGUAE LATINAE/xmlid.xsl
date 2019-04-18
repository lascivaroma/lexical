<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="*:entry">
        <xsl:copy>
            <xsl:attribute name="xml:id" 
                select="replace(
                tokenize(.//*:form/text()[1], ',')[1]
                , '\W+', '_')"/>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    <xsl:template match="node()|comment()|@*">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>