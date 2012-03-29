<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    
    <!-- This is the root level template -->
    <xsl:template match="/">
        <ftk_report>
            <xsl:apply-templates/>
        </ftk_report>
    </xsl:template>
    
    <xsl:template
        match="//fo:page-sequence[2][fo:flow/fo:block[text()='Case Information']]/fo:flow/fo:table[1]/fo:table-body/fo:table-row[3]/fo:table-cell[2]/fo:block">
        <collection_title>
            <xsl:value-of select="substring-after(.,' ')"/>
        </collection_title>
        <callnumber>
            <xsl:value-of select="substring-before(.,' ')"/>
        </callnumber>
    </xsl:template>
    
      <!-- This template matches any fo:page-sequence that contains "Case Information" The following fo:block[7] contains the "Series Information".-->
     <xsl:template
        match="//fo:page-sequence[1][fo:flow/fo:block[text()='Case Information']]/fo:flow/fo:block[7]">
        <series>
            <xsl:value-of select="."/>
        </series>
    </xsl:template>

    <!-- This template matches any fo:table-body that contains "File Comments" This indicates the beginning of a new file description. -->
    <xsl:template
        match="//fo:table-body[fo:table-row/fo:table-cell/fo:block[text()='File Comments']]">
        <file>
            <xsl:apply-templates/>
        </file>
    </xsl:template>


<!-- This template matches fo:table-row that contains "Name". The following fo:table-cell[2] contains the value of the "Name" field. -->
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Name']]/fo:table-cell[2]/fo:block">
        <filename>
            <xsl:value-of select="."/>
        </filename>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Item Number']]/fo:table-cell[2]/fo:block">
        <item_number>
            <xsl:value-of select="."/>
        </item_number>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Logical Size']]/fo:table-cell[2]/fo:block">
        
        <filesize>
            <xsl:value-of select="translate(.,' B','')"/>
        </filesize>
        <filesize_unit>
            <xsl:value-of select="substring-after(.,' ')"/>
        </filesize_unit>
               
    </xsl:template>
    
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='File Type']]/fo:table-cell[2]/fo:block">
        <filetype>
            <xsl:value-of select="."/>
        </filetype>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Path']]/fo:table-cell[2]/fo:block">
        <filepath>
            <xsl:value-of select="."/>
        </filepath>
        <disk_image_no>
            <xsl:value-of select="substring(.,7,5)"/>
        </disk_image_no>
    </xsl:template>
    
     
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Created Date']]/fo:table-cell[2]/fo:block">
        <file_creation_date>
            <xsl:value-of select="."/>
        </file_creation_date>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Accessed Date']]/fo:table-cell[2]/fo:block">
        <file_accessed_date>
            <xsl:value-of select="."/>
        </file_accessed_date>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Modified Date']]/fo:table-cell[2]/fo:block">
        <file_modified_date>
            <xsl:value-of select="."/>
        </file_modified_date>
    </xsl:template>
    <!-- 
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Label']]/fo:table-cell[2]/fo:block">
        
   
            <xsl:for-each select="tokenize(.,',')">
           <xsl:variable name="tag-1" select="substring-before(.,']')" ></xsl:variable>
                <xsl:variable name="tag-2" select="substring-after($tag-1,'[')"></xsl:variable>
                
               <xsl:element name="{$tag-2}">
                   <xsl:value-of select="substring-after(.,']')"></xsl:value-of>
               </xsl:element>
                             
            </xsl:for-each> 
        
  


    </xsl:template>
    -->
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='MD5 Hash']]/fo:table-cell[2]/fo:block">
        <md5_hash>
            <xsl:value-of select="."/>
        </md5_hash>
    </xsl:template>
    
     <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='SHA1 Hash']]/fo:table-cell[2]/fo:block">
        <sha1_hash>
            <xsl:value-of select="."/>
        </sha1_hash>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Exported as']]/fo:table-cell[2]/fo:block">
        <export_path>
            <xsl:value-of select="."/>
        </export_path>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Flagged Privileged']]/fo:table-cell[2]/fo:block">
        <restricted>
            <xsl:value-of select="."/>
        </restricted>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Duplicate File']]/fo:table-cell[2]/fo:block">
        <duplicate_file>
            <xsl:value-of select="."/>
        </duplicate_file>
    </xsl:template>
    
    
    
    
    <xsl:template match="@*|node()">

        <xsl:apply-templates select="@*|node()"/>

    </xsl:template>

</xsl:stylesheet>
