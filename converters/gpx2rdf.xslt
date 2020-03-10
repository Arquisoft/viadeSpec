<?xml version="1.0" standalone="yes" ?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#">
  <!ENTITY ex "http://example.org/">
]>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gpxml="http://www.topografix.com/GPX/1/1"
  xmlns:gpx="https://www.w3.org/ns/pim/gpx#"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:xsd="&xsd;"
  xmlns:ex="&ex;"
  >

<xsl:template match="gpxml:gpx">
 <rdf:RDF>
  <rdf:Description rdf:about="&ex;myRoute">
   <xsl:apply-templates select="@creator" />
   <xsl:apply-templates select="@version" />
   <xsl:apply-templates select="gpxml:metadata" />
   <xsl:apply-templates select="gpxml:trk" />
   <xsl:apply-templates select="gpxml:wpt" />
   <xsl:apply-templates select="gpxml:rte" />
  </rdf:Description>
 </rdf:RDF>
</xsl:template>

<xsl:template match="@creator">
 <gpx:creator><xsl:value-of select="."/></gpx:creator>
</xsl:template>

<xsl:template match="@version">
 <gpx:version><xsl:value-of select="."/></gpx:version>
</xsl:template>


<xsl:template match="gpxml:metadata">
 <gpx:metadata rdf:parseType="Resource">
   <xsl:apply-templates select="gpxml:link" />
   <xsl:apply-templates select="gpxml:time" />
 </gpx:metadata>
</xsl:template>

<xsl:template match="gpxml:link">
 <gpx:link rdf:parseType="Resource">
    <gpx:href rdf:datatype="&xsd;anyURI"><xsl:value-of select="@href" /></gpx:href>
    <xsl:apply-templates select="gpxml:text" />
    <xsl:apply-templates select="gpxml:type" />
 </gpx:link>
</xsl:template>

<xsl:template match="gpxml:text">
 <gpx:text><xsl:value-of select="." /></gpx:text>
</xsl:template>

<xsl:template match="gpxml:type">
 <gpx:type><xsl:value-of select="." /></gpx:type>
</xsl:template>

<xsl:template match="gpxml:time">
 <gpx:time rdf:datatype="&xsd;dateTime"><xsl:value-of select="."/></gpx:time>
</xsl:template>


<xsl:template match="gpxml:wpt">
 <gpx:wpt rdf:parseType="Resource">
  <gpx:lat rdf:datatype="&xsd;decimal"><xsl:value-of select="@lat"/></gpx:lat>
  <gpx:lon rdf:datatype="&xsd;decimal"><xsl:value-of select="@lon"/></gpx:lon>
  <xsl:apply-templates select="gpxml:ele" />
  <xsl:apply-templates select="gpxml:time" />
  <xsl:apply-templates select="gpxml:magvar" />
  <xsl:apply-templates select="gpxml:geoidheight" />
  
  <xsl:apply-templates select="gpxml:name" />
  <xsl:apply-templates select="gpxml:cmt" />   
  <xsl:apply-templates select="gpxml:desc" />   
  <xsl:apply-templates select="gpxml:src" />   
  <xsl:apply-templates select="gpxml:link" />   
  <xsl:apply-templates select="gpxml:number" />   
  <xsl:apply-templates select="gpxml:type" />   
  <xsl:apply-templates select="gpxml:type" />
  <xsl:apply-templates select="gpxml:fix" />
  <xsl:apply-templates select="gpxml:sat" />
  <xsl:apply-templates select="gpxml:hdop" />
  <xsl:apply-templates select="gpxml:vdop" />
  <xsl:apply-templates select="gpxml:pdop" />
  <xsl:apply-templates select="gpxml:ageofdgpsdata" />
  <xsl:apply-templates select="gpxml:dgpsid" />
  <xsl:apply-templates select="gpxml:extensions" />
 </gpx:wpt>
</xsl:template>

<xsl:template match="gpxml:rte">
 <gpx:rte rdf:parseType="Resource">
 <xsl:apply-templates select="gpxml:name" />
 <xsl:apply-templates select="gpxml:cmt" />   
 <xsl:apply-templates select="gpxml:desc" />   
 <xsl:apply-templates select="gpxml:src" />   
 <xsl:apply-templates select="gpxml:link" />   
 <xsl:apply-templates select="gpxml:number" />   
 <xsl:apply-templates select="gpxml:type" />   
 <xsl:apply-templates select="gpxml:extensions" />   
 <xsl:apply-templates select="gpxml:rtept" />   
 </gpx:rte>
</xsl:template>

<xsl:template match="gpxml:rtept">
 <gpx:rtept><xsl:apply-templates select="." /></gpx:rtept>
</xsl:template>

<xsl:template match="gpxml:trk">
 <gpx:trk rdf:parseType="Resource">
 <xsl:apply-templates select="gpxml:name" />
 <xsl:apply-templates select="gpxml:cmt" />   
 <xsl:apply-templates select="gpxml:desc" />   
 <xsl:apply-templates select="gpxml:src" />   
 <xsl:apply-templates select="gpxml:link" />   
 <xsl:apply-templates select="gpxml:number" />   
 <xsl:apply-templates select="gpxml:type" />   
 <xsl:apply-templates select="gpxml:extensions" />   
 <xsl:apply-templates select="gpxml:trkseg" />   
 </gpx:trk>
</xsl:template>

<xsl:template match="gpxml:name">
 <gpx:name><xsl:value-of select="."/></gpx:name>
</xsl:template>

<xsl:template match="gpxml:cmt">
 <gpx:cmt><xsl:value-of select="."/></gpx:cmt>
</xsl:template>

<xsl:template match="gpxml:desc">
 <gpx:desc><xsl:value-of select="."/></gpx:desc>
</xsl:template>

<xsl:template match="gpxml:src">
 <gpx:src><xsl:value-of select="."/></gpx:src>
</xsl:template>

<xsl:template match="gpxml:number">
 <gpx:number rdf:datatype="&xsd;integer"><xsl:value-of select="."/></gpx:number>
</xsl:template>

<xsl:template match="gpxml:type">
 <gpx:type><xsl:value-of select="."/></gpx:type>
</xsl:template>

<xsl:template match="gpxml:ele">
 <gpx:ele rdf:datatype="&xsd;decimal"><xsl:value-of select="."/></gpx:ele>
</xsl:template>

<xsl:template match="gpxml:magvar">
 <gpx:magvar rdf:datatype="&xsd;decimal"><xsl:value-of select="."/></gpx:magvar>
</xsl:template>

<xsl:template match="gpxml:geoidheight">
 <gpx:geoidheight rdf:datatype="&xsd;decimal"><xsl:value-of select="."/></gpx:geoidheight>
</xsl:template>

<xsl:template match="gpxml:sym">
 <gpx:sym><xsl:value-of select="."/></gpx:sym>
</xsl:template>

<xsl:template match="gpxml:fix">
 <gpx:fix><xsl:value-of select="."/></gpx:fix>
</xsl:template>

<xsl:template match="gpxml:sat">
 <gpx:sat rdf:datatype="&xsd;nonNegativeInteger"><xsl:value-of select="."/></gpx:sat>
</xsl:template>

<xsl:template match="gpxml:hdop">
 <gpx:hdop rdf:datatype="&xsd;decimal"><xsl:value-of select="."/></gpx:hdop>
</xsl:template>

<xsl:template match="gpxml:vdop">
 <gpx:vdop rdf:datatype="&xsd;decimal"><xsl:value-of select="."/></gpx:vdop>
</xsl:template>

<xsl:template match="gpxml:pdop">
 <gpx:pdop rdf:datatype="&xsd;decimal"><xsl:value-of select="."/></gpx:pdop>
</xsl:template>

<xsl:template match="gpxml:ageofdgpsdata">
 <gpx:ageofdgpsdata rdf:datatype="&xsd;decimal"><xsl:value-of select="."/></gpx:ageofdgpsdata>
</xsl:template>

<xsl:template match="gpxml:dgpsStationType">
 <gpx:dgpsStationType rdf:datatype="&xsd;integer"><xsl:value-of select="."/></gpx:dgpsStationType>
</xsl:template>

<xsl:template match="gpxml:extensions">
 <!-- Extensions are ignored by now -->
</xsl:template>

<xsl:template match="gpxml:trkseg">
 <gpx:trkseg rdf:parseType="Resource">
   <gpx:trkpts rdf:parseType="Collection">
     <xsl:apply-templates select="gpxml:trkpt"/>
   </gpx:trkpts>
   <xsl:apply-templates select="gpxml:extensions" />
 </gpx:trkseg>
</xsl:template>

<xsl:template match="gpxml:trkpt">
 <rdf:Description>
  <gpx:trkpt rdf:parseType="Resource">
   <gpx:lat rdf:datatype="&xsd;decimal"><xsl:value-of select="@lat"/></gpx:lat>
   <gpx:lon rdf:datatype="&xsd;decimal"><xsl:value-of select="@lon"/></gpx:lon>
   <xsl:apply-templates select="gpxml:ele" />
   <xsl:apply-templates select="gpxml:time" />
   <xsl:apply-templates select="gpxml:magvar" />
   <xsl:apply-templates select="gpxml:geoidheight" />
   <xsl:apply-templates select="gpxml:name" />
   <xsl:apply-templates select="gpxml:cmt" />
   <xsl:apply-templates select="gpxml:desc" />
   <xsl:apply-templates select="gpxml:src" />
   <xsl:apply-templates select="gpxml:link" />
   <xsl:apply-templates select="gpxml:sym" />
   <xsl:apply-templates select="gpxml:type" />
   <xsl:apply-templates select="gpxml:fix" />
   <xsl:apply-templates select="gpxml:sat" />
   <xsl:apply-templates select="gpxml:hdop" />
   <xsl:apply-templates select="gpxml:vdop" />
   <xsl:apply-templates select="gpxml:pdop" />
   <xsl:apply-templates select="gpxml:ageofdgpsdata" />
   <xsl:apply-templates select="gpxml:dgpsid" />
   <xsl:apply-templates select="gpxml:extensions" />
  </gpx:trkpt>
 </rdf:Description>
</xsl:template>


</xsl:stylesheet>
