#-------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation.  All rights reserved.
#-------------------------------------------------------------------------

Function WriteHtml
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $body
    )

    $htmlDoc = [string]::Empty

    #
    # CSS
    #
    $htmlStyle = WriteHtmlStyle

    $htmlHead = WriteHtmlElement -elementName "head" -innerHtml $htmlStyle

    $attributePopupWindow = WriteAttributePopupWindow
    
    $htmlDoc += $attributePopupWindow
    $htmlDoc += "`n"
    $htmlDoc += $htmlHead
    $htmlDoc += "`n"
    $htmlDoc += $body

    $html = WriteHtmlElement -elementName "html" -innerHtml $htmlDoc

    Write-Output $html
}

Function WriteHtmlBody
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $accordion
    )

    $banner = WriteHtmlMessage -message "Microsoft Azure" -color "#00ABEC" -fontSize "36px" -numberOfLineBreaks 0

    $bannerDiv = WriteHtmlElement -elementName "div" -class "banner" -innerHtml $banner

    $heading = WriteHtmlMessage -message $global:HtmlTitle -color "#FFFFFF" -fontSize "30px" -numberOfLineBreaks 0

    $headingDiv = WriteHtmlElement -elementName "div" -class "header" -innerHtml $heading

    $jqueryScript = WriteHtmlElement -elementName "script" -src "https://code.jquery.com/jquery-2.2.4.min.js"

    $jsScript = WriteHtmlScript

    $bodyInnerHtml = [string]::Empty

    $bodyInnerHtml += $bannerDiv
    $bodyInnerHtml += "`n"
    $bodyInnerHtml += $headingDiv
    $bodyInnerHtml += "`n"
    $bodyInnerHtml += $accordion
    $bodyInnerHtml += "`n"
    $bodyInnerHtml += $jqueryScript
    $bodyInnerHtml += "`n"
    $bodyInnerHtml += $jsScript

    $body = WriteHtmlElement -elementName "body" -onload "addRowHandlers()" -innerHtml $bodyInnerHtml

    Write-Output $body
}

Function WriteHtmlAccordion
{
    param
    (
        [string[]]
        [parameter(mandatory=$true)]
        $accordionGroupList,

        [string]
        [parameter(mandatory=$true)]
        $ObjectDn
    )

    $objectDnInnerHtml = [string]::Empty

    $objectDnHeading = WriteHtmlElement -elementName "h2" -innerHtml $global:HtmlObjectDistinguishedNameSectionTitle
    $objectDnValue = WriteHtmlElement -elementName "p" -id "ObjectDnId" -innerHtml $ObjectDn

    $objectDnInnerHtml += $objectDnHeading
    $objectDnInnerHtml += "`n"
    $objectDnInnerHtml += $objectDnValue

    $objectDnDiv = WriteHtmlElement -elementName "div" -innerHtml $objectDnInnerHtml

    $accordionInnerHtml += $objectDnDiv
    $accordionInnerHtml += "`n"
    $accordionInnerHtml += "</br>"
    $accordionInnerHtml += "`n"

    foreach ($group in $accordionGroupList)
    {
        $accordionInnerHtml += $group
        $accordionInnerHtml += "`n"
        $accordionInnerHtml += "</br>"
        $accordionInnerHtml += "`n"
    }
    
    $accordionInnerHtml = $accordionInnerHtml.Substring(0, $accordionInnerHtml.Length)

    $accordionInnerHtml += "</br>"
    $accordionInnerHtml += "`n"
    
    $accordionInnerHtml += "</br>"
    $accordionInnerHtml += "`n"

    $accordionInnerHtml += "</br>"
    $accordionInnerHtml += "`n"


    $feedbackEmail = WriteHyperlink("mailto:troubleshootaadc@microsoft.com")("troubleshootaadc@microsoft.com")

    $feedbackMessage = "Please send any feedback, comment and suggestions by email to: $($feedbackEmail)"

    $feedbackHtmlMessage = WriteHtmlMessage -message $feedbackMessage -color "#252525" -fontWeight "500" -numberOfLineBreaks 0

    $accordionInnerHtml += $feedbackHtmlMessage


    $accordionDiv = WriteHtmlElement -elementName "div" -class "accordion" -innerHtml $accordionInnerHtml

    Write-Output $accordionDiv
}

Function WriteHtmlAccordionGroup
{
    param
    (
        [string[]]
        [parameter(mandatory=$true)]
        $accordionItemList,

        [string]
        [parameter(mandatory=$true)]
        $title
    )

    $accordionGroupInnerHtml = [string]::Empty

    $heading = WriteHtmlElement -elementName "h2" -innerHtml $title

    $accordionGroupInnerHtml += $heading
    $accordionGroupInnerHtml += "`n"

    foreach ($item in $accordionItemList)
    {
        $accordionGroupInnerHtml += $item
        $accordionGroupInnerHtml += "`n"
    }

    $accordionGroupInnerHtml = $accordionGroupInnerHtml.Substring(0, $accordionGroupInnerHtml.Length-1)

    $accordionGroup = WriteHtmlElement -elementName "div" -class "accordion-group" -innerHtml $accordionGroupInnerHtml

    Write-Output $accordionGroup
}

 Function WriteHtmlAccordionItemForTable
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $title,

        [string]
        [parameter(mandatory=$true)]
        $tableId,

        [string[]]
        [parameter(mandatory=$true)]
        $tableHeaderColumns,

        [hashtable]
        [parameter(mandatory=$true)]
        $object,

        [string]
        [parameter(mandatory=$true)]
        $objectType,

        [hashtable]
        [parameter(mandatory=$false)]
        $objectToCompare
    )

    $headingInnerHtml = [string]::Empty

    $titleDiv = WriteHtmlElement -elementName "div" -class "title" -innerHtml $title

    $headingInnerHtml += $iconDiv
    $headingInnerHtml += "`n"
    $headingInnerHtml += $titleDiv

    $heading = WriteHtmlElement -elementName "a" -href "#" -class "heading" -innerHtml $headingInnerHtml

    $table = $null

    if($objectToCompare)
    {
        $table = WriteHtmlTable -tableId $tableId -tableHeaderColumns $tableHeaderColumns -object $object -objectToCompare $objectToCompare -objectType $objectType
    }
    else
    {
        $table = WriteHtmlTable -tableId $tableId -tableHeaderColumns $tableHeaderColumns -object $object -objectType $objectType
    }

    $tableContentDiv = WriteHtmlElement -elementName "div" -class "tableContent" -innerHtml $table

    $contentDiv = WriteHtmlElement -elementName "div" -class "content" -innerHtml $tableContentDiv

    $accordionItemInnerHtml = $heading
    $accordionItemInnerHtml += "`n"
    $accordionItemInnerHtml += $contentDiv

    $accordionItem = WriteHtmlElement -elementName "div" -class "accordion-item" -innerHtml $accordionItemInnerHtml

    Write-Output $accordionItem
 }

Function WriteHtmlAccordionItemForParagraph
{
    param
    (
        [System.Collections.Generic.List[string]]
        [parameter(mandatory=$true)]
        $messageList,

        [string]
        [parameter(mandatory=$true)]
        $title
    )

    $headingInnerHtml = [string]::Empty

    $titleDiv = WriteHtmlElement -elementName "div" -class "title" -innerHtml $title

    $headingInnerHtml += $iconDiv
    $headingInnerHtml += "`n"
    $headingInnerHtml += $titleDiv

    $heading = WriteHtmlElement -elementName "a" -href "#" -class "heading" -innerHtml $headingInnerHtml

    $paragraphInnerHtml = [string]::Empty

    foreach ($message in $messageList)
    {
        $paragraphInnerHtml += $message
        $paragraphInnerHtml += "`n"
    }

    $paragraphInnerHtml = $paragraphInnerHtml.Substring(0, $paragraphInnerHtml.Length-1)

    $paragraph = WriteHtmlElement -elementName "p" -class "issueText" -innerHtml $paragraphInnerHtml

    $contentDiv = WriteHtmlElement -elementName "div" -class "content" -innerHtml $paragraph

    $accordionItemInnerHtml = $heading
    $accordionItemInnerHtml += "`n"
    $accordionItemInnerHtml += $contentDiv

    $accordionItem = WriteHtmlElement -elementName "div" -class "accordion-item" -innerHtml $accordionItemInnerHtml

    Write-Output $accordionItem
}

Function WriteHtmlTable
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $tableId,

        [string[]]
        [parameter(mandatory=$true)]
        $tableHeaderColumns,

        [hashtable]
        [parameter(mandatory=$true)]
        $object,

        [hashtable]
        [parameter(mandatory=$false)]
        $objectToCompare,

        [string]
        [parameter(mandatory=$true)]
        $objectType
    )

    $tableHeader = WriteHtmlTableHeader -tableHeaderColumns $tableHeaderColumns

    $tableBody = $null

    if($objectToCompare)
    {
        $tableBody = WriteHtmlTableBody -object $object -objectToCompare $objectToCompare -objectType $objectType
    }
    else
    {
        $tableBody = WriteHtmlTableBody -object $object -objectType $objectType
    }

    $tableInnerHtml = $tableHeader
    $tableInnerHtml += "`n"
    $tableInnerHtml += $tableBody

    $table = WriteHtmlElement -elementName "table" -id $tableId -innerHtml $tableInnerHtml

    Write-Output $table
}

Function WriteHtmlTableHeader
{
    param
    (
        [string[]]
        [parameter(mandatory=$true)]
        $tableHeaderColumns
    )

    $rowInnerHtml = [string]::Empty

    foreach ($column in $tableHeaderColumns)
    {
        $rowInnerHtml += WriteHtmlElement -elementName "th" -scope "col" -innerHtml $column
        $rowInnerHtml += "`n"
    }

    $rowInnerHtml = $rowInnerHtml.Substring(0, $rowInnerHtml.Length-1)

    $row = WriteHtmlElement -elementName "tr" -innerHtml $rowInnerHtml

    $tableHeader = WriteHtmlElement -elementName "thead" -innerHtml $row
    
    Write-Output $tableHeader
}

Function WriteHtmlTableBody
{
    param
    (
        [hashtable]
        [parameter(mandatory=$true)]
        $object,

        [hashtable]
        [parameter(mandatory=$false)]
        $objectToCompare,

        [string]
        [parameter(mandatory=$true)]
        $objectType
    )

    $warningStyle = WriteStyleElement("background")("#ffff00")

    $bodyInnerHtml = [string]::Empty

    $object.GetEnumerator() | Foreach-Object {
        $attributeName = $_.Key
        $attributeValues = $_.Value

        $attributeValues2 = $null

        $rowInnerHtml = [string]::Empty

        $rowInnerHtml += WriteHtmlElement -elementName "td" -innerHtml $attributeName
        $rowInnerHtml += "`n"

        if ($attributeValues.Count -eq 1)
        {
            $rowInnerHtml += WriteHtmlElement -elementName "td" -innerHtml $attributeValues
            $rowInnerHtml += "`n"

            $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $objectType
            $rowInnerHtml += "`n"

            $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $attributeValues -class "eaAttributeValue"
            $rowInnerHtml += "`n"
        }
        else
        {
            $rowInnerHtml += WriteHtmlElement -elementName "td" -innerHtml "-- Multi-Valued --"
            $rowInnerHtml += "`n"

            $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $objectType
            $rowInnerHtml += "`n"

            foreach ($attributeValue in $attributeValues)
            {
                $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $attributeValue -class "eaAttributeValue"
                $rowInnerHtml += "`n"
            }
        }

        if($objectToCompare)
        {
            $attributeValues2 = $objectToCompare[$attributeName]

            if ($attributeValues2.Count -eq 0)
            {
                $rowInnerHtml += WriteHtmlElement -elementName "td" -innerHtml "-- No Value Retrieved --"
                $rowInnerHtml += "`n"

                $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $objectType
                $rowInnerHtml += "`n"

                $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value "-- No Value Retrieved --" -class "caAttributeValue"
                $rowInnerHtml += "`n"
            }
            elseif ($attributeValues2.Count -eq 1)
            {
                $rowInnerHtml += WriteHtmlElement -elementName "td" -innerHtml $attributeValues2
                $rowInnerHtml += "`n"

                $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $objectType
                $rowInnerHtml += "`n"

                $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $attributeValues2 -class "caAttributeValue"
                $rowInnerHtml += "`n"
            }
            else
            {
                $rowInnerHtml += WriteHtmlElement -elementName "td" -innerHtml "-- Multi-Valued --"
                $rowInnerHtml += "`n"

                $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $objectType
                $rowInnerHtml += "`n"

                foreach ($attributeValue in $attributeValues2)
                {
                    $rowInnerHtml += WriteHtmlElement -elementName "input" -type "hidden" -value $attributeValue -class "caAttributeValue"
                    $rowInnerHtml += "`n"
                }
            }
        }

        $rowInnerHtml = $rowInnerHtml.Substring(0, $rowInnerHtml.Length-1)

        if(($objectToCompare) -and (($attributeValues2.Count -eq 0) -or (Compare-Object $attributeValues $attributeValues2)))
        {
            $bodyInnerHtml += WriteHtmlElement -elementName "tr" -innerHtml $rowInnerHtml -style $warningStyle
        }
        else
        {
            $bodyInnerHtml += WriteHtmlElement -elementName "tr" -innerHtml $rowInnerHtml
        }

        $bodyInnerHtml += "`n"
    }

    $bodyInnerHtml = $bodyInnerHtml.Substring(0, $bodyInnerHtml.Length-1);

    $tableBody = WriteHtmlElement -elementName "tbody" -innerHtml $bodyInnerHtml

    Write-Output $tableBody
}

Function WriteHtmlMessage
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $message,

        [string]
        [parameter(mandatory=$false)]
        $color,

        [string]
        [parameter(mandatory=$false)]
        $fontSize,

        [string]
        [parameter(mandatory=$false)]
        $fontWeight,

        [string]
        [parameter(mandatory=$false)]
        $paddingLeft,

        [int]
        [parameter(mandatory=$true)]
        $numberOfLineBreaks
    )

    $style = [string]::Empty

    if (![string]::IsNullOrEmpty($color))
    {
        $style += WriteStyleElement("color")($color)
    }

    if (![string]::IsNullOrEmpty($fontSize))
    {
        $style += WriteStyleElement("font-size")($fontSize)
    }

    if (![string]::IsNullOrEmpty($fontWeight))
    {
        $style += WriteStyleElement("font-weight")($fontWeight)
    }

    if (![string]::IsNullOrEmpty($paddingLeft))
    {
        $style += WriteStyleElement("padding-left")($paddingLeft)
    }

    if (![string]::IsNullOrEmpty($style))
    {
        $style = $style.Substring(0, $style.Length-1)
    }
    
    $htmlMessage = WriteHtmlElement -elementName "span" -style $style -innerHtml $message

    for ($i = 0; $i -lt $numberOfLineBreaks; $i++)
    {
        $htmlMessage += "`n"
        $htmlMessage += "<br/>"
    }

    Write-Output $htmlMessage
}

Function WriteHtmlElement
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $elementName,

        [string]
        [parameter (mandatory=$false)]
        $id,

        [string]
        [parameter (mandatory=$false)]
        $class,

        [string]
        [parameter(mandatory=$false)]
        $scope,

        [string]
        [parameter(mandatory=$false)]
        $type,

        [string]
        [parameter(mandatory=$false)]
        $value,

        [string]
        [parameter(mandatory=$false)]
        $href,

        [string]
        [parameter(mandatory=$false)]
        $src,

        [string]
        [parameter(mandatory=$false)]
        $rel,

        [string]
        [parameter(mandatory=$false)]
        $style,

        [string]
        [parameter(mandatory=$false)]
        $onload,

        [string]
        [parameter(mandatory=$false)]
        $onclick,

        [string]
        [parameter(mandatory=$false)]
        $innerHtml
    )

    if ([string]::IsNullOrEmpty($elementName))
    {
    
    }

    $htmlElement = "<"
    $htmlElement += $elementName
    $htmlElement += " "
    
    if (![string]::IsNullOrEmpty($id))
    {
        $htmlElement += WriteHtmlAttribute("id")($id)
    }
    
    if (![string]::IsNullOrEmpty($class))
    {
        $htmlElement += WriteHtmlAttribute("class")($class)
    }
    
    if (![string]::IsNullOrEmpty($scope))
    {
        $htmlElement += WriteHtmlAttribute("scope")($scope)
    }

    if (![string]::IsNullOrEmpty($type))
    {
        $htmlElement += WriteHtmlAttribute("type")($type)
    }

    if (![string]::IsNullOrEmpty($value))
    {
        $htmlElement += WriteHtmlAttribute("value")($value)
    }

    if (![string]::IsNullOrEmpty($href))
    {
        $htmlElement += WriteHtmlAttribute("href")($href)
    }
    
    if (![string]::IsNullOrEmpty($src))
    {
        $htmlElement += WriteHtmlAttribute("src")($src)
    }

    if (![string]::IsNullOrEmpty($rel))
    {
         $htmlElement += WriteHtmlAttribute("rel")($rel)
    }

    if (![string]::IsNullOrEmpty($style))
    {
        $htmlElement += WriteHtmlAttribute("style")($style)
    }

    if (![string]::IsNullOrEmpty($onload))
    {
        $htmlElement += WriteHtmlAttribute("onload")($onload)
    }
    
    if (![string]::IsNullOrEmpty($onclick))
    {
        $htmlElement += WriteHtmlAttribute("onclick")($onclick)
    }
    
    # Remove last space character
    $htmlElement = $htmlElement.Substring(0, $htmlElement.Length-1)

    $htmlElement += ">"
    
    if (![string]::IsNullOrEmpty($innerHtml))
    {
        $htmlElement += "`r`n"
        
        $innerHtmlLines = $innerHtml.Split("`n")

        foreach ($line in $innerHtmlLines)
        {
            $htmlElement += "    "
            $htmlElement += $line
            $htmlElement += "`n"
        }
    }

    $htmlElement += "</"
    $htmlElement += $elementName
    $htmlElement += ">"

    Write-Output $htmlElement
}

Function WriteHtmlAttribute
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $attributeName,

        [string]
        [parameter(mandatory=$true)]
        $attributeValue
    )

    $htmlAttribute = $attributeName
    $htmlAttribute += "="
    $htmlAttribute += """"
    $htmlAttribute += $attributeValue
    $htmlAttribute += """"
    $htmlAttribute += " "

    Write-Output $htmlAttribute
}

Function WriteStyleElement
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $styleElementName,

        [string]
        [parameter(mandatory=$true)]
        $styleElementValue
    )

    $styleElement = [string]::Empty

    $styleElement += $styleElementName
    $styleElement += ": "
    $styleElement += $styleElementValue
    $styleElement += "; "

    Write-Output $styleElement
}

Function WriteHyperlink
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $url,

        [string]
        [parameter(mandatory=$true)]
        $text
    )

    $hyperlink = WriteHtmlElement -elementName "a" -href $url -style "color:#0078d7" -innerHtml $text

    Write-Output $hyperlink
}

Function WriteAttributePopupWindow
{
    $attributePopupWindow = @"
<div class="popupContainer" id="singleValuePopupContainerId">	
    <div class="attributeWindow"> 
        <div class="ObjectTypeHeading">
            <span class="close" onclick="closePopUpWindow()">&times;</span>
            <p class="ObjectTypeText" id="singleValueObjectTypeTextId"></p>
        </div>
        <div class="AttributeNameField">
            <p class="AttributeNameFieldText">Attribute Name:</p>
        </div>
        <div class="AttributeName">
            <p class="AttributeNameText" id="singleValueAttributeNameTextId"></p>
        </div>
        <div class="AttributeValueField">
            <p class="AttributeValueFieldText">Attribute Value:</p>
        </div>
        <div id="SingleValueAttributeValue">
            <p class="AttributeValueText" id="singleValueAttributeValueTextId"></p>
        </div>
    </div>
</div>

<div class="popupContainer" id="multiValuePopupContainerId">	
    <div class="attributeWindow"> 
        <div class="ObjectTypeHeading">
            <span class="close" onclick="closePopUpWindow()">&times;</span>
            <p class="ObjectTypeText" id="multiValueObjectTypeTextId"></p>
        </div>
        <div class="AttributeNameField">
            <p class="AttributeNameFieldText">Attribute Name:</p>
        </div>
        <div class="AttributeName">
            <p class="AttributeNameText" id="multiValueAttributeNameTextId"></p>
        </div>
        <div class="AttributeValueField">
            <p class="AttributeValueFieldText">Attribute Values:</p>
        </div>
        <div id="MultiValueAttributeValue">
            <table id="multiValueAttributeValueTableId">
            </table>
        </div>
    </div>
</div>

<div class="popupContainer" id="comparisonPopupContainerId">	
    <div class="attributeWindow"> 
        <div class="ObjectTypeHeading">
            <span class="close" onclick="closePopUpWindow()">&times;</span>
            <p class="ObjectTypeText" id="comparisonObjectTypeTextId"></p>
        </div>
        <div class="AttributeNameField">
            <p class="AttributeNameFieldText">Attribute Name:</p>
        </div>
        <div class="AttributeName">
            <p class="AttributeNameText" id="comparisonAttributeNameTextId"></p>
        </div>
        <div class="AttributeValueField">
            <p class="AttributeValueFieldText">Attribute Value(s) retrieved by provided account:</p>
        </div>
        <div id="MultiValueAttributeValue">
            <table id="comparisonAttributeValueTableOneId">
            </table>
        </div>
        <div class="AttributeValueField">
            <p class="AttributeValueFieldText">Attribute Value(s) retrieved by Connector:</p>
        </div>
        <div id="MultiValueAttributeValue">
            <table id="comparisonAttributeValueTableTwoId">
            </table>
        </div>
    </div>
</div>

"@

    Write-Output $attributePopupWindow
}

Function WriteHtmlStyle
{
    $htmlStyle = @"
html 
{
    font-family: "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
}

body
{
    background: #FFFFFF;
    margin: 0;
}

.banner
{
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 30px;
    background: #000000;
}

.header 
{
    text-align: center;
    background: #252525;
    padding-bottom: 5px;
}

h1 
{
    color: #000000;
}

h2 
{
    border-bottom: solid 2px #CCCCCC;
    padding-bottom: 3px;
    color: #252525;
    font-weight: 500;
}

.accordion 
{
    width: 100%;
    max-width: 95rem;
    margin: 0 auto;
    padding: 2rem;
}

.accordion-group 
{
    position: relative;
}

.accordion-item 
{
    position: relative;
}
.accordion-item.active .heading 
{
    color: #0078d7;
}

.accordion-item.active .icon 
{
    background: #fefcff;
}

.accordion-item.active .icon:before 
{
    background: #0078d7;
}

.accordion-item.active .icon:after 
{
    width: 0;
}

.accordion-item .heading 
{
    display: block;
    text-decoration: none;
    color: #0078d7;
    font-weight: 500;
    font-size: 1rem;
    position: relative;
    padding: 1.5rem 0 1.5rem;
    -webkit-transition: 0.3s ease-in-out;
    transition: 0.3s ease-in-out;
}

@media (min-width: 40rem) 
{
    .accordion-item .heading 
    {
        font-size: 1.2rem;
    }
}

.accordion-item .heading:hover
{
    text-decoration: underline;
}

.accordion-item .heading:hover .icon
{
    background: #fefcff;
}

.accordion-item .heading:hover .icon:before, .accordion-item .heading:hover .icon:after
{
    background: #1F45FC;
}

.accordion-item .icon 
{
    display: block;
    position: absolute;
    top: 50%;
    left: 0;
    width: 3rem;
    height: 3rem;
    border: 2px solid #000080;
    border-radius: 3px;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
}

.accordion-item .icon:before, .accordion-item .icon:after 
{
    content: '';
    width: 1.25rem;
    height: 0.25rem;
    background: #000080;
    position: absolute;
    border-radius: 3px;
    left: 50%;
    top: 50%;
    -webkit-transition: 0.3s ease-in-out;
    transition: 0.3s ease-in-out;
    -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
}

.accordion-item .icon:after 
{
    -webkit-transform: translate(-50%, -50%) rotate(90deg);
            transform: translate(-50%, -50%) rotate(90deg);
    z-index: -1;
}

.accordion-item .content 
{
    width: 100%;
    display: none;
    background: #ffffff;
}

.accordion-item .content
{
    margin-top: 0;
}


@media (min-width: 40rem)
{
    .accordion-item .content
    {
        line-height: 1.75;
    }
}

.accordion-item .content .tableContent
{
    max-height: 600px;
    overflow-y: auto;
}

table
{
    width: 90%;
    border-collapse: collapse;
    margin-left: auto;
    margin-right: auto;
}

th 
{ 
    background: #ffffff; 
    color: #252525; 
    font-weight: bold; 
    text-align: left;
    padding-left: 50px;
    padding-top: 15px;
    padding-bottom: 15px;
    border-bottom: 1px solid #A9A9A9;
}

tr
{
    background: #ffffff;
}

tr:hover 
{
    background: #b4d2e5;
}

td
{
    width: 50%;
    color: #252525;
    text-align: left;
    padding-left: 50px;
    padding-top: 15px;
    padding-bottom: 15px;
    border-bottom: 1px solid #A9A9A9;
}

.popupContainer
{
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    background-color: rgba(0, 0, 0, 0.6);
}

.attributeWindow
{
    width: 40%;
    background: #d9d9d9;
    margin-left: auto;
    margin-right: auto;
    padding-bottom: 20px;
    opacity: 1.0;
    vertical-align: middle;
    margin-top: 100px;
}

.ObjectTypeHeading
{
    width: 100%;
    background: #003c6c;
}

.ObjectTypeText
{
    padding-left: 5%;
    padding-bottom: 10px;
    padding-top: 10px;
    color: #fff;
    font-weight: bold;
    font-size: 18px;
}

.AttributeNameField
{
    width: 100%;
}

.AttributeNameFieldText
{
    padding-left: 5%;
    color: #000;
    font-weight: bold;
    font-size: 16x;
}

.AttributeName
{	
    width: 90%;
    background: #fff;
    margin-left: auto;
    margin-right: auto;
}

.AttributeNameText
{
    padding-left: 4px;
    padding-top: 5px;
    padding-bottom: 5px;
    font-size: 16x;
    color: #000;
}

.AttributeValueField
{
    width: 100%;
    padding-top: 5px;
}

.AttributeValueFieldText
{
    padding-left: 5%;
    color: #000;
    font-weight: bold;
    font-size: 16x;
}

#SingleValueAttributeValue
{
    width: 90%;
    background: #fff;
    margin-left: auto;
    margin-right: auto;
}

#MultiValueAttributeValue
{
    width: 90%;
    background: #fff;
    margin-left: auto;
    margin-right: auto;
    max-height: 200px;
    overflow-y: auto;
}

.AttributeValueText
{
    padding-left: 4px;
    padding-top: 5px;
    padding-bottom: 5px;
    font-size: 16x;
    color: #000;
}

.close
{
    color: #000000;
    float: right;
    font-size: 32px;
    font-weight: bold;
    padding-right: 10px;
}

.close:hover
{
    color: #ff0000;
}

#ObjectDnId
{
    font-size: 20px;
}

.issueText
{
    font-size: 14px;
}
"@

    $htmlStyleElement = WriteHtmlElement -elementName "style" -innerHtml $htmlStyle

    Write-Output $htmlStyleElement
}

Function WriteHtmlScript
{
    $htmlScript = @"
`$('.accordion-item .heading').on('click', function(e) {
    e.preventDefault();

    // Add the correct active class
    if(`$(this).closest('.accordion-item').hasClass('active')) {
        // Remove active classes
        `$('.accordion-item').removeClass('active');
    } else {
        // Remove active classes
        `$('.accordion-item').removeClass('active');

        // Add the active class
        `$(this).closest('.accordion-item').addClass('active');
    }

    // Show the content
    var `$content = `$(this).next();
    `$content.slideToggle(200);
    `$('.accordion-item .content').not(`$content).slideUp('fast');
    
    `$('html, body').animate({scrollTop: `$content.offset().top-100}, 600);
});

function addRowHandlers()
{	
    addObjectTableRowHandler("ADObjectTable");
    addObjectTableRowHandler("AADConnectObjectTable");
    addObjectTableRowHandler("AADObjectTable");
    addObjectComparisonTableRowHandler("ADObjectAttributeComparisonTable");
};

function addObjectTableRowHandler(tableId)
{
    var objectTable = document.getElementById(tableId);

    if(objectTable != null)
    {
        var rows = objectTable.getElementsByTagName("tr");
    
        for (i = 1; i < rows.length; i++)
        {
            var currentRow = rows[i];
        
            var createRowClickHandler =
                function(row)
                {
                    return function(){
                        var cols = row.getElementsByTagName("td");
                        var values = row.getElementsByTagName("input");
                    
                        if (values.length == 2)
                        {
                            document.getElementById("singleValueObjectTypeTextId").innerHTML = values[0].value + " Details";
                            document.getElementById("singleValueAttributeNameTextId").innerHTML = cols[0].innerHTML;
                            document.getElementById("singleValueAttributeValueTextId").innerHTML = values[1].value;
                            document.getElementById("singleValuePopupContainerId").style.display = "block";
                        }
                        else
                        {
                            document.getElementById("multiValueObjectTypeTextId").innerHTML = values[0].value + " Details";
                            document.getElementById("multiValueAttributeNameTextId").innerHTML = cols[0].innerHTML;
                        
                            var multiValueTable = document.getElementById("multiValueAttributeValueTableId");
                        
                            for (k = 1; k < values.length; k++)
                            {
                                var multiValueRow = multiValueTable.insertRow(k-1);
                                var multiValueCell = multiValueRow.insertCell(0);
                            
                                multiValueCell.innerHTML = values[k].value;
                            }
                        
                            document.getElementById("multiValuePopupContainerId").style.display = "block";
                        }
                    };
                };
        
            currentRow.onclick = createRowClickHandler(currentRow);
        }
    }
}

function addObjectComparisonTableRowHandler(tableId)
{
    var objectTable = document.getElementById(tableId);

    if(objectTable != null)
    {
        var rows = objectTable.getElementsByTagName("tr");
    
        for (i = 1; i < rows.length; i++)
        {
            var currentRow = rows[i];
        
            var createRowClickHandler =
                function(row)
                {
                    return function(){
                        var cols = row.getElementsByTagName("td");
                        var values = row.getElementsByTagName("input");

                        var values1 = row.getElementsByClassName("eaAttributeValue");
                        var values2 = row.getElementsByClassName("caAttributeValue");
                    
                        document.getElementById("comparisonObjectTypeTextId").innerHTML = values[0].value + " Details";
                        document.getElementById("comparisonAttributeNameTextId").innerHTML = cols[0].innerHTML;
                        
                        var multiValueTable = document.getElementById("comparisonAttributeValueTableOneId");
                        
                        for (k = 0; k < values1.length; k++)
                        {
                            var multiValueRow = multiValueTable.insertRow(k-1);
                            var multiValueCell = multiValueRow.insertCell(0);
                            
                            multiValueCell.innerHTML = values1[k].value;
                        }

                        var multiValueTable2 = document.getElementById("comparisonAttributeValueTableTwoId");
                        
                        for (k = 0; k < values2.length; k++)
                        {
                            var multiValueRow = multiValueTable2.insertRow(k-1);
                            var multiValueCell = multiValueRow.insertCell(0);
                            
                            multiValueCell.innerHTML = values2[k].value;
                        }
                        
                        document.getElementById("comparisonPopupContainerId").style.display = "block";
                    };
                };
        
            currentRow.onclick = createRowClickHandler(currentRow);
        }
    }
}

function closePopUpWindow()
{
    document.getElementById("multiValueAttributeValueTableId").innerHTML = "";
    document.getElementById("comparisonAttributeValueTableOneId").innerHTML = "";
    document.getElementById("comparisonAttributeValueTableTwoId").innerHTML = "";
    document.getElementById("singleValuePopupContainerId").style.display = "none";
    document.getElementById("multiValuePopupContainerId").style.display = "none";
    document.getElementById("comparisonPopupContainerId").style.display = "none";
}
"@

    $htmlScriptElement = WriteHtmlElement -elementName "script" -innerHtml $htmlScript

    Write-Output $htmlScriptElement
}
# SIG # Begin signature block
# MIIjngYJKoZIhvcNAQcCoIIjjzCCI4sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBnXj+heMUeVTml
# 3SnAExK6MrvAdA0HbZbS4PJxXJr4wKCCDY0wggYLMIID86ADAgECAhMzAAABk0OF
# vrUO7rXoAAAAAAGTMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjAwMzExMTgwNzU0WhcNMjEwMzA1MTgwNzU0WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDn0OLPwyj8xlLmUR0LiQCYQNzlqxTlrdK2+BDBFHEmLi1Pe2bC9J78LIvlVA36
# gQnsId5tQFWtM/hCgeTsmuoa+SLVw7LQflrljGfZO0SpoHmRtToIcgQQebA6g5V/
# 5aMXsP952DcjxQ+hatxetyGjVG0pIPXrVAB/FiR//M/NfoNv1p/opVdSv0bmcOHA
# fFR0YjZy0aROgE2SEEzq2knX/XJlh2QqNl5R7KPFZuHs9wsVrgANf6Yas45NGtMq
# v0sTWOQircgQjFmw9iWTcrUh5k7WXHMk3maxKhn4jYC94efHvJhGpUEh50AUuhlu
# IA4q+OdQvFBtZDNCHBQSF8FHAgMBAAGjggGKMIIBhjArBgNVHSUEJDAiBgorBgEE
# AYI3TBMBBgorBgEEAYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQU6cwFN9h8PvZR
# C1itEKb61e2fdXIwUAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBP
# cGVyYXRpb25zIFB1ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzMxMTArNDU5MTAxMB8G
# A1UdIwQYMBaAFEhuZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWG
# Q2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BD
# QTIwMTFfMjAxMS0wNy0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAC
# hkVodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNp
# Z1BDQTIwMTFfMjAxMS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0B
# AQsFAAOCAgEAN4Ylr8zis9nitOU1XI0z1YxJ1RWNk0sCsDr/xkd5ZVEA/D6SA6ZS
# 2ezRCIj70WFWmg8KMpMsfj+4VmFaO9iKx/2V5kGsJsEG6NajdxrrLucfs/PKe4M5
# WNuTyDJGDXXwK1yw00UNYK00MzSfvZ1ix9iS0wKZhP7ROMTtqW9QoCOR94kT7ygN
# jCorLawaNz90YDR/aR3y0nozK/q9l62fTHbfM11zxqSJHdd7nmPi8age6K5xZhLU
# ptifZXy9ShlbmiSgSiJ+3ExUL6zdCKB2lFA7QLdZUdpKYeQfeIeKS95o4WSLHuut
# ULG+37mdUgCq4BzhL1Q3J841ehn+V/SVbp5zOQUpqAnipgqL9OOaRBCpc085pfqc
# PLpXab25Qojz6i9JcSwupN6bv6PtUvFzfJix/UGdv0Jo3q842tPCZ3uhZFI3+pd2
# 8dkJIaMgjatwb7cxzVgwe4bTSCne4Yk3iZXQP4/rvgeNdVmc1Rd6XRxUxSDmQCIs
# oapbxomgWa2Ln0LM+tIl6OcZ+pUH5cZpYWGy3nbc5QEYt5wiPXPAznfBemqoTx1Z
# pBl8oOmoSLfsRmat/kvHphCsMcJwKg8V36W/NXIB2nwARkMwv70rrBQlp7LWojmw
# U/bLKCuY54uOuc+ciiQpi0RjMXZOLvc8o/jmNEAg928uy9U8ZmsnJq0wggd6MIIF
# YqADAgECAgphDpDSAAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9v
# dCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0y
# NjA3MDgyMTA5MDlaMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIi
# MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZY
# IZ9CGypr6VpQqrgGOBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+
# lGAkbK+eSZzpaF7S35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDP
# s0S3XdjELgN1q2jzy23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJ
# KecNvqATd76UPe/74ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJ
# T4Qa8qEvWeSQOy2uM1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qc
# D60ZI4TL9LoDho33X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm
# 7GEfauEoSZ1fiOIlXdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/b
# wBWzvRvUVUvnOaEP6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKer
# jt/sW5+v/N2wZuLBl4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHt
# bcMojyyPQDdPweGFRInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70
# lrC8RqBsmNLg1oiMCwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYD
# VR0OBBYEFEhuZOVQBdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1
# AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaA
# FHItOgIxkEO5FAVO4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
# cmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIw
# MTFfMjAxMV8wM18yMi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJo
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIw
# MTFfMjAxMV8wM18yMi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGD
# MD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Rv
# Y3MvcHJpbWFyeWNwcy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8A
# cABvAGwAaQBjAHkAXwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQEL
# BQADggIBAGfyhqWY4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFt
# g/6+P+gKyju/R6mj82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/Wvj
# PgcuKZvmPRul1LUdd5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvt
# aPpoLpWgKj8qa1hJYx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+Z
# KJeYTQ49C/IIidYfwzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x
# 9Cf43iw6IGmYslmJaG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3bl
# QCplo8NdUmKGwx1jNpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8U
# vmFhtfDcxhsEvt9Bxw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGb
# pT9Fdx41xtKiop96eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNo
# deav+vyL6wuA6mk7r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uo
# zKRdwaGIm1dxVk5IRcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIVZzCCFWMC
# AQEwgZUwfjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYG
# A1UEAxMfTWljcm9zb2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAZNDhb61
# Du616AAAAAABkzANBglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYB
# BAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0B
# CQQxIgQgZP9FEFh1cNO2kyeqbQF2BwaDfjsYXQQ2nt1kBZtqMn0wQgYKKwYBBAGC
# NwIBDDE0MDKgFIASAE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbTANBgkqhkiG9w0BAQEFAASCAQDKAqj3keFx9Jo53Tx6oJ040d4q
# qCQ+mqmRv41ZITWcgOA604zNo3at4EeiYnWiHMSE1JAC+NWNPJwxiOVvTPDENg9K
# o4RXq0DqFVu+NNevnfodfQt5WM6T9F5YtQCXnwFIQZzRvqNIRrEzIFWUf4LGbfNd
# 19ELGN5lL8jGZYhC6ByLgXKtlQEw1NuhToqxkmysckVY/lqOYndBatNuVBQ7DqmX
# mAEDYgwMe86jwSYM6TLT4QNxsnTdnMgjAuYIVCwDHkz9QP/ZhzIBvYvXjLTFjV7y
# HEHUmMKV2Tjxp89T3R+akHDWRWxyQyR7C6CE6woq2RcSCRtyyLC4f724duREoYIS
# 8TCCEu0GCisGAQQBgjcDAwExghLdMIIS2QYJKoZIhvcNAQcCoIISyjCCEsYCAQMx
# DzANBglghkgBZQMEAgEFADCCAVUGCyqGSIb3DQEJEAEEoIIBRASCAUAwggE8AgEB
# BgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIAPr10LnJH5axa0vuQYNGi+R
# N8w0326ynt/oCKPSyLEQAgZfFz76HfkYEzIwMjAwNzI1MDcyNjAxLjE4NlowBIAC
# AfSggdSkgdEwgc4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24x
# KTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1ZXJ0byBSaWNvMSYwJAYD
# VQQLEx1UaGFsZXMgVFNTIEVTTjpGNzdGLUUzNTYtNUJBRTElMCMGA1UEAxMcTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCDkQwggT1MIID3aADAgECAhMzAAAB
# KugXlviGp++jAAAAAAEqMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwMB4XDTE5MTIxOTAxMTUwMloXDTIxMDMxNzAxMTUwMlowgc4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKTAnBgNVBAsTIE1p
# Y3Jvc29mdCBPcGVyYXRpb25zIFB1ZXJ0byBSaWNvMSYwJAYDVQQLEx1UaGFsZXMg
# VFNTIEVTTjpGNzdGLUUzNTYtNUJBRTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgU2VydmljZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ/f
# lYGkhdJtxSsHBu9lmXF/UXxPF7L45nEhmtd01KDosWbY8y54BN7+k9DMvzqToP39
# v8/Z+NtEzKj8Bf5EQoG1/pJfpzCJe80HZqyqMo0oQ9EugVY6YNVNa2T1u51d96q1
# hFmu1dgxt8uD2g7IpBQdhS2tpc3j3HEzKvV/vwEr7/BcTuwqUHqrrBgHc971epVR
# 4o5bNKsjikawmMw9D/tyrTciy3F9Gq9pEgk8EqJfOdAabkanuAWTjlmBhZtRiO9W
# 1qFpwnu9G5qVvdNKRKxQdtxMC04pWGfnxzDac7+jIql532IEC5QSnvY84szEpxw3
# 1QW/LafSiDmAtYWHpm8CAwEAAaOCARswggEXMB0GA1UdDgQWBBRw9MUtdCs/rhN2
# y9EkE6ZI9O8TaTAfBgNVHSMEGDAWgBTVYzpcijGQ80N7fEYbxTNoWoVtVTBWBgNV
# HR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9w
# cm9kdWN0cy9NaWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcmwwWgYIKwYBBQUHAQEE
# TjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2Nl
# cnRzL01pY1RpbVN0YVBDQV8yMDEwLTA3LTAxLmNydDAMBgNVHRMBAf8EAjAAMBMG
# A1UdJQQMMAoGCCsGAQUFBwMIMA0GCSqGSIb3DQEBCwUAA4IBAQCKwDT0CnHVo46O
# WyUbrPIj8QIcf+PTjBVYpKg1K2D15Z6xEuvmf+is6N8gj9f1nkFIALvh+iGkx8Gg
# Ga/oA9IhXNEFYPNFaHwHan/UEw1P6Tjdaqy3cvLC8f8zE1CR1LhXNofq6xfoT9HL
# GFSg9skPLM1TQ+RAQX9MigEm8FFlhhsQ1iGB1399x8d92h9KspqGDnO96Z9Aj7Ob
# DtdU6RoZrsZkiRQNnXmnX1I+RuwtLu8MN8XhJLSl5wqqHM3rqaaMvSAISVtKySpz
# JC5Zh+5kJlqFdSiIHW8Q+8R6EWG8ILb9Pf+w/PydyK3ZTkVXUpFA+JhWjcyzphVG
# w9ffj0YKMIIGcTCCBFmgAwIBAgIKYQmBKgAAAAAAAjANBgkqhkiG9w0BAQsFADCB
# iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMp
# TWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAw
# NzAxMjEzNjU1WhcNMjUwNzAxMjE0NjU1WjB8MQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQ
# Q0EgMjAxMDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKkdDbx3EYo6
# IOz8E5f1+n9plGt0VBDVpQoAgoX77XxoSyxfxcPlYcJ2tz5mK1vwFVMnBDEfQRsa
# lR3OCROOfGEwWbEwRA/xYIiEVEMM1024OAizQt2TrNZzMFcmgqNFDdDq9UeBzb8k
# YDJYYEbyWEeGMoQedGFnkV+BVLHPk0ySwcSmXdFhE24oxhr5hoC732H8RsEnHSRn
# EnIaIYqvS2SJUGKxXf13Hz3wV3WsvYpCTUBR0Q+cBj5nf/VmwAOWRH7v0Ev9buWa
# yrGo8noqCjHw2k4GkbaICDXoeByw6ZnNPOcvRLqn9NxkvaQBwSAJk3jN/LzAyURd
# XhacAQVPIk0CAwEAAaOCAeYwggHiMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQW
# BBTVYzpcijGQ80N7fEYbxTNoWoVtVTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMA
# QTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbL
# j+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1p
# Y3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0w
# Ni0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIz
# LmNydDCBoAYDVR0gAQH/BIGVMIGSMIGPBgkrBgEEAYI3LgMwgYEwPQYIKwYBBQUH
# AgEWMWh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9QS0kvZG9jcy9DUFMvZGVmYXVs
# dC5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AUABvAGwAaQBjAHkA
# XwBTAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAAfmiFEN
# 4sbgmD+BcQM9naOhIW+z66bM9TG+zwXiqf76V20ZMLPCxWbJat/15/B4vceoniXj
# +bzta1RXCCtRgkQS+7lTjMz0YBKKdsxAQEGb3FwX/1z5Xhc1mCRWS3TvQhDIr79/
# xn/yN31aPxzymXlKkVIArzgPF/UveYFl2am1a+THzvbKegBvSzBEJCI8z+0DpZaP
# WSm8tv0E4XCfMkon/VWvL/625Y4zu2JfmttXQOnxzplmkIz/amJ/3cVKC5Em4jns
# GUpxY517IW3DnKOiPPp/fZZqkHimbdLhnPkd/DjYlPTGpQqWhqS9nhquBEKDuLWA
# myI4ILUl5WTs9/S/fmNZJQ96LjlXdqJxqgaKD4kWumGnEcua2A5HmoDF0M2n0O99
# g/DhO3EJ3110mCIIYdqwUB5vvfHhAN/nMQekkzr3ZUd46PioSKv33nJ+YWtvd6mB
# y6cJrDm77MbL2IK0cs0d9LiFAR6A+xuJKlQ5slvayA1VmXqHczsI5pgt6o3gMy4S
# KfXAL1QnIffIrE7aKLixqduWsqdCosnPGUFN4Ib5KpqjEWYw07t0MkvfY3v1mYov
# G8chr1m1rtxEPJdQcdeh0sVV42neV8HR3jDA/czmTfsNv11P6Z0eGTgvvM9YBS7v
# DaBQNdrvCScc1bN+NR4Iuto229Nfj950iEkSoYIC0jCCAjsCAQEwgfyhgdSkgdEw
# gc4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKTAnBgNVBAsT
# IE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1ZXJ0byBSaWNvMSYwJAYDVQQLEx1UaGFs
# ZXMgVFNTIEVTTjpGNzdGLUUzNTYtNUJBRTElMCMGA1UEAxMcTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUA6rLmrKHyIMP76ePl321x
# KUJ3YX+ggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
# bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
# aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDANBgkq
# hkiG9w0BAQUFAAIFAOLGWp8wIhgPMjAyMDA3MjUxMTE1NDNaGA8yMDIwMDcyNjEx
# MTU0M1owdzA9BgorBgEEAYRZCgQBMS8wLTAKAgUA4sZanwIBADAKAgEAAgIeFgIB
# /zAHAgEAAgIRjDAKAgUA4sesHwIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEE
# AYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBBQUAA4GB
# AFpi3pXFmJGhAEQfLRZJHJ7OVR0tSJn5PXV/nfkYQPZdStuiBFvtBuQyGHD5mkrf
# s3gZ8Wrdlwrxnwv3AT7+Iu6RdMEX3HdAzNjkluF6h/AY8mhPpJMVmkQG39igqiT4
# Zcf01zTHdgluP9qEGxzaeeiHloorz4j2DNzRyldbUnGZMYIDDTCCAwkCAQEwgZMw
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAEq6BeW+Ian76MAAAAA
# ASowDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRAB
# BDAvBgkqhkiG9w0BCQQxIgQgLiowrdw3U42+TeUoEMXFeshENCvQspkN6imCAfed
# ICIwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCBDmDWEWvc6fhs5t4Woo5Q+
# FMFCcaIgV4yUP4CpuBmLmTCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAABKugXlviGp++jAAAAAAEqMCIEIHGx3wq0UYdFmz7AJYhSc4i+
# 0VoLSAQNxLjlwxfI8y3JMA0GCSqGSIb3DQEBCwUABIIBAIpHXbLxi5s63nUT20IT
# KFzoKrSqXRBlpEXU8VuKpdzwUSIMWKEidZeu4cQQDhdYKQJyanw4ZtDu+w0sJaNI
# JQcAgeFa82u0f2PtI7QYhdz5d1qwfoFpd2tgzkbfk4YqUU+Qt/Ue93GQziaYuSpY
# qm7SLmz0YwuiQjCZiDMa1a5WApe7GDXv8+e4Bthz81HyGrCRtl/7GnV7v1nxdmdF
# D0i3+669bZfTZaQXVbYYdIUzDa/M8NVvxroXRACmxLwx5LHJqlz1Z2nYlrl3fdmP
# gVojG+foWSj8N+/bACbQqYoSCeXFUYk9IxWeWfwuv2HflgdeUJf0FXvail2M3iQr
# fcc=
# SIG # End signature block
