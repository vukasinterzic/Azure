#PowerShell wrapper script for WinGet

#List of apps that will be installed like this:
    #silently
    #scope: all users
    #preferabbly from msstore

$apps = @(
    @{name = "Microsoft.PowerShell"}                            #MicrosoftPowerShell
    @{name = "Microsoft.AzureCLI" }                             #Azure CLI
    @{name = "Microsoft.Azure.AZCopy.10"}                       #AZCopy
    @{name = "bicep"; }                                         #Azure Bicep
    @{name = "WiresharkFoundation.Wireshark"}                   #WireShark
    @{name = "Hashicorp.Terraform" }                            #Terraform
    @{name = "JanDeDobbeleer.OhMyPosh"}                         #OhMyPosh
    @{name = "Microsoft.Azure.StorageExplorer"}                 #Azure Storage Explorer
    @{name = "Google.Chrome"}                                   #Chrome
    @{name = "GitHub.GitHubDesktop"}                            #GitHub Desktop
    @{name = "Microsoft.OneDrive"}                              #OneDrive
    @{name = "XP9KHM4BK9FZ7Q"; source = "msstore" }             #Visual Studio Code
    @{name = "9N0DX20HK701"; source = "msstore" }               #Windows Terminal
    @{name = "9P7KNL5RWT25"; source = "msstore" }               #Sysinternals Suite
    @{name = "9NP355QT2SQB"; source = "msstore" }               #Azure VPN Client
    @{name = "XPFNZKSKLBP7RJ"; source = "msstore" }             #PuTTY
    @{name = "XPDNKVCX4QD2DC"; source = "msstore" }             #7-zip
    @{name = "XP9M26RSCLNT88"; source = "msstore" }             #TreeSize
    @{name = "XPDP273C0XHQH2"; source = "msstore" }             #Adobe Acrobat Reader DC
)

#Check if WinGet is installed:

$WingetInstalled = Get-AppxPackage -Name 'Microsoft.Winget.Source' | Select-Object Name, Version
$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$errorlog = winget_error.log

if (!$WingetInstalled) {
    Write-Host -ForegroundColor Red "WinGet is not installed! End of script"
    #Winget can be installed if missing
    break
}

Write-Host -ForegroundColor Cyan "Installing new Apps..."
    Foreach ($app in $apps) {
        $listApp = winget list --exact -q $app.name
        if (![String]::Join("", $listApp).Contains($app.name)) {
            Write-Host -ForegroundColor Yellow  "Install:" $app.name
            # MS Store apps
            if ($app.source -ne $null) {
                winget install --exact --silent --accept-package-agreements --accept-source-agreements $app.name --source $app.source
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $app.name "successfully installed."
                }
                else {
                    $app.name + " couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
                    Write-Host
                    Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                    Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
                    Write-Host
                    Pause
                }    
            }
            # All other Apps
            else {
                winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $app.name "successfully installed."
                }
                else {
                    $app.name + " couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
                    Write-Host
                    Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                    Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
                    Write-Host
                    Pause
                }  
            }
        }
        else {
            Write-Host -ForegroundColor Yellow "Skip installation of" $app.name
        }
    }

# Get RSAT items that are not currently installed:
$install = Get-WindowsCapability -Online |
Where-Object {$_.Name -like "RSAT*" -AND $_.State -eq "NotPresent"}

# Install the RSAT items that meet the filter:
Write-Host -ForegroundColor Cyan "Installing RSAT tools..."
foreach ($item in $install) {
try {
  Add-WindowsCapability -Online -Name $item.name
}
catch [System.Exception] {
  Write-Warning -Message $_.Exception.Message
}
}
