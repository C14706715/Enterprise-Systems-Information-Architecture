<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
	<xsl:template match="/">
		<h1>Invoice Number: <xsl:value-of select="invoice/invoice_number"/></h1>
		<h2>Invoice Date: <xsl:value-of select="invoice/invoice_date"/></h2>
		<xsl:for-each select="invoice/item">
			<h4>Item: <xsl:value-of select="item_name"/></h4>
			<div>
				Price: <xsl:value-of select="price"/><br/>
				Quantity: <xsl:value-of select="quantity"/><br/>
			</div>
			<br/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>