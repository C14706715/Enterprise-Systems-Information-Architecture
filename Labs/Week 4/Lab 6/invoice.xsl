<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <b>Invoice Number: <xsl:value-of select="invoice/invoice_number"/></b><br/><br/>
        <b>Invoice Date: <xsl:value-of select="invoice/invoice_date"/></b><br/><br/>
    
        <xsl:apply-templates select="invoice/items/item">
         <xsl:sort select="quantity"/>
            <b>Item Name: <xsl:value-of select="item_name"/></b><br/><br/>
            Price: <xsl:value-of select="price"/><br/>
            <xsl:if quantity="$quantity &gt; 1">
            Quantity: <xsl:value-of select="quantity"/><br/><br/>
                </xsl:if>
        </xsl:apply-templates>

        <b>Payment Information: <xsl:value-of select="invoice/payment_information"/></b><br/>
        
        <b>http://www.dit.ie/</b>
    </xsl:template>
</xsl:stylesheet>

