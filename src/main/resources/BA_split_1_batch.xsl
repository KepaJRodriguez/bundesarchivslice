<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="urn:isbn:1-931666-22-9"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/">
        <xsl:for-each select="ead/archdesc/dsc/c01/c02">
            <xsl:variable name="c02group" select="did/unittitle"/>
            <xsl:if test="$c02group = 'Norddeutscher Bund und Deutsches Reich (1867/1871-1945)'">
                <xsl:for-each select="c03[@otherlevel='plan_of_record_groups']">
                    <xsl:variable name="c03group" select="did/unittitle"/>
                    <xsl:if
                        test="$c03group = ('Andere politische Parteien und Gruppierungen' , 'Arbeit, Soziales' , 'Auswärtiges, Kolonial- und Besatzungsverwaltung' ,
                        ' Bilder, Plakate, Karten, Pläne, Töne' ,  'Finanzen, Bau' , 'Inneres, Polizei und SS, Volkstum' , ' Justiz' , 'Kultus, Wissenschaft, Propaganda' ,
                        'Oberste Organe' , 'Wirtschaft, Rüstung, Landwirtschaft, Post, Verkehr', 'Organisationen und Verbände')">
                        <xsl:for-each select="c04[@level='fonds']/.">
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
                                            <p>this fonds was selected by EHRI from their holding
                                                guide, based on date range and subject</p>
                                        </processinfo>
                                    </archdesc>
                                </ead>
                            </xsl:result-document>
                        </xsl:for-each>
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
                                            <p>this fonds was selected by EHRI from their holding
                                                guide, based on date range and subject</p>
                                        </processinfo>
                                    </archdesc>
                                </ead>
                            </xsl:result-document>
                        </xsl:for-each>
                        <xsl:for-each select="c04/c05/c06[@level='fonds']/.">
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
                                            <p>this fonds was selected by EHRI from their holding
                                                guide, based on date range and subject</p>
                                        </processinfo>
                                    </archdesc>
                                </ead>
                            </xsl:result-document>
                        </xsl:for-each>
                        <xsl:for-each select="c04/c05/c06/c07[@level='fonds']/.">
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
                                            <p>this fonds was selected by EHRI from their holding
                                                guide, based on date range and subject</p>
                                        </processinfo>
                                    </archdesc>
                                </ead>
                            </xsl:result-document>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="$c03group = 'Militär'">
                        <xsl:for-each select="c04[@otherlevel='plan_of_record_groups']">
                            <xsl:variable name="c04group" select="did/unittitle"/>
                            <xsl:if
                                test="$c04group = ('Reichswehr und Wehrmacht 1919 bis 1945', 'Waffen-SS 1939 bis 1945')">
                                <xsl:for-each select="c05[@level='fonds']/.">
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
                                                    <p>this fonds was selected by EHRI from their holding
                                                        guide, based on date range and subject</p>
                                                </processinfo>
                                            </archdesc>
                                        </ead>
                                    </xsl:result-document>
                                </xsl:for-each>
                                <xsl:for-each select="c05/c06[@level='fonds']/.">
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
                                                    <p>this fonds was selected by EHRI from their holding
                                                        guide, based on date range and subject</p>
                                                </processinfo>
                                            </archdesc>
                                        </ead>
                                    </xsl:result-document>
                                </xsl:for-each>
                                <xsl:for-each select="c05/c06/c07[@level='fonds']/.">
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
                                                    <p>this fonds was selected by EHRI from their holding
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
                <creation>
                    Bundesarchiv from Basys2
                    <date>17.06.2013 13:06</date>
                </creation>
                <langusage>
                    <language langcode="ger" scriptcode="Latn">German</language>
                </langusage>
            </profiledesc>
            <revisiondesc>
                <change>
                    <date calendar="gregorian" era="ce">
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