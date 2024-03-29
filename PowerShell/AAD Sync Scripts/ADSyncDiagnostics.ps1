#-------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation.  All rights reserved.
#-------------------------------------------------------------------------

#
# Event IDs
#
Set-Variable -Option Constant -Scope script -Name EventIdDiagnosticsReportRun  -Value 3001
Set-Variable -Option Constant -Scope script -Name EventIdDiagnosticsReportEnd  -Value 3002
Set-Variable -Option Constant -Scope script -Name EventIdDiagnosticsReportFail -Value 3003

#
# Event Messages
#
Set-Variable -Option Constant -Scope script -Name EventMsgDiagnosticsReportRun  -Value "`r`nData collection has been started."
Set-Variable -Option Constant -Scope script -Name EventMsgDiagnosticsReportEnd  -Value "`r`nData collection finished successfully. `r`n{0}"
Set-Variable -Option Constant -Scope script -Name EventMsgDiagnosticsReportFail -Value "`r`nData collection terminated with an error. `r`n{0}"


#-------------------------------------------------------------------------
# 
# Helper functions to run AADConnect Diagnostics Report.
#
#-------------------------------------------------------------------------

#
# Outputs Windows Server OS information
#
Function Get-ADSyncDiagsServerOS
{
    $adSyncServername = $env:computername
    $adSyncOS = Get-WmiObject -class Win32_OperatingSystem -computername $adSyncServername

    $adSyncOSa = @()
    $row = "" | select ComputerName,Description,Caption,Version,BuildNumber,ServicePackMinorVersion,ServicePackMajorVersion,OSLanguage,OSArchitecture,Locale,CodeSet,LastBootUpTime,InstallDate
    $row.ComputerName = $adSyncServername
    $row.Description = $adSyncOS.Description
    $row.Caption = $adSyncOS.Caption
    $row.Version = $adSyncOS.Version
    $row.BuildNumber = $adSyncOS.BuildNumber
    $row.ServicePackMinorVersion = $adSyncOS.ServicePackMinorVersion
    $row.ServicePackMajorVersion = $adSyncOS.ServicePackMajorVersion
    $row.OSArchitecture = $adSyncOS.OSArchitecture
    $row.OSLanguage = $adSyncOS.OSLanguage
    $row.Locale = $adSyncOS.Locale
    $row.CodeSet = $adSyncOS.CodeSet
    $row.LastBootUpTime = $adSyncOS.LastBootUpTime
    $row.InstallDate = $adSyncOS.InstallDate
    $adSyncOSa += $row

    return $adSyncOSa
}

#-------------------------------------------------------------------------
# 
# Helper function to initialize AADConnect Diagnostics Report.
#
#-------------------------------------------------------------------------
Function Initialize-ADSyncDiagnosticsPath
{
    param
    (
        [parameter(mandatory=$true)]
        $OutputPath
    )

    if (-not $(Test-Path $OutputPath))
    {
        try 
        {
            $resultFolder = mkdir -Path $OutputPath -ErrorAction Stop
            return $true
        }
        catch       
        {
            $resultMsg = "An error occurred while creating the folder $OutputPath for AADConnect Diagnostics: $($_.Exception.Message)"
            WriteEventLog($EventIdDiagnosticsReportFail)($EventMsgDiagnosticsReportFail -f $resultMsg)
            Write-Error $resultMsg
            return $false
        }
    }
    else
    {
        return $true
    }
}

Function Initialize-ADSyncDiagnosticsText
{
    $Global:ADSyncDiagsTextReport = $null

    $culture = New-Object System.Globalization.CultureInfo 'en-us'
    $dateLocal = $((Get-Date).DateTime).ToString($culture)
    $date = $((Get-Date).ToUniversalTime()).ToString($culture)
    $Global:ADSyncDiagsTextReport = "AAD Connect Diagnostics`r`n"
    $Global:ADSyncDiagsTextReport += "$date (UTC)`r`n"
    $Global:ADSyncDiagsTextReport += "$dateLocal (Local)`r`n"
    $Global:ADSyncDiagsTextReport += "`r`n`r`n`r`n"
}

Function Initialize-ADSyncDiagnosticsHtml
{
    $Global:ADSyncDiagsHtmlReport = $null   
    $Global:ADSyncDiagsHtmlReport = @"
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AAD Connect Diagnostics Report</title>
<style>
p{ line-height: 1em; }
h1, h2, h3, h4{
    color: DodgerBlue;
	font-weight: normal;
	line-height: 1.1em;
	margin: 0 0 .5em 0;
}
h1{ font-size: 1.7em; }
h2{ font-size: 1.5em; }
a{
	color: black;
	text-decoration: none;
}
	a:hover,
	a:active{ text-decoration: underline; }
body{
    font-family: arial; font-size: 80%; line-height: 1.2em; width: 100%; margin: 0; background: white;
}
</style>
</head><body>
"@
    $dateUTC = [string] "$((Get-Date).ToUniversalTime().DateTime) (UTC)"
    $dateLocal = [string] "$((Get-Date).DateTime) (Local)"
    $Global:ADSyncDiagsHtmlReport += "<H1>AAD Connect Diagnostics on $($env:computername)</H1>"
    $Global:ADSyncDiagsHtmlReport += "<p>$dateLocal</p>"
    $Global:ADSyncDiagsHtmlReport += "<p>$dateUTC </p>"
}

#-------------------------------------------------------------------------
#
# Helper function to extend content of AADConnect Diagnostics Report.
#
#-------------------------------------------------------------------------
Function Add-ADSyncDiagnosticsText
{
    param
    (
        [parameter(mandatory=$false)]
        $Title,
        [parameter(mandatory=$false)]
        $AppendObject
    )

    if ($Title -ne $null)
    {
        $Global:ADSyncDiagsTextReport += "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" 
        $Global:ADSyncDiagsTextReport += "`r`n"
        $Global:ADSyncDiagsTextReport += $Title
        $Global:ADSyncDiagsTextReport += "`r`n"
        $Global:ADSyncDiagsTextReport += "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        $Global:ADSyncDiagsTextReport += "`r`n"
    }
    
    if ($AppendObject -ne $null)
    {
        $Global:ADSyncDiagsTextReport += $AppendObject | Out-String
    }
}

Function Add-ADSyncDiagnosticsHtml
{
    param(
        [parameter(mandatory=$false)]
        $Title,
        [parameter(mandatory=$false)]
        $HeadingSize="H2",
        [parameter(mandatory=$false)]
        $AppendObject,
        [ValidateSet("List","Table","String")]
        $Format="Table"
    )
    
    if ($Title -ne $null)  
    {
        $Global:ADSyncDiagsHtmlReport += "<$HeadingSize>$Title</$HeadingSize>`r`n"
    }
    
    if ($AppendObject -ne "")
    {
        if ($Format -like "String")  
        {
            $Global:ADSyncDiagsHtmlReport += "<p>$AppendObject</p>`r`n"
        }
        else  
        {
            $Global:ADSyncDiagsHtmlReport += $AppendObject | ConvertTo-Html -Fragment -As $Format
        }
        $Global:ADSyncDiagsHtmlReport += "<p></p>`r`n"
    }
} 

#-------------------------------------------------------------------------
# 
# Helper function to export AADConnect Diagnostics Report into a file.
#
#-------------------------------------------------------------------------
Function Export-ADSyncDiagnosticsText
{
    param
    (
        [parameter(mandatory=$true)]
        $Title,
        [parameter(mandatory=$true)]
        $ReportDate,
        [parameter(mandatory=$true)]
        $OutputPath
    )

    $filename = "$OutputPath\$($ReportDate)_$Title.log"
    try 
    {
        $Global:ADSyncDiagsTextReport | Out-String | Out-File -FilePath $filename -ErrorAction Stop

        $resultMsg = "AAD Connect Diagnostics Text Report is available at: `n$filename `n" 
        $resultMsg | Write-Host -ForegroundColor Green
    }
    catch  
    {
        $resultMsg = "An error occurred while exporting AADConnect Diagnostics to $filename : $($_.Exception.Message)"
        WriteEventLog($EventIdDiagnosticsReportFail)($EventMsgDiagnosticsReportFail -f $resultMsg)
        Write-Error $resultMsg
    }

    return  $resultMsg
}

Function Export-ADSyncDiagnosticsHtml
{
    param
    (
        [parameter(mandatory=$true)]
        $Title,
        [parameter(mandatory=$true)]
        $ReportDate,
        [parameter(mandatory=$true)]
        $OutputPath
    )
    
    $filename = "$OutputPath\$($ReportDate)_$Title.html"
    
    if ($Global:ADSyncDiagsHtmlReport -ne $null)  
    {
        $Global:ADSyncDiagsHtmlReport += "</body></html>"        
        try 
        {
            $Global:ADSyncDiagsHtmlReport  | Out-String | Out-File -FilePath $filename -ErrorAction Stop
            $resultMsg = "AAD Connect Diagnostics HTML Report is available at: `n$filename `n" 
            $resultMsg | Write-Host -ForegroundColor Green

            "Opening the html report in Internet Explorer..." | Write-Host -fore White
            Write-Host "`r`n"
	
            try
            {
                #
                # Add 'Microsoft.VisualBasic' namespace into PowerShell session.
                #
                Add-Type -AssemblyName "Microsoft.VisualBasic"
        
                $internetExplorer = New-Object -com internetexplorer.application

                $internetExplorer.navigate2($filename)
                $internetExplorer.visible = $true

                if ($internetExplorer.Busy)
                {
                    Sleep -Seconds 15
                }

                $ieProcess = Get-Process | ? { $_.MainWindowHandle -eq $internetExplorer.HWND }

                #
                # Set focus to Internet Explorer so that it will appear on top of other windows.
                #
                [Microsoft.VisualBasic.Interaction]::AppActivate($ieProcess.Id)
            }
            catch
            {
                Write-Error "Unable to open Internet Explorer : $($_.Exception.Message)"
                Write-Host "`r`n"
            }
        }
        catch   
        {
             $resultMsg = "An error occurred while exporting AADConnect Diagnostics to $filename : $($_.Exception.Message)"
             WriteEventLog($EventIdDiagnosticsReportFail)($EventMsgDiagnosticsReportFail -f $resultMsg)
             Write-Error $resultMsg
        }
    }

    return $resultMsg
}

Function Compress-ADSyncDiagnostics
{
    param
    (
        [parameter(mandatory=$true)]
        $Title,
        [parameter(mandatory=$true)]
        $ReportDate,
        [parameter(mandatory=$true)]
        $SourcePath,
        [parameter(mandatory=$true)]
        $OutputPath
    )
    $filename = [string] "$OutputPath\$ReportDate" + "_ADSyncDiagnosticsReport.zip"
    $tempFolder = [string] "$env:temp\$ReportDate" + "_ADSyncDiagnosticsReport"

    # Copy all logs to %Temp% because current 'C:\ProgramData\AADConnect\trace-yyyymmdd-hhmmss.log' is being used by another process
    try  
    {
        Copy-Item $SourcePath $tempFolder -Recurse -ErrorAction Stop
    }
    catch   
    {
        $resultMsg = "Unable to compress AAD Connect Diagnostics information to $filename : $($_.Exception.Message)"
        WriteEventLog($EventIdDiagnosticsReportFail)($EventMsgDiagnosticsReportFail -f $resultMsg)
        Write-Error $resultMsg
        return $resultMsg
    }    

    # Compress AAD Connect Diagnostics folder
    try  
    {
        Add-Type -AssemblyName "System.io.Compression.Filesystem"
        [io.Compression.Zipfile]::CreateFromDirectory($tempFolder, $filename)
        
        $resultMsg = "AADConnect Diagnostics compressed data is available at: `n$filename `n" 
        $resultMsg | Write-Host -ForegroundColor Green
    }
    catch   
    {
        $resultMsg = "Unable to compress AAD Connect Diagnostics information to $filename : $($_.Exception.Message)"
        WriteEventLog($EventIdDiagnosticsReportFail)($EventMsgDiagnosticsReportFail -f $resultMsg)
        Write-Error $resultMsg
    }
    Remove-Item -Path $tempFolder -Recurse -Force
    return $resultMsg
}



#-------------------------------------------------------------------------
#
# Generates a report of AAD Connect Diagnostics including:
#   1- AAD Company Features / Tenant Configuration
#   2- AADConnect Global Settings
#   3- Per Connector Password Hash Sync Status
#   4- Sync Scheduler Settings and Latest Run
#
#-------------------------------------------------------------------------
Function Export-ADSyncDiagnosticsReport 
{
    param
    (
        [parameter(mandatory=$true)]
        $OutputPath 
    )

    $culture = New-Object System.Globalization.CultureInfo 'en-us'
    $reportDate = $(Get-Date -Format yyyyMMdd-HHmmss).ToString($culture)
    $reportFolder = [string] $reportDate + "_ADSyncDiagnosticsReport"
    
    if (-not (Initialize-ADSyncDiagnosticsPath $OutputPath))
    {
        return
    }

    if (-not (Initialize-ADSyncDiagnosticsPath $("$OutputPath\$reportFolder")))
    {
        return
    }

    WriteEventLog($EventIdDiagnosticsReportRun)($EventMsgDiagnosticsReportRun)
    Write-Host "Collecting AAD Connect Diagnostics Information..."
    Write-Host "`r`n"

    Initialize-ADSyncDiagnosticsText
    Initialize-ADSyncDiagnosticsHtml

    # Get Connectors
    $connectors     = Get-ADSyncConnector
    $aadConnectors  = $connectors | Where-Object {$_.SubType -eq "Windows Azure Active Directory (Microsoft)"}
    $adConnectors   = $connectors | Where-Object {$_.ConnectorTypeName -eq "AD"}

    if ($aadConnectors -ne $null -and $adConnectors -ne $null)
    {
        if ($aadConnectors.Count -eq 1)
        {
            # AAD Company Features / Tenant Configuration
            $aadFeatures = Get-ADSyncAADCompanyFeature
            $aadFeaturesPasswordHashSync = $aadFeatures.PasswordHashSync
            Add-ADSyncDiagnosticsText -Title "Azure AD Tenant - Settings" -AppendObject $($aadFeatures | fl)
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Tenant - Settings" -AppendObject $aadFeatures -Format List

            # AADConnect Global Settings
            $globalSettings = Get-ADSyncGlobalSettingsParameter | Select Name,Value | Sort Name
            $globalSettingsPasswordHashSync = [bool] ($globalSettings | Where-Object {$_.Name -eq "Microsoft.OptionalFeature.PasswordHashSync"}).Value
            
            $globalSettings | % { $globalSettingsHt = [ordered]@{} } { $globalSettingsHt[$_.Name] = $_.Value } # Convert to Hashtable
            $globalSettingsObj =  New-Object PSObject -Property $($globalSettingsHt) # Convert to PSObject
            Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Global Settings" -AppendObject $($globalSettingsObj | fl)
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Global Settings" -AppendObject $globalSettingsObj -Format List

            # Sync Scheduler Settings
            Add-ADSyncDiagnosticsText -Title "Azure AD Connect Sync Scheduler - Settings"
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect Sync Scheduler - Settings"

            $syncSchedulerConfig = Get-ADSyncScheduler
            Add-ADSyncDiagnosticsText -AppendObject $($syncSchedulerConfig | fl)
            Add-ADSyncDiagnosticsHtml -AppendObject $syncSchedulerConfig -Format List

            # Sync Scheduler Last Run
            Add-ADSyncDiagnosticsText -Title "Azure AD Connect Sync Scheduler - Last Run"
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect Sync Scheduler - Last Run"

            $syncSchedulerLastRunObj = New-Object PSObject -Property @{
                TimeGenerated   = "N/A"
                MachineName     = "N/A"
                EventID         = "N/A"
                EntryType       = "N/A"
                Source          = "N/A"
                Message         = "N/A"
            }

            $syncSchedulerEvents = Get-EventLog -LogName Application -Source "Directory Synchronization" -InstanceId 904 -After (Get-Date).AddHours(-3) -ErrorAction SilentlyContinue |
                                   where  {$_.Message -like "Scheduler::SchedulerThreadMain : Started*"} |
                                   select TimeGenerated, MachineName, EventID, EntryType, Source, Message -First 1

            if ($syncSchedulerEvents -ne $null)
            {
                $syncSchedulerLastRunObj = $syncSchedulerEvents
            }
            Add-ADSyncDiagnosticsText -AppendObject $($syncSchedulerLastRunObj | fl)
            Add-ADSyncDiagnosticsHtml -AppendObject $syncSchedulerLastRunObj -Format List


            # AAD Connect Connectors List
            Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Connectors"
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Connectors"
            $aadcConnectors = $connectors | Select Name,Type,Identifier,Version,CreationTime,LastModificationTime
            Add-ADSyncDiagnosticsText -AppendObject $($aadcConnectors | fl)
            Add-ADSyncDiagnosticsHtml -AppendObject $aadcConnectors -Format List

            # Azure AD Connect - Connector Statistics
            if (Get-Command Get-ADSyncConnectorStatistics -ErrorAction SilentlyContinue)  
            {
                Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Connector Statistics"
                Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Connector Statistics"
            
                # Get Connector Statistics using cmdlet Get-ADSyncConnectorStatistics
                $connectors | %{
                    $connectorStats = Get-ADSyncConnectorStatistics -ConnectorName $_.Name | select *
                    Add-ADSyncDiagnosticsText -AppendObject $($_.Name)
                    Add-ADSyncDiagnosticsText -AppendObject $($connectorStats | fl)
                    Add-ADSyncDiagnosticsHtml -Title $($_.Name) -HeadingSize "H3" -AppendObject $connectorStats -Format List 
                }
            }

            # AAD Connectivity Parameters
            Add-ADSyncDiagnosticsText -Title "Azure AD Connect - AAD Connector Account"
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - AAD Connector Account"
            $aadConnectivity = $aadConnectors.ConnectivityParameters | Where-Object {$_.Name -like "UserName"}
            $aadConnectivityStr = "Azure AD Synchronization Service Account: $($aadConnectivity.Value)"        
            Add-ADSyncDiagnosticsText -AppendObject $aadConnectivityStr
            Add-ADSyncDiagnosticsHtml -AppendObject $aadConnectivityStr -Format String

            # AD Connectivity Parameters
            Add-ADSyncDiagnosticsText -Title "Azure AD Connect - AD Connector Account(s)"
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - AD Connector Account(s)"
            $adConnectivity = $ADConnectors.ConnectivityParameters | Where-Object {$_.Name -like "forest-login*" -or $_.Name -eq "forest-name"} | select Name,Value
            Add-ADSyncDiagnosticsText -AppendObject $adConnectivity
            Add-ADSyncDiagnosticsHtml -AppendObject $adConnectivity -Format Table

            # AAD Connect Service 
            Add-ADSyncDiagnosticsText -Title "Azure AD Connect - ADSync Service"
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - ADSync Service"
            $adSyncService = Get-WmiObject win32_service | Where-Object {$_.Name -eq 'ADSync'} | Select DisplayName,Name,ProcessId,StartName,StartMode,State,Status,SystemName,PathName
            Add-ADSyncDiagnosticsText -AppendObject $($adSyncService | fl)
            Add-ADSyncDiagnosticsHtml -AppendObject $adSyncService -Format List
            
            # Password Hash Sync Status - Per AD Connector
            Add-ADSyncDiagnosticsText -Title "AD Connector Password Hash Sync - Status"
            Add-ADSyncDiagnosticsHtml -Title "AD Connector Password Hash Sync - Status"
            foreach ($adConnector in $adConnectors)
            {
                $adPasswordSyncConfig = Get-ADSyncAADPasswordSyncConfiguration -SourceConnector $adConnector.Name

                # Password Hash Sync Heartbeat Check (Ping Event)
                $pingEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 654 -After (Get-Date).AddHours(-3) -ErrorAction SilentlyContinue | 
                              Where-Object { $_.Message.ToUpperInvariant().Contains($adConnector.Identifier.ToString("D").ToUpperInvariant()) } | 
                              Sort-Object  { $_.TimeWritten } -Descending

                $lastHeartbeatTime = $null

                if ($pingEvents -ne $null)
                {
                    $lastHeartbeatTime = $($pingEvents[0].TimeGenerated)
                }
                else
                {
                    $lastHeartbeatTime = "N/A"
                }

                $pwdSyncStateObj = New-Object PSObject -Property @{
                    SourceConnector     = $($adPasswordSyncConfig.SourceConnector)
                    TargetConnector     = $($adPasswordSyncConfig.TargetConnector)
                    Enabled             = $($adPasswordSyncConfig.Enabled)
                    LatestHeartBeatTime = $lastHeartbeatTime
                } | select SourceConnector, TargetConnector, Enabled, LatestHeartBeatTime

                Add-ADSyncDiagnosticsText -AppendObject $($pwdSyncStateObj | fl)
                Add-ADSyncDiagnosticsHtml -AppendObject $pwdSyncStateObj -Format List
            }


            # Azure AD Connect Password Writeback - Status
            $aadPasswordResetConfig = Get-ADSyncAADPasswordResetConfiguration -Connector $aadConnectors[0].Name
            Add-ADSyncDiagnosticsText -Title "Azure AD Connect Password Writeback - Status" -AppendObject $($pwdSyncStateObj | fl)
            Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect Password Writeback - Status" -AppendObject $pwdSyncStateObj -Format List
        }
        else
        {
            Write-Warning "More than one Azure AD connectors are found."
            return
        }

        # Azure AD Connect - Local Database Parameters
        $adSyncParameters = Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ADSync\Parameters | 
            Select Server,SQLInstance,DBName,Path
        Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Local Database Parameters" -AppendObject $($adSyncParameters | fl)
        Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Local Database Parameters" -AppendObject $adSyncParameters -Format List 
            
        if($adSyncParameters.Server -eq "(localdb)")
        {
            # Azure AD Connect - Local Database size
                
            if (Test-Path ("$($adSyncParameters.Path)Data"))   
            {
                $adSyncDatabaseSize = 0
                $adSyncDatabase = Get-ChildItem -Path "$($adSyncParameters.Path)Data" 
                $adSyncDatabaseSize = ($adSyncDatabase | where Name -eq "ADSync.mdf").Length/1MB
                Add-ADSyncDiagnosticsText -AppendObject "Database size: $("{0:N2}" -f $adSyncDatabaseSize)MB"
                Add-ADSyncDiagnosticsHtml -AppendObject "Database size: $("{0:N2}" -f $adSyncDatabaseSize)MB" -Format String

                if ($adSyncDatabaseSize -gt 7168)  
                {
                    $adSyncDatabasWarning = "WARNING: AAD Connect Database is reaching maximum limit size (10GB) | ADSync.mdf =  $("{0:N2}" -f $adSyncDatabaseSize)MB `n"
                    Add-ADSyncDiagnosticsText -Title $adSyncDatabasWarning
                    Add-ADSyncDiagnosticsHtml -Title $adSyncDatabasWarning -HeadingSize "b"
                }      
            }
            else  
            {
                $adSyncDatabaseError = @("ERROR: Could not find Local Database folder.")
                Add-ADSyncDiagnosticsText -Title $adSyncDatabaseError
                Add-ADSyncDiagnosticsHtml -Title $adSyncDatabaseError -HeadingSize "b"
            }
          
        }

        # Azure AD Connect - Windows Server Configuration      
        $adSyncOS = Get-ADSyncDiagsServerOS
        Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Windows Server Configuration" -AppendObject $($adSyncOS | fl)
        Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Windows Server Configuration" -AppendObject $adSyncOS -Format List 
    
        # Azure AD Connect - Proxy Settings
        $adSyncSrvProxyIE = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
        Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Proxy Settings" -AppendObject ($adSyncSrvProxyIE |fl)
        Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Proxy Settings" -AppendObject $adSyncSrvProxyIE -Format List 
        
        # Azure AD Connect - Netsh Winhttp Settings
        $adSyncSrvNetsh = netsh winhttp show proxy | Out-String
        Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Netsh Winhttp Settings" -AppendObject ($adSyncSrvNetsh)
        Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Netsh Winhttp Settings" -AppendObject $adSyncSrvNetsh -Format String

        # Azure AD Connect - .Net Framework Installed
        $adSyncSrvDotNet = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\" |
            Select-Object -Property Release,Version,InstallPath,TargetVersion
        Add-ADSyncDiagnosticsText -Title "Azure AD Connect - .Net Framework Installed" -AppendObject ($adSyncSrvDotNet |fl)
        Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - .Net Framework Installed" -AppendObject $adSyncSrvDotNet -Format List 

        # Azure AD Connect - Current User WhoAmI
        $adSyncSrvWhoAmI = whoami /all
        Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Current User WhoAmI" -AppendObject $adSyncSrvWhoAmI
        
        # Azure AD Connect - Programs Installed
        $adSyncSrvApplications = Get-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property `
            @{Label="Name"; Expression={if ($_.DisplayName -like "") {$_.PSChildName} else {$_.DisplayName}}}, `
            DisplayVersion, Publisher, `
            @{Label="InstallDate"; Expression={
                if ($_.InstallDate -like "") {$_.InstallDate} else {$date = [int] $_.InstallDate; $date.ToString("0000-00-00")}
            }} | sort Name
        Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Programs Installed" -AppendObject ($adSyncSrvApplications | ft -AutoSize)
        Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Programs Installed" -AppendObject $adSyncSrvApplications -Format Table 
        
        # Azure AD Connect - Windows Updates
        $adSyncHotfixes = Get-Hotfix | Select HotFixID,InstalledOn,Description,InstalledBy  | Sort-Object –Descending –Property InstalledOn 
        Add-ADSyncDiagnosticsText -Title "Azure AD Connect - Windows Updates" -AppendObject $adSyncHotfixes
        Add-ADSyncDiagnosticsHtml -Title "Azure AD Connect - Windows Updates" -AppendObject $adSyncHotfixes -Format Table 

        # Export Azure AD Connect - Current User WhoAmI
        $adSyncSrvWhoAmI | Out-File $([string] "$OutputPath\$reportFolder\$reportDate" + "_AADConnect-WhoAmI.txt")

        # Export AAD Connect Full Configuration - Useful when used with AADConnectConfigDocumenter
        Get-ADSyncServerConfiguration -Path $([string] "$OutputPath\$reportFolder\$reportDate" + "_AADConnect-ServerConfig")

        # Azure AD Connect - Export Windows Event Logs
        $after = (Get-Date).AddDays(-7).ToString("yyyy-MM-d")
        $query = "/q:*[System[TimeCreated[@SystemTime>='$($after)T00:00:00.000Z']]]"
        $filename = [string] "$OutputPath\$reportFolder\$reportDate" + "_AADConnect-EvtLogsApplication.evtx"
        wevtutil epl Application $filename $query "/ow:true"
        $filename = [string] "$OutputPath\$reportFolder\$reportDate" + "_AADConnect-EvtLogsSystem.evtx"
        wevtutil epl System $filename $query "/ow:true"

        # Phase 1/2 - Exporting AAD Connect Diagnostics Information
        Write-Host "Exporting AAD Connect Diagnostics Information..."
        Write-Host "`r`n"

        $resultTextReport = Export-ADSyncDiagnosticsText -Title "AADConnect_Report" -ReportDate $reportDate -OutputPath $OutputPath
        $resultHtmlReport = Export-ADSyncDiagnosticsHtml -Title "AADConnect_Report" -ReportDate $reportDate -OutputPath $("$OutputPath\$reportFolder")

        # Phase 2/2 - Compress AAD Connect Diagnostics Information
        if ($OutputPath -eq $("$env:ALLUSERSPROFILE\AADConnect"))
        {
            # Compress all information in ProgramData\AADConnect
            Write-Host "Compressing AAD Connect Diagnostics Information..."
            $resultCompressData = Compress-ADSyncDiagnostics -Title "AADConnect_Report" -ReportDate $reportDate -SourcePath $("$env:ALLUSERSPROFILE\AADConnect") -OutputPath "$env:USERPROFILE\Documents"
        }

        $EventMsgDiagnosticsReportResults = [string] $resultTextReport + "`r`n" + $resultHtmlReport + "`r`n" + $resultCompressData
        WriteEventLog($EventIdDiagnosticsReportEnd)($EventMsgDiagnosticsReportEnd -f $EventMsgDiagnosticsReportResults)
        return
    }

    if ($aadConnectors -eq $null)
    {
        Write-Warning "No AAD connectors are found."
    }

    if ($adConnectors -eq $null)
    {
        Write-Warning "No AD connectors are found."
    }
}

# SIG # Begin signature block
# MIIjngYJKoZIhvcNAQcCoIIjjzCCI4sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC+eh2w1hOrwMOB
# 7C+285Y9wUiToYryWbixrm9aWdiRBqCCDY0wggYLMIID86ADAgECAhMzAAABk0OF
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
# CQQxIgQgaZ06FCqDD6wY2mTFca9JMQIjC9/mhiiyvxO/8183YPswQgYKKwYBBAGC
# NwIBDDE0MDKgFIASAE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbTANBgkqhkiG9w0BAQEFAASCAQB93v78007z7ZOBTErP9W1GnRN5
# FsrR0SAs/3wTJL+J8EraRsDhkfAHp1IgMLIPp36G24h4nB0PC8Lp6RE80i5nLlJ4
# AzluiKTEjOQJjQ7MrfX7u1/xwlEXTklfYoNXhkFc6hNtdRq4b8CdsTH1sb8Tl+4X
# jMv5uwExZzmk/KbEP02LLSirWLmtyUdRuW1c6qym0ei1MRwg1nyXV9nrCr98r+P7
# qMo9svyEpw+qL6pKg+HJ7C85C02h2jol9dfSadsi0RjTeOWeSoUS2KTrtNGz4old
# FyBjUj5zAle5AtH57cSasxV5M9e3nv3Z5CCtzwfW5w/hiJJ8pE/+boezF6+LoYIS
# 8TCCEu0GCisGAQQBgjcDAwExghLdMIIS2QYJKoZIhvcNAQcCoIISyjCCEsYCAQMx
# DzANBglghkgBZQMEAgEFADCCAVUGCyqGSIb3DQEJEAEEoIIBRASCAUAwggE8AgEB
# BgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEICdqW++lfV0kP6XDx+JINU7s
# M/ErScdhg7pFqetkEfbOAgZfFz76HU0YEzIwMjAwNzI1MDcyNTQ1LjI3MlowBIAC
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
# BDAvBgkqhkiG9w0BCQQxIgQgpSnQu65LZ4WhvMDtkTqnP3bUsSbo1a8E3OMwqzvj
# hyUwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCBDmDWEWvc6fhs5t4Woo5Q+
# FMFCcaIgV4yUP4CpuBmLmTCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAABKugXlviGp++jAAAAAAEqMCIEIHGx3wq0UYdFmz7AJYhSc4i+
# 0VoLSAQNxLjlwxfI8y3JMA0GCSqGSIb3DQEBCwUABIIBAAYCkYSF0081GhSHk8A8
# MhAiVg5YPXcE2os4fkKGocBovjtNjY0c8GDrj2cQVDi+rPg8CQF2N3nNA1mc+t7v
# fQEyUpRJxj0dFV5mlIqoFn8d9XoOdqfWgVL9bbEQioWubGC9HQ5QybKLAMfkZprM
# U4GUvCHmNnaG6VDP8N/bC//bbTJT6hnN2qCMUIIkvTCSRMq4HVOy/aUbYLbhYf6g
# dEHhHSq2z93VsiuL+0bzcDXSyFoYMM/iyaOj7DVUpO6W9U1K03/vhAXxtgaxjIdC
# 3tt3iUEtDsB4BFJpZA040OMPx03TMK/Rpz7ECXzuCkmwkxDGO+I1w4De02xrHciZ
# 1cY=
# SIG # End signature block
