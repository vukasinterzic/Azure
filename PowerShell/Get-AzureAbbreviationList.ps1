# Specify the URL of the website and the ID of the table we want to scrape
$url = "https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations"

# Use Invoke-WebRequest with -UseBasicParsing to download the webpage and extract the HTML code
$html = Invoke-WebRequest -Uri $url -UseBasicParsing | Select-Object -ExpandProperty Content

#If everything else fails user regex! 
#Use regular expressions to extract the table data from the HTML code
$tableRegex = '<table>.*?<tbody>(.*?)</tbody>.*?</table>'
$rowRegex = '<tr>.*?<td>(.*?)</td>.*?<td>(.*?)</td>.*?<td>(.*?)</td>.*?</tr>'

$tableMatches = [regex]::Matches($html, $tableRegex, [System.Text.RegularExpressions.RegexOptions]::Singleline)

# Initialize an empty array to hold the table data
$tableData = @()

# Iterate over each match to extract the rows of data
foreach ($tableMatch in $tableMatches) {
    $tableRows = [regex]::Matches($tableMatch.Groups[1].Value, $rowRegex, [System.Text.RegularExpressions.RegexOptions]::Singleline)
    
    # Iterate over each row to extract the columns of data
    foreach ($tableRow in $tableRows) {
        $rowData = @{
            "Resource" = $tableRow.Groups[1].Value
            "Namespace" = ($tableRow.Groups[2].Value).Replace("<code>","").Replace("</code>","")
            "Abbreviation" = ($tableRow.Groups[3].Value).Replace("<code>","").Replace("</code>","")
        }
        
        # Add the row data to the table data array
        $tableData += New-Object PSObject -Property $rowData
    }
}

# Display the table data
$tableData
