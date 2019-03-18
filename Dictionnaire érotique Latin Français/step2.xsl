<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"></xsl:output>
    <xsl:template match="p[ancestor-or-self::body]">
        <entry>
            <xsl:analyze-string 
                select="normalize-space(string-join(./text(), ' '))" regex="^[A-Z ]+">
                <xsl:matching-substring>
                    <xsl:attribute name="xml:id" select="replace(lower-case(.), ' ', '_')" />
                </xsl:matching-substring>                                
            </xsl:analyze-string>
          <form>
              <xsl:analyze-string 
                  select="normalize-space(string-join(./text(), ' '))" regex="^[A-Z ]+">
                  <xsl:matching-substring><xsl:value-of select="."/></xsl:matching-substring>                                
              </xsl:analyze-string>
          </form>
          <gramGrp>
              <xsl:analyze-string 
                  select="normalize-space(string-join(./text(), ' '))" regex="^(?:[A-Z ]+ ?)\.?((, [a-z]+\.?)+)?">
                  <xsl:matching-substring><xsl:value-of select="regex-group(1)"/></xsl:matching-substring>                                
              </xsl:analyze-string>
          </gramGrp>
          <sense>
              <xsl:apply-templates />
          </sense>
        </entry>
    </xsl:template>
    <xsl:template match="p[ancestor-or-self::body]/text()">
        <xsl:analyze-string 
            select="normalize-space(.)" regex="^[A-Z ]{{3,}}\.? ?((, [a-z]+\.?)+)?">
            <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>