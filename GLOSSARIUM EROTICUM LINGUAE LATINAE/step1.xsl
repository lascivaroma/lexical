<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="2.0">
    <xsl:output method="xml" indent="yes"></xsl:output>
    <xsl:template match="root()">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Title</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body xml:lang="lat">
                    <xsl:apply-templates select="//body"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:for-each-group group-starting-with="p[./span[@class='lemma']]" select="p|blockquote">
            <entry>
                <form><xsl:value-of select="./current-group()//span[@class='lemma']"/></form>
                <sense>
                    <xsl:for-each select="current-group()">
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </sense>
            </entry>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template match="p[@class='pline']">
        <l><xsl:apply-templates/></l>
    </xsl:template>
    
    <xsl:template match="p[@class='pref']">
        <bibl><xsl:apply-templates/></bibl>
    </xsl:template>
    
    <xsl:template match="span[@class='lemma']" />
    
    <xsl:template match="blockquote">
        <cit>
            <quote><xsl:apply-templates select=".//br/preceding-sibling::text()|.//br/preceding-sibling::i"/></quote>
            <bibl>
                <xsl:apply-templates mode="bibl" select=".//br/following-sibling::text()|.//br/following-sibling::i"/>
            </bibl>
        </cit>
    </xsl:template>
    
    <xsl:template match="i">
        <xsl:text> </xsl:text><emph><xsl:apply-templates /></emph><xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="i[ancestor::blockquote]" mode="bibl">
        <title><xsl:apply-templates /></title>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select=" normalize-space(.)" />
    </xsl:template>
</xsl:stylesheet>