<?xml version ="1.0"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
    <xsl:output method="html"/>
        <xsl:template match="/">
            <xsl:for-each select="notes/note">
                <b>To: </b> <xsl:value-of select="to"/> <br/>
                <b>From: </b><xsl:value-of select="from"/> <br/>
                <b>Heading: </b><xsl:value-of select="heading"/> <br/>
                <b>Body: </b><xsl:value-of select="body"/> <br/>
                <br/>
            </xsl:for-each>
    </xsl:template> 
</xsl:stylesheet>
