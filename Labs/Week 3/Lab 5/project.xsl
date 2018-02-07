<?xml version ="1.0"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
    <xsl:output method="html"/>
        <xsl:template match="/">
            <h1><xsl:value-of select="project/student"/></h1>
            <h1><xsl:value-of select="project/date"/></h1>
            <xsl:for-each select="project/objective">
                <h4>Name: <xsl:value-of select="name"/></h4>
                <div>Description: <xsl:value-of select="description"/></div><br/>
            </xsl:for-each>
    </xsl:template> 
</xsl:stylesheet>
