<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method = "html"/>

	<xsl:template match="/bow-ranking">
		<html>
			<head>
				<title>Bogenmeisterschaften 2023</title>
			</head>
			<body>
				<h1>Bogenmeisterschaften 2023</h1>
				<h2>Inhalt</h2>
				<ul>
					<xsl:for-each select="club">
						<li><a href = "#{generate-id()}"><xsl:value-of select = "club-name"/></a></li>
					</xsl:for-each>
					
					<xsl:for-each select = "tournament">
						<li><xsl:value-of select = "@name"/></li>
					</xsl:for-each>
				</ul>
				
				<h2>Vereine</h2>
				<xsl:apply-templates select = "club"/>
				
				<h2>Turniere</h2>
				<xsl:apply-templates select = "tournament"/>
			</body>
		</html>
	</xsl:template>
	
	
	<xsl:template match="club">
		<h3 id = "{generate-id()}">
			Verein:
			<xsl:value-of select="club-name"/>
		</h3>
		<table>
			<tr>
				<th>ID</th>
				<th>Vorname</th>
				<th>Nachname</th>
				<th>Geschlecht</th>
				<th>Geburtsjahr</th>
				<th>Altergruppe</th>
				<th>Schussstil</th>
				<th>Genauigkeit</th>
				<th>Gesamtpunkte</th>
			</tr>
			
			<xsl:apply-templates select="archer"/>
			<xsl:apply-templates select="trainer"/>
		</table>
	</xsl:template>
	
	
	<xsl:template match="archer | trainer">
		<xsl:variable name = "p" select = "id(@person-id)"/> 
		<tr>
			<td>
				<xsl:value-of select="$p/@id"/>
			</td>
			<td>
				<xsl:value-of select="$p/firstname"/>
			</td>
			<td>
				<xsl:value-of select="$p/lastname"/>
			</td>
			<td>
				<xsl:value-of select="$p/gender"/>
			</td>
			<td>
				<xsl:value-of select="$p/year-of-birth"/>
			</td>
			<td>
				<xsl:value-of select="$p/age-group"/>
			</td>
			<td>
				<xsl:value-of select="$p/statistic/shooting-styles"/>
			</td>
			<td>
				<xsl:value-of select="$p/statistic/shooting-accuracy"/>
			</td>
			<td>
				<xsl:value-of select="$p/statistic/total-points"/>
			</td>
		</tr>
	</xsl:template>
	
	
	<xsl:template match="tournament">
		<h2>
			Turnier:
			<xsl:value-of select="@name"/>
		</h2>
		<table>
			<tr>
				<th>Rang</th>
				<th>ID</th>
				<th>Punkte</th>
			</tr>
			<xsl:apply-templates select="ranking"/>
		</table>
	</xsl:template>
	<xsl:template match="ranking">
		<tr>
			<td>
				<xsl:value-of select="@rank"/>
			</td>
			<td>
				<xsl:value-of select="@archer-id"/>
			</td>
			<td>
				<xsl:value-of select="@points"/>
			</td>
			</tr>
		</xsl:template>
	</xsl:stylesheet>
