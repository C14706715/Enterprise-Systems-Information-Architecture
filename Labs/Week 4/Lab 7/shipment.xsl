<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
	<head>
		<title>Display Shipment</title>
	</head>
	<body style="width:500px;height:450px;border:1px solid #000;">
        <b>Shipment Number:</b> 
        <xsl:value-of select="shipment/@shipmentid"/>
        <table>
            <tr>
                <th>
                    <b>Consignor: </b> 
                </th>
                <th style="font-weight:normal" align="left">
                    <br/><br/><br/><br/>
                    <xsl:value-of select="shipment/consignor/name"/><br/>
                    <xsl:value-of select="shipment/consignor/address_line_1"/><br/>
                    <xsl:value-of select="shipment/consignor/address_line_2"/><br/>
                    <xsl:value-of select="shipment/consignor/address_line_3"/><br/>
                    <xsl:value-of select="shipment/consignor/address_line_4"/><br/>
                </th>
                <th>
                    <b>Consignee: </b> 
                </th>
                <th style="font-weight:normal" align="left">
                    <br/><br/><br/>
                    <xsl:value-of select="shipment/consignee/name"/><br/>
                    <xsl:value-of select="shipment/consignee/address_line_1"/><br/>
                    <xsl:value-of select="shipment/consignee/address_line_2"/><br/>
                    <xsl:value-of select="shipment/consignee/address_line_3"/><br/>
                </th>
            </tr>
        </table>
		
		
		<b>Summary: </b>
		<div>
			<xsl:variable name="numberOfItems" select="count(shipment/item)"/>
            
			Total number of items: 
            <xsl:value-of select="$numberOfItems"/>
            
            <br/>
            Total Weight: 
            <xsl:value-of select="shipment/details/total_weight"/>
            <xsl:value-of select="shipment/details/total_weight_uom"/>
            
            <xsl:variable name="avgWeight" select="format-number(shipment/details/total_weight div $numberOfItems,'###,###')"/>
                    
            <br/>
            Average Weight Per Item Line:
            <xsl:value-of select="$avgWeight"/>
            
            <xsl:variable name="totalQuantity" select="sum(shipment/items/item/quantity)"/>
            
            <br/>
            Total Quantity: 
            <xsl:value-of select="$totalQuantity"/>
            
        </div>
        <table>
            <tr>
                <th>
                    <b>     Sequence</b>
                </th>
                <th>
                    <b>     ID</b>
                </th>
                <th>
                    <b>     Title</b>
                </th>
                <th>
                    <b>     Note</b>
                </th>
                <th>
                    <b>     Quantity</b>
                </th>
                <th>
                   <b>     Price</b>
                </th>
                <th>
                    <b>     Line Total</b>
                </th>
            </tr>
            <xsl:for-each select="shipment/items/item">
                <tr>
                    <th style="font-weight:normal">
                        <xsl:value-of select="position()" />
                    </th>
                    <th style="font-weight:normal">
                        <xsl:value-of select="id"/>
                    </th>
                    <th style="font-weight:normal">
                        <xsl:value-of select="title"/>
                    </th>
                    <th style="font-weight:normal">
                        <xsl:value-of select="note"/>
                    </th>
                    <th style="font-weight:normal">
                        <xsl:value-of select="quantity"/>
                    </th>
                    <th style="font-weight:normal">
                        <xsl:value-of select="price"/>
                    </th>
                    <th style="font-weight:normal">
                        <xsl:value-of select="quantity * price" />
                    </th>
                </tr>
            </xsl:for-each>
        </table>    
            
            
            
            
            
            
            
	</body>
</html>
</xsl:template>

<xsl:template match="/shipment/item">

</xsl:template>	

<xsl:template name="write_total_weight">
	<xsl:param name="total_weight" />
	<xsl:param name="total_weight_uom" />
	
</xsl:template>
	
</xsl:stylesheet>	