<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"  xmlns="urn:isbn:1-931666-22-9" exclude-result-prefixes="xs" version="2.0">

    
    <xsl:template match="/">
        <xsl:for-each select="ead/archdesc/dsc/c01/c02">
            <xsl:variable name="c02group" select="did/unittitle"/>
            <xsl:if test="$c02group = 'Norddeutscher Bund und Deutsches Reich (1867/1871-1945)'">
                <xsl:for-each select="c03[@otherlevel='plan_of_record_groups']">
                    <xsl:variable name="c03group" select="did/unittitle"/>
                    <xsl:if test="$c03group = 'Einrichtungen der NSDAP'">
                        <xsl:for-each select="c04/c05[@level='fonds']/.">
                            <xsl:variable name="filename_id"
                                select="did/unitid[@encodinganalog='Bestandssignatur']"/>
                            <xsl:result-document href="BA_split_{$filename_id}.xml">
                                <ead>
                                    <xsl:call-template name="header"/>
                                    <xsl:call-template name="frontmatter"/>
                                    <archdesc level="fonds">
                                        <xsl:apply-templates/>
                                        <controlaccess>
                                            <xsl:for-each
                                                select="ancestor::*[@otherlevel='plan_of_record_groups']">
                                                <subject>
                                                    <xsl:copy-of select="did/unittitle/text()"/>
                                                </subject>
                                            </xsl:for-each>
                                        </controlaccess>
                                    </archdesc>
                                </ead>
                            </xsl:result-document>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>               
            </xsl:if>           
        </xsl:for-each>
        
    </xsl:template>
    
    
    
    
    <xsl:template name="header">
        <eadheader>
            <eadid countrycode="DE">
                <xsl:for-each select="unitid[@encodinganalog='Bestandssignatur']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </eadid>
            <filedesc>
                <titlestmt>
                    <titleproper>
                        <xsl:for-each select="unittitle[@encodinganalog='Bestandsbezeichnung']">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </titleproper>
                    <author>Bundesarchiv / Basys2</author>
                </titlestmt>
            </filedesc>
            <profiledesc>
                <creation>
                    <date>17.06.2013 13:06</date>
                </creation>
                <langusage>
                    <language langcode="ger" scriptcode="Latn">German</language>
                </langusage>
            </profiledesc>         
        </eadheader>
    </xsl:template>
    
    <xsl:template name="frontmatter">
        <frontmatter>
        </frontmatter>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:element name="{name()}" namespace="urn:isbn:1-931666-22-9">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    
    
    
</xsl:stylesheet>