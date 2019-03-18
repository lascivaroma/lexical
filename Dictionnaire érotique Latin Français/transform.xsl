<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0"
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
                <body>
                    <xsl:apply-templates select=".//div[starts-with(@class, 'item')]"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="div[starts-with(@class, 'item')]">
        <!-- Dictionary Entry
            - Maximum 1 <p>
        -->
        <div type="entry">
            <p><xsl:apply-templates /></p>
        </div>
    </xsl:template>
    
    <xsl:template match="p">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="a[@href and not(starts-with(@href, '#Footnote')) and not(starts-with(@href, '#FNanchor'))]">
        <ref>
            <xsl:attribute name="target" select="@href"/>
            <xsl:apply-templates />
        </ref>
    </xsl:template>
    
    <xsl:template match="a[starts-with(@href, '#Footnote')]">
        <xsl:variable name="target" select="replace(./@href, '#', '')"/>
        <xsl:call-template name="note">
            <xsl:with-param name="node" select="//p[./a[@name=$target]]" />
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="i[@xml:lang='la']">
        <!-- Noter cas spécifique pour plus tard : `omn. gen.` --> 
        <xsl:analyze-string select=" normalize-space(./text())" regex="^(Pomp. Ict.|Jul. Cap.|Quintil.|Cicero.|Lamprid.|Catull.|Subaud.|Tibull.|Plaut.|Priap.|Juven.|Auson.|Solin.|Laber.|Colum.|Lucil.|Lampr.|Cels.|Apul.|Petr.|Fest.|Ovid.|Mart.|Virg.|Lucr.|Plin.|Suet.|Varr.|Pers.|Prud.|Juv.|Col.|Cic.|Hor.|Ter.|Sen.|Ulp.|Tac.)$">
            <xsl:matching-substring>
                <persName type="author"><xsl:value-of select="."/></persName>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:analyze-string select="." regex="^(is, ivi, itum, ire|is, ire|as, are|is, ere|a, um|a, um|icis|onis|arum|oris|idis|orum|adis|inis|atis|eris|are|ium|ari|tis|ere|ire|ae|ii|us|is|es|le|um|te|i)$">
                    <xsl:matching-substring><xsl:value-of select="."/></xsl:matching-substring>
                    <xsl:non-matching-substring><foreign xml:lang="lat"><xsl:value-of select="."/></foreign></xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
        
    </xsl:template>
    
    <xsl:template name="note">
        <xsl:param name="node" />
        <note>
            <xsl:attribute name="xml:id" select="$node/a/@id"/>
            <xsl:apply-templates select="$node" />
        </note>
    </xsl:template>
    <xsl:template match="span[@class='label']" />
</xsl:stylesheet>