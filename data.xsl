<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/socialSite">
        <html>
            <head>
                <link rel="stylesheet" href="style.css" />
            </head>
            <body>
                <Article>
                    <h2>Osoby na sociální síti</h2>
                    <table class="personTable">
                        <tr>
                            <th>ID</th>
                            <th>Jméno</th>
                            <th>Příjmení</th>
                            <th>Věk</th>
                            <th>Datum narození</th>
                            <th>Pohlaví</th>
                        </tr>
                        <xsl:for-each select="person">
                            <tr>
                                <td>
                                    <xsl:value-of select="@id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="personalInformation/surname" />
                                </td>
                                <td>
                                    <xsl:value-of select="personalInformation/lastName" />
                                </td>
                                <td>
                                    <xsl:value-of select="personalInformation/age" />
                                </td>
                                <td>
                                    <xsl:value-of select="personalInformation/birthDay" />
                                </td>

                                <xsl:variable name="sex" select="personalInformation/sex"/>
                                <xsl:choose>
                                    <xsl:when test = "$sex='Male'">
                                        <td>
                                            <xsl:text>Muž</xsl:text>
                                        </td>
                                    </xsl:when>
                                    <xsl:when test = "$sex='Female'">
                                        <td>
                                            <xsl:text>Žena</xsl:text>
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td>
                                            <xsl:text>Neznámé</xsl:text>
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </tr>
                        </xsl:for-each>
                    </table>
                </Article>

                <Article>
                    <h2>Osoby starší 18 let</h2>
                    <table class="personTable">
                        <tr>
                            <th>ID</th>
                            <th>Jméno</th>
                            <th>Příjmení</th>
                            <th>Věk</th>
                        </tr>
                        <xsl:for-each select="person">
                            <xsl:sort select="personalInformation/age"/>
                            <xsl:variable name="age" select="personalInformation/age"/>
                            <xsl:if test="$age &gt; 18">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@id"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="personalInformation/surname" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="personalInformation/lastName" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="personalInformation/age" />
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </table>
                </Article>

                <a href="/main.html">← Zpět</a>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>