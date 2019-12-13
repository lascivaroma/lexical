<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output indent="yes"></xsl:output>
    
    <xsl:template match="@*">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="node()|comment()">
        <xsl:copy>
            <xsl:apply-templates select="./@*"/>
            <xsl:apply-templates  select="node()|comment()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:pc" />
    <xsl:template match="teiHeader">
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title>MANUEL DE SYNONYMIE LATINE</title>
                    <author>Louis Doederlein</author>
                    <editor xml:id="tclerice">Thibault Clérice</editor>
                </titleStmt>
                <publicationStmt>
                    <p>Edited using Grobid</p>
                </publicationStmt>
                <sourceDesc>
                    <p>Scan documents</p>
                </sourceDesc>
            </fileDesc>
            <encodingDesc>
                <appInfo>
                    <application version="0.5.6" ident="GROBID" when="2019-12-13">
                        <desc>
                            <ref target="https://github.com/MedKhem/grobid-dictionaries">GROBID_Dictionaries
                                - A machine learning software for structuring digitized dictionaries</ref>
                        </desc>
                    </application>
                </appInfo>
            </encodingDesc>
        </teiHeader>
    </xsl:template>
    <xsl:template match="TEI">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </TEI>
    </xsl:template>
</xsl:stylesheet>