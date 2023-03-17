Function Manage-AzureRoleAssignment {
    [CmdletBinding()]
    param (
    [Parameter(Mandatory=$true)]
    [ValidateSet('Get', 'Set')]
    [string]$Action,
    [string]$Scope,
    [string]$Role,
    [string]$UserOrServicePrincipal,
    [ValidateSet('User', 'ServicePrincipal')]
    [string]$PrincipalType
    )

    # Ensure that required parameters are provided
    if ($Action -eq 'Set' -and (-not $Scope -or -not $Role -or -not $UserOrServicePrincipal -or -not $PrincipalType)) {
        Write-Error "For action 'Set', parameters Scope, Role, UserOrServicePrincipal, and PrincipalType are required."
        return
    }

    # Authenticate with Azure
    try {
        $context = Get-AzContext
        if (-not $context) {
            Connect-AzAccount
        }
    }
    catch {
        Write-Error "Failed to authenticate with Azure. Please ensure you have the Az module installed and are signed in."
        return
    }

    switch ($Action) {
        'Get' {
            if ($Scope) {
                Get-AzRoleAssignment -Scope $Scope
            }
            elseif ($UserOrServicePrincipal) {
                if ($PrincipalType -eq 'User') {
                    $principal = Get-AzADUser -SearchString $UserOrServicePrincipal
                }
                elseif ($PrincipalType -eq 'ServicePrincipal') {
                    $principal = Get-AzADServicePrincipal -SearchString $UserOrServicePrincipal
                }

                if ($principal) {
                    Get-AzRoleAssignment -ObjectId $principal.Id
                }
                else {
                    Write-Error "User or Service Principal not found."
                }
            }
            else {
                Write-Error "Please provide either a Scope or a UserOrServicePrincipal for action 'Get'."
            }
        }
        'Set' {
            if ($PrincipalType -eq 'User') {
                $principal = Get-AzADUser -SearchString $UserOrServicePrincipal
            }
            elseif ($PrincipalType -eq 'ServicePrincipal') {
                $principal = Get-AzADServicePrincipal -SearchString $UserOrServicePrincipal
            }

            if ($principal) {
                try {
                    New-AzRoleAssignment -ObjectId $principal.Id -RoleDefinitionName $Role -Scope $Scope
                    Write-Host "Role assignment created successfully."
                }
                catch {
                    Write-Error "Failed to create role assignment."
                }
            }
            else {
                Write-Error "User or Service Principal not found."
            }
        }
    }

}
