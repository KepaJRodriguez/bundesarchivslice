<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="urn:isbn:1-931666-22-9"
    version="2.0">


    <xsl:variable name="datachangeprovenance_date" select="ead/eadheader/filedesc/revisiondesc/change/date"/>
    <xsl:variable name="datachangeprovenance_item" select="ead/eadheader/filedesc/revisiondesc/change/item"/>
    
    
    <xsl:template match="/">
        <xsl:variable name="actualdate" select="current-dateTime()"/>
        <xsl:for-each select="ead/archdesc/dsc/c01/c02">
            <xsl:variable name="c02group" select="did/unittitle"/>
            <xsl:if test="$c02group = 'Norddeutscher Bund und Deutsches Reich (1867/1871-1945)'">
                <xsl:for-each select="c03[@otherlevel='plan_of_record_groups']">
                    <xsl:variable name="c03group" select="did/unittitle"/>
                    <xsl:if test="$c03group = 'Einrichtungen der NSDAP'">
                        <xsl:for-each select="c04/c05[@level='fonds']/.">
                            <xsl:variable name="filename_id"
                                select="replace(did/unitid[@encodinganalog='Bestandssignatur'], ' ', '_')"/>
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
                                        <processinfo>
                                            <p>This fonds was selected by EHRI from their holding
                                                guide, based on date range and subject</p>
                                        </processinfo>
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
        <xsl:variable name="actualdate" select="current-dateTime()"/>
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
                    <author>Bundesarchiv</author>
                </titlestmt>
            </filedesc>
            <profiledesc>
                <creation> Bundesarchiv from Basys2 <date>17.06.2013 13:06</date>
                </creation>
                <langusage>
                    <language langcode="ger" scriptcode="Latn">German</language>
                </langusage>
            </profiledesc>
            <revisiondesc>
                <change>
                    <date><xsl:value-of select="$datachangeprovenance_date" /></date>                   
                    <item><xsl:value-of select="$datachangeprovenance_item" /></item>
                </change>
                <change>
                    <date>
                        <xsl:value-of select="$actualdate"/>
                    </date>
                    <item>preprocessing transformation</item>
                </change>
            </revisiondesc>
        </eadheader>
    </xsl:template>

    <xsl:template name="frontmatter">
        <frontmatter> </frontmatter>
    </xsl:template>

    <xsl:template match="*">
        <xsl:element name="{name()}" namespace="urn:isbn:1-931666-22-9">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>



</xsl:stylesheet>