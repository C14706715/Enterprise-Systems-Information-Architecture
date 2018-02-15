<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="print_grade">
        <xsl:param name="target_grade"/>
        <xsl:param name="list"/>
        <xsl:variable name="numberOfStudents" select="count($list/student)"/>
        <xsl:variable name="numberOfGradeStudents" select="count($list/student[grade=$target_grade])"/>
        <h1><xsl:value-of select="$target_grade"/></h1>
        <div>Number of students receiving grade: <xsl:value-of select="$numberOfGradeStudents"/></div>
        <div>Percentage of students receiving grade: <xsl:value-of select="$numberOfGradeStudents div $numberOfStudents * 100"/></div>
    </xsl:template>
    <xsl:template match="/">
        <html>
            <head><title>Grade Report</title></head>
            <body>
                <xsl:call-template name="print_grade">
                    <xsl:with-param name="target_grade" select="'A'"/> 
                    <xsl:with-param name="list" select="class"/>
                </xsl:call-template>
                <p/>
                <xsl:call-template name="print_grade">
                    <xsl:with-param name="target_grade" select="'B'"/>
                    <xsl:with-param name="list" select="class"/> 
                </xsl:call-template>
                <p/>
                <xsl:call-template name="print_grade">
                    <xsl:with-param name="target_grade" select="'C'"/>
                    <xsl:with-param name="list" select="class"/> 
                </xsl:call-template>
                <p/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>