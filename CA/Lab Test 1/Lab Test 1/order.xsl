<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
	<xsl:template match="/">
		<h2>Order Date: </h2><xsl:value-of select="order/date"/>
		<h2>Order Currency: </h2><xsl:value-of select="order/currency"/>
		<h2>Order Payment Information: </h2><xsl:value-of select="order/payment_information"/>
		
		<h3>Ship To:</h3>
		<b>Name: </b><xsl:value-of select="order/shipto/name"/><br/>
		<b>Address: </b><xsl:value-of select="order/shipto/address"/><br/>
		<b>City: </b><xsl:value-of select="order/shipto/city"/><br/>
		<b>Country: </b><xsl:value-of select="order/shipto/country"/><br/>
		
		<h3>Bill To:</h3>
		<b>Name: </b><xsl:value-of select="order/billto/name"/><br/>
		<b>Address: </b><xsl:value-of select="order/billto/address"/><br/>
		<b>City: </b><xsl:value-of select="order/billto/city"/><br/>
		<b>Country: </b><xsl:value-of select="order/billto/country"/><br/>
		
		<h3>Items:</h3>
		<xsl:for-each select="order/item">
			<b>Item Name: </b><xsl:value-of select="name"/><br/>
			<b>Product ID: </b><xsl:value-of select="product_id"/><br/>
			<b>Note: </b><xsl:value-of select="note"/><br/>
			<b>Quantity: </b><xsl:value-of select="quantity"/><br/>
			<b>Product Price: </b><xsl:value-of select="price"/><br/><br/><br/>
		</xsl:for-each>
		
		<h2>Order ID: 889923</h2><xsl:value-of select="orderid"/><br/>
	</xsl:template>
</xsl:stylesheet>