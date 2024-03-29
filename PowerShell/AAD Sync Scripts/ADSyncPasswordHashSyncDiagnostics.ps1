#-------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation.  All rights reserved.
#-------------------------------------------------------------------------

#
# Event IDs
#
Set-Variable EventIdPwdSyncTroubleshootingRun               2001 -Option Constant -Scope script
Set-Variable EventIdSingleObjectDiagnosticsRun              2002 -Option Constant -Scope script
Set-Variable EventIdStagingModeEnabled                      2003 -option Constant -Scope script
Set-Variable EventIdConnectorNoHeartBeat                    2004 -Option Constant -Scope script
Set-variable EventIdDomainIsNotReachable                    2005 -Option Constant -Scope script
Set-Variable EventIdPwdSyncLocalConfigDisabled              2006 -Option Constant -Scope script
Set-Variable EventIdPwdSyncLocalAndCloudConfigDifferent     2007 -Option Constant -Scope script
Set-Variable EventIdConnectorAccountPwdSyncPermissionFailed 2008 -Option Constant -Scope script
Set-Variable EventIdPwdSyncLocalEnabledAndCloudDisabled     2010 -Option Constant -Scope script
Set-Variable EventIdPwdSyncLocalDisabledAndCloudEnabled     2011 -Option Constant -Scope script
Set-Variable EventIdPwdSyncCloudConfigNull                  2012 -Option Constant -Scope script

Set-Variable EventIdPersistentDomainFailure                 2013 -Option Constant -Scope script
Set-Variable EventIdTemporaryDomainFailure                  2014 -Option Constant -Scope script
Set-Variable EventIdCannotResolveDomainController           2015 -Option Constant -Scope script
Set-Variable EventIdCannotLocateDomainController            2016 -Option Constant -Scope script
Set-Variable EventIdCannotBindToDomainController            2017 -Option Constant -Scope script
Set-Variable EventIdPersistentRPCError                      2018 -Option Constant -Scope script
Set-Variable EventIdTemporaryRPCError                       2019 -Option Constant -Scope script
Set-Variable EventIdPersistentLDAPConnectionError           2020 -Option Constant -Scope script
Set-Variable EventIdTemporaryLDAPConnectionError            2021 -Option Constant -Scope script
Set-Variable EventIdPasswordSyncCryptographicException      2022 -Option Constant -Scope script
Set-Variable EventIdPasswordSyncInternalError               2023 -Option Constant -Scope script

# Password Hash Sync Batch AWS API Call Failures - Event IDs
Set-Variable EventIdPwdSyncBatchAWSFailure                                           2024 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailurePwdSyncCloudConfigNotActivated             2025 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureIdentitySyncCloudConfigNotActivated        2026 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureAADAccessDenied                            2027 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureEndpointNotFoundException                  2028 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureSecurityNegotiationException               2029 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureAdalServiceException                       2030 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureAdalServiceExUserRealmDiscoveryFailed      2031 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureAdalServiceExAccountMustBeAddedToTenant    2032 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureAdalServiceExOldPasswordUsed               2033 -Option Constant -Scope script   
Set-Variable EventIdPwdSyncBatchAWSFailureAdalServiceExAccountDisabled               2034 -Option Constant -Scope script
Set-Variable EventIdPwdSyncBatchAWSFailureAdalServiceExInvalidUsernameOrPwd          2035 -Option Constant -Scope script  
Set-Variable EventIdPwdSyncBatchAWSFailureAdalServiceExTenantNotFound                2036 -Option Constant -Scope script

# Password Hash Sync Ping AWS API Call Failures - Event IDs
Set-Variable EventIdPwdSyncPingAWSFailure                                            2037 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailurePwdSyncCloudConfigNotActivated              2038 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureIdentitySyncCloudConfigNotActivated         2039 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureAADAccessDenied                             2040 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureEndpointNotFoundException                   2041 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureSecurityNegotiationException                2042 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureAdalServiceException                        2043 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureAdalServiceExUserRealmDiscoveryFailed       2044 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureAdalServiceExAccountMustBeAddedToTenant     2045 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureAdalServiceExOldPasswordUsed                2046 -Option Constant -Scope script   
Set-Variable EventIdPwdSyncPingAWSFailureAdalServiceExAccountDisabled                2047 -Option Constant -Scope script
Set-Variable EventIdPwdSyncPingAWSFailureAdalServiceExInvalidUsernameOrPwd           2048 -Option Constant -Scope script  
Set-Variable EventIdPwdSyncPingAWSFailureAdalServiceExTenantNotFound                 2049 -Option Constant -Scope script

Set-Variable EventIdRestartPwdSyncChannelSuccess                                     2050 -Option Constant -Scope script
Set-Variable EventIdRestartPwdSyncChannelFailure                                     2051 -Option Constant -Scope script
Set-Variable EventIdPwdSyncActivityWithoutHeartbeat                                  2052 -Option Constant -Scope script

# Password Hash Sync Health Task Failure - Event IDs
Set-Variable EventIdPersistentHealthTaskFailure                                      2053 -Option Constant -Scope script
Set-Variable EventIdTemporaryHealthTaskFailure                                       2054 -Option Constant -Scope script

Set-Variable EventIdConnectorPwdSyncStopped                                          2055 -Option Constant -Scope script

Set-Variable EventIdIsPwdSyncGeneralDiagnosticsHelpful                               2056 -Option Constant -Scope script

Set-Variable EventIdSingleObjectConnectorDisabled             2201 -Option Constant -Scope script
Set-Variable EventIdSingleObjectDisconnector                  2202 -Option Constant -Scope script
Set-Variable EventIdSingleObjectNotSyncedToAADCS              2203 -Option Constant -Scope script
Set-Variable EventIdSingleObjectNoADPwdSyncRule               2204 -Option Constant -Scope script
Set-Variable EventIdSingleObjectNoAADPwdSyncRule              2205 -Option Constant -Scope script
Set-Variable EventIdSingleObjectNoPwdHistory                  2206 -Option Constant -Scope script
Set-Variable EventIdSingleObjectFilteredByTarget              2207 -Option Constant -Scope script
Set-Variable EventIdSingleObjectNotExported                   2208 -Option Constant -Scope script
Set-Variable EventIdSingleObjectNoTargetConnection            2209 -Option Constant -Scope script
Set-Variable EventIdSingleObjectSuccess                       2210 -Option Constant -Scope script
Set-Variable EventIdSingleObjectOtherFailure                  2211 -Option Constant -Scope script
Set-Variable EventIdIsPwdSyncSingleObjectDiagnosticsHelpful   2212 -Option Constant -Scope script

#
# Event Messages
#
Set-Variable EventMsgPwdSyncTroubleshootingRun                "Workflow has been run."                                                                                               -Option Constant -Scope script
Set-Variable EventMsgSingleObjectDiagnosticsRun               "Single object diagnostics has been run."                                                                              -Option Constant -Scope script
Set-Variable EventMsgStagingModeEnabled                       "Staging Mode is enabled."                                                                                             -Option Constant -Scope script
Set-Variable EventMsgConnectorNoHeartBeat                     "No Password Hash Synchronization heartbeat is detected for AD Connector - {0}."                                       -Option Constant -Scope script
Set-Variable EventMsgDomainIsNotReachable                     "Domain {0} is not reachable."                                                                                         -Option Constant -Scope script
Set-Variable EventMsgPwdSyncLocalConfigDisabled               "All AD Connectors are disabled."                                                                                      -Option Constant -Scope script
Set-Variable EventMsgPwdSyncLocalAndCloudConfigDifferent      "Local and cloud configurations are different. Local Enabled - {0}, Cloud Enabled - {1}."                              -Option Constant -Scope script
Set-Variable EventMsgConnectorAccountPwdSyncPermissionFailed  "AD Connector account does not have required permission for password hash synchronization. Domain - {0}."              -Option Constant -Scope script
Set-Variable EventMsgRestartPwdSyncChannelSuccess             "Password Hash Synchronization is successfully restarted for AD Connector - {0}."                                      -Option Constant -Scope script
Set-Variable EventMsgRestartPwdSyncChannelFailure             "Password Hash Synchronization could NOT be restarted for AD Connector - {0}."                                         -Option Constant -Scope script
Set-Variable EventMsgConnectorPwdSyncStopped                  "Password Hash Synchronization is NOT running for AD Connector - {0}."                                                 -Option Constant -Scope script
Set-Variable EventMsgPwdSyncActivityWithoutHeartbeat          "There is password hash synchronization activity but NO heartbeat for AD Connector - {0}."                             -Option Constant -Scope script

Set-Variable EventMsgPersistentDomainFailure                  "Password hash synchronization agent is continuously getting domain failures. Domain - {0}"                            -Option Constant -Scope script
Set-Variable EventMsgTemporaryDomainFailure                   "Password hash synchronization agent had domain failure. Domain - {0}"                                                 -Option Constant -Scope script
Set-Variable EventMsgCannotResolveDomainController            "Password hash synchronization agent could not resolve a domain controller. Domain - {0}"                              -Option Constant -Scope script
Set-Variable EventMsgCannotLocateDomainController             "Password hash synchronization agent could not locate a domain controller. Domain - {0}"                               -Option Constant -Scope script
Set-Variable EventMsgCannotBindToDomainController             "Password hash synchronization agent could not bind to a domain controller. Domain - {0}"                              -Option Constant -Scope script
Set-Variable EventMsgPersistentRPCError                       "Password hash synchronization agent is continuously getting RPC errors. Domain - {0}"                                 -Option Constant -Scope script
Set-Variable EventMsgTemporaryRPCError                        "Password hash synchronization agent had RPC error. Domain - {0}"                                                      -Option Constant -Scope script
Set-Variable EventMsgPersistentLDAPConnectionError            "Password hash synchronization agent is continuously getting LDAP connection errors. Domain - {0}"                     -Option Constant -Scope script
Set-Variable EventMsgTemporaryLDAPConnectionError             "Password hash synchronization agent had LDAP connection error. Domain - {0}"                                          -Option Constant -Scope script
Set-Variable EventMsgPasswordSyncCryptographicException       "Password hash synchronization agent had System.Security.Cryptography.CryptographicException. Domain - {0}"            -Option Constant -Scope script
Set-Variable EventMsgPasswordSyncInternalError                "Password hash synchronization agent had internal error. Domain - {0}"                                                 -Option Constant -Scope script

Set-Variable EventMsgPwdSyncBatchAWSFailure                                           "Password Hash Sync Batch AWS API Call Failure."                                                                            -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailurePwdSyncCloudConfigNotActivated             "Password Hash Sync Batch AWS API Call Failure - Password hash sync cloud configuration is NOT activated."                  -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureIdentitySyncCloudConfigNotActivated        "Password Hash Sync Batch AWS API Call Failure - Identity sync cloud configuration is NOT activated."                       -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureAADAccessDenied                            "Password Hash Sync Batch AWS API Call Failure - Access to Azure Active Directory has been denied."                         -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureEndpointNotFoundException                  "Password Hash Sync Batch AWS API Call Failure - System.ServiceModel.EndpointNotFoundException."                            -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureSecurityNegotiationException               "Password Hash Sync Batch AWS API Call Failure - System.ServiceModel.Security.SecurityNegotiationException."                -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureAdalServiceException                       "Password Hash Sync Batch AWS API Call Failure - Microsoft.IdentityModel.Clients.ActiveDirectory.AdalServiceException."     -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureAdalServiceExUserRealmDiscoveryFailed      "Password Hash Sync Batch AWS API Call Failure - User realm discovery failed (AdalServiceException)."                       -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureAdalServiceExAccountMustBeAddedToTenant    "Password Hash Sync Batch AWS API Call Failure - Account must be added to the AAD tenant (AdalServiceException)."           -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureAdalServiceExOldPasswordUsed               "Password Hash Sync Batch AWS API Call Failure - Old password is used for authentication (AdalServiceException)."           -Option Constant -Scope script   
Set-Variable EventMsgPwdSyncBatchAWSFailureAdalServiceExAccountDisabled               "Password Hash Sync Batch AWS API Call Failure - User account is disabled (AdalServiceException)."                          -Option Constant -Scope script
Set-Variable EventMsgPwdSyncBatchAWSFailureAdalServiceExInvalidUsernameOrPwd          "Password Hash Sync Batch AWS API Call Failure - Invalid username or password (AdalServiceException)."                      -Option Constant -Scope script  
Set-Variable EventMsgPwdSyncBatchAWSFailureAdalServiceExTenantNotFound                "Password Hash Sync Batch AWS API Call Failure - Tenant not found (AdalServiceException)."                                  -Option Constant -Scope script

Set-Variable EventMsgPwdSyncPingAWSFailure                                            "Password Hash Sync Ping AWS API Call Failure."                                                                             -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailurePwdSyncCloudConfigNotActivated              "Password Hash Sync Ping AWS API Call Failure - Password hash sync cloud configuration is NOT activated."                   -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureIdentitySyncCloudConfigNotActivated         "Password Hash Sync Ping AWS API Call Failure - Identity sync cloud configuration is NOT activated."                        -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureAADAccessDenied                             "Password Hash Sync Ping AWS API Call Failure - Access to Azure Active Directory has been denied."                          -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureEndpointNotFoundException                   "Password Hash Sync Ping AWS API Call Failure - System.ServiceModel.EndpointNotFoundException."                             -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureSecurityNegotiationException                "Password Hash Sync Ping AWS API Call Failure - System.ServiceModel.Security.SecurityNegotiationException."                 -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureAdalServiceException                        "Password Hash Sync Ping AWS API Call Failure - Microsoft.IdentityModel.Clients.ActiveDirectory.AdalServiceException."      -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureAdalServiceExUserRealmDiscoveryFailed       "Password Hash Sync Ping AWS API Call Failure - User realm discovery failed (AdalServiceException)."                        -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureAdalServiceExAccountMustBeAddedToTenant     "Password Hash Sync Ping AWS API Call Failure - Account must be added to the AAD tenant (AdalServiceException)."            -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureAdalServiceExOldPasswordUsed                "Password Hash Sync Ping AWS API Call Failure - Old password is used for authentication (AdalServiceException)."            -Option Constant -Scope script   
Set-Variable EventMsgPwdSyncPingAWSFailureAdalServiceExAccountDisabled                "Password Hash Sync Ping AWS API Call Failure - User account is disabled (AdalServiceException)."                           -Option Constant -Scope script
Set-Variable EventMsgPwdSyncPingAWSFailureAdalServiceExInvalidUsernameOrPwd           "Password Hash Sync Ping AWS API Call Failure - Invalid username or password (AdalServiceException)."                       -Option Constant -Scope script  
Set-Variable EventMsgPwdSyncPingAWSFailureAdalServiceExTenantNotFound                 "Password Hash Sync Ping AWS API Call Failure - Tenant not found (AdalServiceException)."                                   -Option Constant -Scope script

Set-Variable EventMsgPersistentHealthTaskFailure                                      "Password hash synchronization agent is continuously getting health task failures. AD Connector - {0}."                     -Option Constant -Scope script
Set-Variable EventMsgTemporaryHealthTaskFailure                                       "Password hash synchronization agent had health task failure. AD Connector - {0}."                                          -Option Constant -Scope script

Set-Variable EventMsgIsPwdSyncGeneralDiagnosticsHelpful                               "Is password hash sync general diagnostics helpful: {0}"                                                                    -Option Constant -Scope script


Set-Variable EventMsgSingleObjectConnectorDisabled            "Password Hash Synchronization is disabled for AD Connector - {0}"                                                                                                    -Option Constant -Scope script
Set-Variable EventMsgSingleObjectDisconnector                 "The object is a disconnector, it does not have a link to the metaverse. AD Connector - {0}, DN - {1}"                                                                -Option Constant -Scope script
Set-Variable EventMsgSingleObjectNotSyncedToAADCS             "The object is not synced to the AAD connector space. AD Connector - {0}, DN - {1}"                                                                                   -Option Constant -Scope script
Set-Variable EventMsgSingleObjectNoADPwdSyncRule              "There is no password hash synchronization rule for AD connector space object. AD Connector - {0}, DN - {1}"                                                          -Option Constant -Scope script
Set-Variable EventMsgSingleObjectNoAADPwdSyncRule             "There is no password hash synchronization rule for target AAD connector space object. AD Connector - {0}, DN - {1}"                                                  -Option Constant -Scope script
Set-Variable EventMsgSingleObjectNoPwdHistory                 "Password Hash Synchronization agent does not have any password change history for the specified object. AD Connector - {0}, DN - {1}"                                -Option Constant -Scope script
Set-Variable EventMsgSingleObjectFilteredByTarget             "FilteredByTarget - Temporary password is filtered by target. AD Connector - {0}, DN - {1}, DateTime - {2}"                                                           -Option Constant -Scope script
Set-Variable EventMsgSingleObjectNotExported                  "TargetNotExportedToDirectory - The object in the AAD connector space has not yet been exported. AD Connector - {0}, DN - {1}, DateTime - {2}"                        -Option Constant -Scope script
Set-Variable EventMsgSingleObjectNoTargetConnection           "NoTargetConnection - The object is not synced to AAD connector space or password hash sync rule(s) are not available. AD Connector - {0}, DN - {1}, DateTime - {2}"  -Option Constant -Scope script
Set-Variable EventMsgSingleObjectSuccess                      "Password hash is synchronized successfully. AD Connector - {0}, DN - {1}, DateTime - {2}"                                                                            -Option Constant -Scope script
Set-Variable EventMsgSingleObjectOtherFailure                 "Password hash synchronization is failed. AD Connector - {0}, DN - {1}, DateTime - {2}, Status - {3}"                                                                 -Option Constant -Scope script
Set-Variable EventMsgIsPwdSyncSingleObjectDiagnosticsHelpful  "Is password hash sync single object diagnostics helpful: {0}"                                                                                                        -Option Constant -Scope script

Function GetPasswordHashSyncCloudConfiguration
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.Connector]
        [parameter(mandatory=$true)]
        $AADConnector
    )

    Try
    {
        $aadCompanyFeatures = Get-ADSyncAADCompanyFeature
        $passwordHashSyncCloudConfiguration = $aadCompanyFeatures.PasswordHashSync
        Write-Output $passwordHashSyncCloudConfiguration
    }
    Catch
    {
        Write-Output $null
    }
}

Function GetADConnectorPasswordSyncConfiguration
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.Connector]
        [parameter(mandatory=$true)]
        $ADConnector
    )

    Try
    {
        $adConnectorPasswordSyncConfig = Get-ADSyncAADPasswordSyncConfiguration -SourceConnector $ADConnector.Name
        Write-Output $adConnectorPasswordSyncConfig
    }
    Catch
    {
        Write-Output $null
    }
}

Function GetADConnectorLatestPingEvent
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.Connector]
        [parameter(mandatory=$true)]
        $ADConnector
    )
    
    $pingEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 654 -After (Get-Date).AddHours(-3) -ErrorAction SilentlyContinue | 
                  Where-Object { $_.Message.ToUpperInvariant().Contains($ADConnector.Identifier.ToString("D").ToUpperInvariant()) } | 
                  Sort-Object  { $_.TimeWritten } -Descending

    if ($pingEvents -eq $null)
    {
        Write-Output $null
    }
    else
    {
        Write-Output $pingEvents[0]
    }
}

Function GetADConnectorPasswordHashSyncLatestActivityEvent
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.Connector]
        [parameter(mandatory=$true)]
        $ADConnector
    )

    #
    # The events in the following indicates that there is an ongoing password hash sync activity for the given AD Connector.
    #
    $passwordHashSyncActivityEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue |
                                      Where-Object { $_.InstanceId -eq 601 -or
                                                     $_.InstanceId -eq 609 -or
                                                     $_.InstanceId -eq 610 -or
                                                     $_.InstanceId -eq 611 -or
                                                     $_.InstanceId -eq 615 -or
                                                     $_.InstanceId -eq 617 -or
                                                     $_.InstanceId -eq 618 -or
                                                     $_.InstanceId -eq 619 -or
                                                     $_.InstanceId -eq 620 -or
                                                     $_.InstanceId -eq 621 -or
                                                     $_.InstanceId -eq 650 -or 
                                                     $_.InstanceId -eq 651 -or
                                                     $_.InstanceId -eq 652 -or
                                                     $_.InstanceId -eq 653 -or
                                                     $_.InstanceId -eq 654 -or
                                                     $_.InstanceId -eq 655 -or
                                                     $_.InstanceId -eq 656 -or 
                                                     $_.InstanceId -eq 657 -or
                                                     $_.InstanceId -eq 660 -or
                                                     $_.InstanceId -eq 661 -or
                                                     $_.InstanceId -eq 662 -or
                                                     $_.InstanceId -eq 663 } |
                                      Where-Object { $_.Message.ToUpperInvariant().Contains($ADConnector.Identifier.ToString("D").ToUpperInvariant()) } |
                                      Sort-Object  { $_.TimeWritten } -Descending

    if ($passwordHashSyncActivityEvents -eq $null)
    {
        Write-Output $null
    }
    else
    {
        Write-Output $passwordHashSyncActivityEvents[0]
    }
}

Function RestartADConnectorPasswordHashSyncChannel
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.Connector]
        [parameter(mandatory=$true)]
        $ADConnector,

        [Microsoft.IdentityManagement.PowerShell.ObjectModel.Connector]
        [parameter(mandatory=$true)]
        $AADConnector
    )

    try
    {
        Set-ADSyncAADPasswordSyncConfiguration -SourceConnector $ADConnector.Name -TargetConnector $AADConnector.Name -Enable $false
        Set-ADSyncAADPasswordSyncConfiguration -SourceConnector $ADConnector.Name -TargetConnector $AADConnector.Name -Enable $true

        Start-Sleep -s 10

        WriteEventLog($EventIdRestartPwdSyncChannelSuccess)($EventMsgRestartPwdSyncChannelSuccess -f $ADConnector.Name)

        "Password Hash Synchronization is successfully restarted for AD Connector: $($ADConnector.Name)" | ReportOutput 
    }
    catch
    {
        WriteEventLog($EventIdRestartPwdSyncChannelFailure)($EventMsgRestartPwdSyncChannelFailure -f $ADConnector.Name)

        "Password Hash Synchronization could NOT be restarted for AD Connector: $($ADConnector.Name)" | ReportError
    }
}

Function GetCsObjectPasswordSyncRule
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.CsObject]
        [parameter(mandatory=$true)]
        $CsObject
    )

    foreach ($csObjectLink in $CsObject.Lineage)
    {
        Try
        {
            $syncRule = Get-ADSyncRule -Identifier $csObjectLink.SyncRuleInternalId

            if ($syncRule.EnablePasswordSync -eq $true)
            {
                Write-Output $syncRule
                return
            }
        }
        Catch
        {
            #
            # Do nothing
            #
        }
    }

    Write-Output $null
}

Function GetCsObjectLog
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.CsObject]
        [parameter(mandatory=$true)]
        $CsObject,

        [int]
        [parameter(mandatory=$true)]
        $LogEntryCount
    )

    Try
    {
        $csObjectLogEntries = Get-ADSyncCSObjectLog -Identifier $CsObject.ObjectId -Count $LogEntryCount
        Write-Output $csObjectLogEntries
    }
    Catch
    {
        Write-Output $null
    }
}

#
# Test connectivity to a domain or domain controller
#
# Input parameter for domain : fully qualified name of the domain
#
# OR
#
# Input parameter for domain controller : host name of the domain controller
#
Function IsDomainReachable
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    [System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices.Protocols")
    
    $port = 389
    $timeout = New-TimeSpan -Seconds 30

    $directoryIdentifier = New-Object System.DirectoryServices.Protocols.LdapDirectoryIdentifier($Domain, $port)
    $ldapConnection = New-Object System.DirectoryServices.Protocols.LdapConnection($directoryIdentifier)
    $ldapConnection.AuthType = [System.DirectoryServices.Protocols.AuthType]::Anonymous
    $ldapConnection.AutoBind = $false
    $ldapConnection.Timeout = $timeout

    Try
    {
        $ldapConnection.Bind()
        Write-Output $true
    }
    Catch
    {
        Write-Output $false
    }

    $ldapConnection.Dispose()
}

#
# Check if password hash sync agent continuously fails to compute MD5 decryption key.
#
# Checks 667 error events
#
# Measure - 5+ failures in the last 2 hour
#
Function IsPersistentMD5Failure
{

    $passwordSyncMD5ErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 667 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                  Sort-Object  { $_.TimeWritten } -Descending

    $numberOfMD5FailuresInLastTwoHours = $passwordSyncMD5ErrorEvents.Length

    if ($numberOfMD5FailuresInLastTwoHours -gt 4)
    {
        $latestPasswordSyncMD5ErrorEventTime = GetDateTimeLocaleEnUs($passwordSyncMD5ErrorEvents[0].TimeGenerated)

        $errorStr = 
        "Password Hash Synchronization agent continuously fails to create a key for decryption. `n" +
        "If Federal Information Processing Standards (FIPS) policy is enabled, updating the configuration for the synchronization service (ADSync) may resolve the issue. `n" +
        "Please see: https://go.microsoft.com/fwlink/?linkid=875725 `n" +
        "Please check 667 error events in the application event logs for details `n" +
        "The latest 667 error event is generated at: $latestPasswordSyncMD5ErrorEventTime UTC "
        
        $errorStr | ReportError

        Write-Host "`r`n"

        Write-Output $true
    }
    else
    {
        Write-Output $false
    }
}

#
# Check if password hash sync agent continuously gets failures for the given domain
#
# Checks 611 error events
#
# Measure - 5+ domain failures in the last 2 hours for the same domain
#
Function IsPersistentDomainFailure
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    #
    # Differentiate the given domain from the others having the same suffix.
    #
    $DomainName = " " + $Domain.ToUpperInvariant()


    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 611 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object {($_.Message.ToUpperInvariant().Contains($DomainName))} |
                                     Sort-Object  { $_.TimeWritten } -Descending

    $numberOfDomainFailuresInLastTwoHours = $domainPasswordSyncErrorEvents.Length

    if ($numberOfDomainFailuresInLastTwoHours -gt 4)
    {
        WriteEventLog($EventIdPersistentDomainFailure)($EventMsgPersistentDomainFailure -f $Domain)

        $latestDomainPasswordSyncErrorEventTime = GetDateTimeLocaleEnUs($domainPasswordSyncErrorEvents[0].TimeGenerated)

        $errorStr =
        "`tPassword Hash Synchronization agent is continuously getting failures for domain `"$($Domain)`" `n" +
        "`tPlease check 611 error events in the application event logs for details `n" +
        "`tThe latest 611 error event for the domain `"$($Domain)`" is generated at: $latestDomainPasswordSyncErrorEventTime UTC `n"

        $errorStr | ReportError
        Write-Host "`r`n"

        Write-Output $true
    }
    elseif ($numberOfDomainFailuresInLastTwoHours -gt 0)
    {
        WriteEventLog($EventIdTemporaryDomainFailure)($EventMsgTemporaryDomainFailure -f $Domain)

        Write-Output $false
    }
    else
    {
        Write-Output $false
    }
}

#
# Check if password hash sync agent continuously gets failures for Health Task
#
# Checks 662 error events
#
# Measure - 5+ health task failures in the last 2 hours for the same AD Connector
#
Function IsPersistentHealthTaskFailure
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.Connector]
        [parameter(mandatory=$true)]
        $ADConnector
    )

    $adConnectorPwdSyncHealthTaskErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 662 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue |
                                               Where-Object { $_.Message.ToUpperInvariant().Contains($ADConnector.Identifier.ToString("D").ToUpperInvariant()) } |
                                               Sort-Object  { $_.TimeWritten } -Descending

    $numberOfHealthTaskFailuresInLastTwoHours = $adConnectorPwdSyncHealthTaskErrorEvents.Length

    if ($numberOfHealthTaskFailuresInLastTwoHours -gt 4)
    {
        WriteEventLog($EventIdPersistentHealthTaskFailure)($EventMsgPersistentHealthTaskFailure -f $ADConnector.Name)

        $latestADConnectorPwdSyncHealthTaskErrorEventTime = GetDateTimeLocaleEnUs($adConnectorPwdSyncHealthTaskErrorEvents[0].TimeGenerated)

        $errorStr = "`r`n" +
        "`tPassword Hash Synchronization agent is continuously getting failures for AD Connector `"$($ADConnector.Name)`" `n" +
        "`tPlease check 662 and 6900 error events in the application event logs for details `n" +
        "`tPlease make sure AAD connector account is added to AAD Tenant, and username and password for this account are valid `n" +
        "`tThe latest 662 error event for the AD Connector `"$($ADConnector.Name)`" is generated at: $latestADConnectorPwdSyncHealthTaskErrorEventTime UTC `n" +
        "`r`n"

        $errorStr | ReportError

        $errorStr = "`r`n" +
        "`tPassword Hash Synchronization agent is continuously getting failures for AD Connector `"$($ADConnector.Name)`" `n" +
        "`tPlease check 662 and 6900 error events in the application event logs for details `n" +
        "`tPlease make sure AAD connector account is added to AAD Tenant, and username and password for this account are valid `n" +
        "`tThe latest 662 error event for the AD Connector `"$($ADConnector.Name)`" is generated at: $latestADConnectorPwdSyncHealthTaskErrorEventTime UTC `n" +
        "`r`n"

        $errorStr | ReportError
        Write-Output $true
    }
    elseif ($numberOfHealthTaskFailuresInLastTwoHours -gt 0)
    {
        WriteEventLog($EventIdTemporaryHealthTaskFailure)($EventMsgTemporaryHealthTaskFailure -f $ADConnector.Name)

        Write-Output $false
    }
    else
    {
        Write-Output $false
    }
 }

#
# Check if password hash sync agent fails for the given domain due to missing password hash sync AD permissions for AD Connector account
#
Function GetADConnectorAccountLatestPasswordSyncPermissionFailedEvent
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )    
    
    $Domain = " " + $Domain.ToUpperInvariant()
    $passwordSyncPermissionRPCErrorCode = "8453".ToUpperInvariant()
    $permissionErrorCallStackEntry = "DrsRpcConnection.OnGetChanges".ToUpperInvariant()
    
    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 611 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object { $_.Message.ToUpperInvariant().Contains($Domain) -and 
                                                    $_.Message.ToUpperInvariant().Contains($passwordSyncPermissionRPCErrorCode) -and
                                                    $_.Message.ToUpperInvariant().Contains($permissionErrorCallStackEntry) } |
                                     Sort-Object  { $_.TimeWritten } -Descending

    if ($domainPasswordSyncErrorEvents -eq $null)
    {
        Write-Output $null
    }
    else
    {
        Write-Output $domainPasswordSyncErrorEvents[0]
    }
}

#
# Check if password hash sync agent fails to resolve a domain controller for the given domain
#
#
# Reason 1 - Unable to retrieve source domain information
#
# Reason 2 - Unable to resolve source host name
#
Function GetLatestFailureToResolveDomainControllerEvent
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    #
    # Differentiate the given domain from the others having the same suffix.
    #
    $Domain = " " + $Domain.ToUpperInvariant()

    #
    # event 611 - unable to retrieve source domain information
    #
    $unableToRetrieveSourceDomainInfoCallStackEntry1_611 = "DrsConnection.CreateSourceDomainInformation".ToUpperInvariant()
    $unableToRetrieveSourceDomainInfoCallStackEntry2_611 = "DrsConnection.ReadServerGuids".ToUpperInvariant()

    #
    # event 611 - unable to resolve source host name
    #
    $unableToResolveSourceHostNameCallStackEntry1_611 = "DrsConnection.CreateSourceDomainInformation".ToUpperInvariant()
    $unableToResolveSourceHostNameCallStackEntry2_611 = "DrsConnection.ResolveSourceHostName".ToUpperInvariant()
    $unableToResolveSourceHostNameCallStackEntry3_611 = "Dns.GetHostEntry".ToUpperInvariant()

    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 611 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object {($_.Message.ToUpperInvariant().Contains($Domain)) -and
                                                   (
                                                        (($_.Message.ToUpperInvariant().Contains($unableToRetrieveSourceDomainInfoCallStackEntry1_611))  -and
                                                         ($_.Message.ToUpperInvariant().Contains($unableToRetrieveSourceDomainInfoCallStackEntry2_611))) -or
                                                        
                                                        (($_.Message.ToUpperInvariant().Contains($unableToResolveSourceHostNameCallStackEntry1_611)) -and
                                                         ($_.Message.ToUpperInvariant().Contains($unableToResolveSourceHostNameCallStackEntry2_611)) -and
                                                         ($_.Message.ToUpperInvariant().Contains($unableToResolveSourceHostNameCallStackEntry3_611)))
                                                    )} |
                                     Sort-Object  { $_.TimeWritten } -Descending

    if ($domainPasswordSyncErrorEvents -eq $null)
    {
        Write-Output $null
    }
    else
    {
        Write-Output $domainPasswordSyncErrorEvents[0]
    }
}

#
# Check if password hash sync agent fails to locate a domain controller for the given domain after successfully
# retrieving source domain information and resolving source host name
#
Function GetLatestFailureToLocateDomainControllerEvent
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    #
    # Differentiate the given domain from the others having the same suffix.
    #
    $Domain = " " + $Domain.ToUpperInvariant()

    #
    # event 611 - Unable to locate a domain controller
    #
    $unableToLocateDomainControllerCallStackEntry1_611 = "DrsConnection.ResolveDomainController".ToUpperInvariant()
    $unableToLocateDomainControllerCallStackEntry2_611 = "DirectoryUtility.FindPreferredDC".ToUpperInvariant()
    $unableToLocateDomainControllerCallStackEntry3_611 = "Domain.GetDomain".ToUpperInvariant()
    
    $incorrectUsernameOrPasswordCallStackEntryBind = "DirectoryEntry.Bind".ToUpperInvariant()

    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 611 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object {($_.Message.ToUpperInvariant().Contains($Domain)) -and
                                                   (
                                                        (($_.Message.ToUpperInvariant().Contains($unableToLocateDomainControllerCallStackEntry1_611))   -and
                                                         !($_.Message.ToUpperInvariant().Contains($incorrectUsernameOrPasswordCallStackEntryBind))      -and
                                                         (($_.Message.ToUpperInvariant().Contains($unableToLocateDomainControllerCallStackEntry2_611)) -or
                                                          ($_.Message.ToUpperInvariant().Contains($unableToLocateDomainControllerCallStackEntry3_611))))
                                                    )} |
                                     Sort-Object  { $_.TimeWritten } -Descending

    if ($domainPasswordSyncErrorEvents -eq $null)
    {
        Write-Output $null
    }
    else
    {
        Write-Output $domainPasswordSyncErrorEvents[0]
    }
}

#
# Check if password hash sync agent fails for the given domain due to incorrect username or password of AD Connector account
#
Function GetADConnectorAccountLatestUsernameOrPasswordIncorrectEvent
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    #
    # Differentiate the given domain from the others having the same suffix.
    #
    $Domain = " " + $Domain.ToUpperInvariant()
    $incorrectUsernameOrPasswordCallStackEntryBind = "DirectoryEntry.Bind".ToUpperInvariant()

    #
    # event 611 - failure to resolve a domain controller 
    # 
    $incorrectUsernameOrPasswordCallStackEntry_611 = "DrsConnection.ResolveDomainController".ToUpperInvariant()
    
    #
    # event 612 - failure to get domain naming context information during initialization of password hash sync channel
    #
    $incorrectUsernameOrPasswordCallStackEntry_612 = "DirectoryUtility.GetDomainNamingContextInfo".ToUpperInvariant()


    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object { (($_.EventID -eq 611) -and
                                                     ($_.Message.ToUpperInvariant().Contains($Domain)) -and
                                                     ($_.Message.ToUpperInvariant().Contains($incorrectUsernameOrPasswordCallStackEntry_611))  -and
                                                     ($_.Message.ToUpperInvariant().Contains($incorrectUsernameOrPasswordCallStackEntryBind)))  -or

                                                     (($_.EventID -eq 612) -and
                                                      ($_.Message.ToUpperInvariant().Contains($Domain)) -and
                                                      ($_.Message.ToUpperInvariant().Contains($incorrectUsernameOrPasswordCallStackEntry_612))  -and
                                                      ($_.Message.ToUpperInvariant().Contains($incorrectUsernameOrPasswordCallStackEntryBind))) } |
                                     Sort-Object  { $_.TimeWritten } -Descending

    if ($domainPasswordSyncErrorEvents -eq $null)
    {
        Write-Output $null
    }
    else
    {
        Write-Output $domainPasswordSyncErrorEvents[0]
    }
}

#
# Check if password hash sync agent continuously gets RPC errors when connecting to the given domain
#
# Measure - 5+ RPC errors in the last 2 hours for the same domain
#
Function IsPersistentRPCError
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    #
    # Differentiate the given domain from the others having the same suffix.
    #
    $DomainName = " " + $Domain.ToUpperInvariant()

    #
    # event 611 - RPC Error
    #
    $passwordSyncRPCErrorEntry = "RPC Error".ToUpperInvariant()

    #
    # RPC Error 8453 which is an indicator of AD Connector Account password hash sync permission problem is
    # going to be excluded as it is already tracked.
    #
    $passwordSyncPermissionRPCErrorCode = "8453".ToUpperInvariant()
    $permissionErrorCallStackEntry = "DrsRpcConnection.OnGetChanges".ToUpperInvariant()


    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 611 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object {($_.Message.ToUpperInvariant().Contains($DomainName)) -and
                                                   ($_.Message.ToUpperInvariant().Contains($passwordSyncRPCErrorEntry)) -and
                                                   !($_.Message.ToUpperInvariant().Contains($passwordSyncPermissionRPCErrorCode)) -and
                                                   !($_.Message.ToUpperInvariant().Contains($permissionErrorCallStackEntry))} |
                                     Sort-Object  { $_.TimeWritten } -Descending
    
    $numberOfRPCErrorsInLastTwoHours = $domainPasswordSyncErrorEvents.Length

    if ($numberOfRPCErrorsInLastTwoHours -gt 4)
    {
        WriteEventLog($EventIdPersistentRPCError)($EventMsgPersistentRPCError -f $Domain)

        $latestDomainRPCErrorEventTime = GetDateTimeLocaleEnUs($domainPasswordSyncErrorEvents[0].TimeGenerated)

        $errorStr = 
        "`tPassword Hash Synchronization agent is continuously getting RPC errors from domain `"$($Domain)`" `n" +
        "`tPlease setup reliable preferred domain controllers. Please see `"Connectivity problems`" section at https://go.microsoft.com/fwlink/?linkid=847231 `n" +
        "`tPlease check 611 error events in the application event logs for details `n" +
        "`tThe latest RPC error event for the domain `"$($Domain)`" is generated at: $latestDomainRPCErrorEventTime UTC `n" +
        "`r`n"

        $errorStr | ReportError
        Write-Output $true
    }
    elseif ($numberOfRPCErrorsInLastTwoHours -gt 0)
    {
        WriteEventLog($EventIdTemporaryRPCError)($EventMsgTemporaryRPCError -f $Domain)

        Write-Output $false
    }
    else
    {
        Write-Output $false
    }
}

#
# Check if password hash sync agent continuously gets LDAP connection errors from the given domain
#
# Measure - 5+ LDAP connection errors in the last 2 hours for the same domain
#
Function IsPersistentLDAPConnectionError
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    #
    # Differentiate the given domain from the others having the same suffix.
    #
    $DomainName = " " + $Domain.ToUpperInvariant()

    #
    # event 611 - LdapException
    #
    $ldapExceptionEntry = ".LdapException".ToUpperInvariant()

    #
    # event 611 - DirectoryOperationException
    #
    $directoryOperationExceptionEntry = ".DirectoryOperationException".ToUpperInvariant()


    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 611 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object {($_.Message.ToUpperInvariant().Contains($DomainName)) -and
                                                   (($_.Message.ToUpperInvariant().Contains($ldapExceptionEntry)) -or
                                                    ($_.Message.ToUpperInvariant().Contains($directoryOperationExceptionEntry)))} |
                                     Sort-Object  { $_.TimeWritten } -Descending

    $numberOfLdapConnectionErrorsInLastTwoHours = $domainPasswordSyncErrorEvents.Length

    if ($numberOfLdapConnectionErrorsInLastTwoHours -gt 4)
    {
        WriteEventLog($EventIdPersistentLDAPConnectionError)($EventMsgPersistentLDAPConnectionError -f $Domain)

        $latestDomainLDAPConnectionErrorEventTime = GetDateTimeLocaleEnUs($domainPasswordSyncErrorEvents[0].TimeGenerated)

        $errorStr = 
        "`tPassword Hash Synchronization agent is continuously getting LDAP connection errors from the domain `"$($Domain)`" `n" +
        "`tPlease setup reliable preferred domain controllers. Please see `"Connectivity problems`" section at https://go.microsoft.com/fwlink/?linkid=847231 `n" +
        "`tPlease check 611 error events in the application event logs for details `n" +
        "`tThe latest LDAP Connection error event for the domain `"$($Domain)`" is generated at: $latestDomainLDAPConnectionErrorEventTime UTC `n" +
        "`r`n"

        $errorStr | ReportError

        Write-Output $true
    }
    elseif ($numberOfLdapConnectionErrorsInLastTwoHours -gt 0)
    {
        WriteEventLog($EventIdTemporaryLDAPConnectionError)($EventMsgTemporaryLDAPConnectionError -f $Domain)

        Write-Output $false
    }
    else
    {
        Write-Output $false
    }
}

#
# Check if password hash sync agent gets CryptographicException
# 
Function GetLatestCryptographicExceptionEvent
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    #
    # Differentiate the given domain from the others having the same suffix.
    #
    $Domain = " " + $Domain.ToUpperInvariant()

    #
    # event 611 - CryptographicException
    #
    $cryptographicExceptionEntry = ".CryptographicException".ToUpperInvariant()

    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 611 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object {($_.Message.ToUpperInvariant().Contains($Domain)) -and
                                                   ($_.Message.ToUpperInvariant().Contains($cryptographicExceptionEntry))} |
                                     Sort-Object  { $_.TimeWritten } -Descending

    if ($domainPasswordSyncErrorEvents -eq $null)
    {
        Write-Output $null
    }
    else
    {
        Write-Output $domainPasswordSyncErrorEvents[0]
    }
}

#
# Check password hash sync agent internal errors
#
# Most failing calls: FimNotificationManager.GetRetryObjects, FimNotificationManager.UpdateRetryStatus
# 
Function GetLatestInternalErrorEvent
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $Domain
    )

    #
    # Differentiate the given domain from the others having the same suffix.
    #
    $Domain = " " + $Domain.ToUpperInvariant()

    $passwordSyncInternalFailureCallStackEntry1_611 = "FimNotificationManager.GetRetryObjects".ToUpperInvariant()
    $passwordSyncInternalFailureCallStackEntry2_611 = "FimNotificationManager.UpdateRetryStatus".ToUpperInvariant()

    $domainPasswordSyncErrorEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 611 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                     Where-Object {($_.Message.ToUpperInvariant().Contains($Domain)) -and
                                                   (($_.Message.ToUpperInvariant().Contains($passwordSyncInternalFailureCallStackEntry1_611)) -or
                                                   ($_.Message.ToUpperInvariant().Contains($passwordSyncInternalFailureCallStackEntry2_611)))} |
                                     Sort-Object  { $_.TimeWritten } -Descending


    if ($domainPasswordSyncErrorEvents -eq $null)
    {
        Write-Output $null
    }
    else
    {
        Write-Output $domainPasswordSyncErrorEvents[0]
    }
}

#
# Check if password hash sync agent fails on AWS API call to push password changes to AAD Tenant OR to ping AAD Tenant.
#
# Checks 652 and 655 error events
#
Function CheckLatestPasswordSyncAWSCallFailureEvents
{
    $passwordSyncCloudConfigNotActivatedEntry = "Error Code: 90".ToUpperInvariant()
    $identitySyncCloudConfigNotActivatedEntry = "Error Code: 15".ToUpperInvariant()
    $accessToAzureActiveDirectoryDeniedEntry  = "Error Code: 7".ToUpperInvariant()
    $endpointNotFoundExceptionEntry           = "EndpointNotFoundException".ToUpperInvariant()
    $securityNegotiationExceptionEntry        = "SecurityNegotiationException".ToUpperInvariant()
    
    #
    # Adal Service Exception and related errors
    #
    $adalServiceExceptionEntry                = ".AdalServiceException".ToUpperInvariant()
    $userRealmDiscoveryFailedEntry            = "user_realm_discovery_failed".ToUpperInvariant()
    $stsErrorCodeAccountMustBeAddedToTenant   = "AADSTS50034".ToUpperInvariant()
    $stsErrorCodeOldPasswordUsed              = "AADSTS50054".ToUpperInvariant()
    $stsErrorCodeAccountDisabled              = "AADSTS50057".ToUpperInvariant()
    $stsErrorCodeInvalidUsernameOrPassword    = "AADSTS50126".ToUpperInvariant()
    $stsErrorCodeTenantNotFound               = "AADSTS90002".ToUpperInvariant()

    $passwordSyncBatchAWSCallFailureEvents = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 652 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                             Sort-Object  { $_.TimeWritten } -Descending

    $passwordSyncPingAWSCallFailureEvents  = Get-EventLog -LogName "Application" -Source "Directory Synchronization" -InstanceId 655 -After (Get-Date).AddHours(-2) -ErrorAction SilentlyContinue | 
                                             Sort-Object  { $_.TimeWritten } -Descending

    
    if ($passwordSyncBatchAWSCallFailureEvents -ne $null)
    {
        WriteEventLog($EventIdPwdSyncBatchAWSFailure)($EventMsgPwdSyncBatchAWSFailure)

        $pwdSyncBatchAWSCallFailureTime = GetDateTimeLocaleEnUs($passwordSyncBatchAWSCallFailureEvents[0].TimeGenerated)

        $errorStr =
        "Password Hash Synchronization agent had an error while pushing password changes to AAD tenant at: $pwdSyncBatchAWSCallFailureTime UTC `n" +
        "Please make sure AAD connector account is added to AAD Tenant, and username and password for this account are valid. `n" +
        "Please check 652 error events in the application event logs for details `n" +
        "`r`n"

        $errorStr | ReportError

        $errorMessage = $passwordSyncBatchAWSCallFailureEvents[0].Message.ToUpperInvariant();

        if ($errorMessage.Contains($passwordSyncCloudConfigNotActivatedEntry))
        {
            WriteEventLog($EventIdPwdSyncBatchAWSFailurePwdSyncCloudConfigNotActivated)($EventMsgPwdSyncBatchAWSFailurePwdSyncCloudConfigNotActivated)             
        }
        elseif ($errorMessage.Contains($identitySyncCloudConfigNotActivatedEntry))
        {
            WriteEventLog($EventIdPwdSyncBatchAWSFailureIdentitySyncCloudConfigNotActivated)($EventMsgPwdSyncBatchAWSFailureIdentitySyncCloudConfigNotActivated)             
        }
        elseif ($errorMessage.Contains($accessToAzureActiveDirectoryDeniedEntry))
        {
            WriteEventLog($EventIdPwdSyncBatchAWSFailureAADAccessDenied)($EventMsgPwdSyncBatchAWSFailureAADAccessDenied)             
        }
        elseif ($errorMessage.Contains($endpointNotFoundExceptionEntry))
        {
            WriteEventLog($EventIdPwdSyncBatchAWSFailureEndpointNotFoundException)($EventMsgPwdSyncBatchAWSFailureEndpointNotFoundException)
        }
        elseif ($errorMessage.Contains($adalServiceExceptionEntry))
        {
            WriteEventLog($EventIdPwdSyncBatchAWSFailureAdalServiceException)($EventMsgPwdSyncBatchAWSFailureAdalServiceException)

            if ($errorMessage.Contains($userRealmDiscoveryFailedEntry))
            {
                WriteEventLog($EventIdPwdSyncBatchAWSFailureAdalServiceExUserRealmDiscoveryFailed)($EventMsgPwdSyncBatchAWSFailureAdalServiceExUserRealmDiscoveryFailed)
            }
            elseif ($errorMessage.Contains($stsErrorCodeAccountMustBeAddedToTenant))
            {
                WriteEventLog($EventIdPwdSyncBatchAWSFailureAdalServiceExAccountMustBeAddedToTenant)($EventMsgPwdSyncBatchAWSFailureAdalServiceExAccountMustBeAddedToTenant)
            }
            elseif ($errorMessage.Contains($stsErrorCodeOldPasswordUsed))
            {
                WriteEventLog($EventIdPwdSyncBatchAWSFailureAdalServiceExOldPasswordUsed)($EventMsgPwdSyncBatchAWSFailureAdalServiceExOldPasswordUsed)
            }
            elseif ($errorMessage.Contains($stsErrorCodeAccountDisabled))
            {
                WriteEventLog($EventIdPwdSyncBatchAWSFailureAdalServiceExAccountDisabled)($EventMsgPwdSyncBatchAWSFailureAdalServiceExAccountDisabled)
            }
            elseif ($errorMessage.Contains($stsErrorCodeInvalidUsernameOrPassword))
            {
                WriteEventLog($EventIdPwdSyncBatchAWSFailureAdalServiceExInvalidUsernameOrPwd)($EventMsgPwdSyncBatchAWSFailureAdalServiceExInvalidUsernameOrPwd)
            }
            elseif ($errorMessage.Contains($stsErrorCodeTenantNotFound))
            {
                WriteEventLog($EventIdPwdSyncBatchAWSFailureAdalServiceExTenantNotFound)($EventMsgPwdSyncBatchAWSFailureAdalServiceExTenantNotFound)
            }
        }
        elseif ($errorMessage.Contains($securityNegotiationExceptionEntry))
        {
            WriteEventLog($EventIdPwdSyncBatchAWSFailureSecurityNegotiationException)($EventMsgPwdSyncBatchAWSFailureSecurityNegotiationException)
        }
    }

    if ($passwordSyncPingAWSCallFailureEvents -ne $null)
    {
        WriteEventLog($EventIdPwdSyncPingAWSFailure)($EventMsgPwdSyncPingAWSFailure)

        $pwdSyncPingAWSCallFailureTime = GetDateTimeLocaleEnUs($passwordSyncPingAWSCallFailureEvents[0].TimeGenerated)

        $errorStr = 
        "Password Hash Synchronization agent had an error while pinging AAD tenant at: $pwdSyncPingAWSCallFailureTime UTC `n" +
        "Please make sure AAD connector account is added to AAD Tenant, and username and password for this account are valid. `n" +
        "Please check 655 error events in the application event logs for details `n" +
        "`r`n"
        
        $errorStr | ReportError

        $errorMessage = $passwordSyncPingAWSCallFailureEvents[0].Message.ToUpperInvariant();

        if ($errorMessage.Contains($passwordSyncCloudConfigNotActivatedEntry))
        {
            WriteEventLog($EventIdPwdSyncPingAWSFailurePwdSyncCloudConfigNotActivated)($EventMsgPwdSyncPingAWSFailurePwdSyncCloudConfigNotActivated)             
        }
        elseif ($errorMessage.Contains($identitySyncCloudConfigNotActivatedEntry))
        {
            WriteEventLog($EventIdPwdSyncPingAWSFailureIdentitySyncCloudConfigNotActivated)($EventMsgPwdSyncPingAWSFailureIdentitySyncCloudConfigNotActivated)             
        }
        elseif ($errorMessage.Contains($accessToAzureActiveDirectoryDeniedEntry))
        {
            WriteEventLog($EventIdPwdSyncPingAWSFailureAADAccessDenied)($EventMsgPwdSyncPingAWSFailureAADAccessDenied)             
        }
        elseif ($errorMessage.Contains($endpointNotFoundExceptionEntry))
        {
            WriteEventLog($EventIdPwdSyncPingAWSFailureEndpointNotFoundException)($EventMsgPwdSyncPingAWSFailureEndpointNotFoundException)
        }
        elseif ($errorMessage.Contains($adalServiceExceptionEntry))
        {
             WriteEventLog($EventIdPwdSyncPingAWSFailureAdalServiceException)($EventMsgPwdSyncPingAWSFailureAdalServiceException)

            if ($errorMessage.Contains($userRealmDiscoveryFailedEntry))
            {
                WriteEventLog($EventIdPwdSyncPingAWSFailureAdalServiceExUserRealmDiscoveryFailed)($EventMsgPwdSyncPingAWSFailureAdalServiceExUserRealmDiscoveryFailed)
            }
            elseif ($errorMessage.Contains($stsErrorCodeAccountMustBeAddedToTenant))
            {
                WriteEventLog($EventIdPwdSyncPingAWSFailureAdalServiceExAccountMustBeAddedToTenant)($EventMsgPwdSyncPingAWSFailureAdalServiceExAccountMustBeAddedToTenant)
            }
            elseif ($errorMessage.Contains($stsErrorCodeOldPasswordUsed))
            {
                WriteEventLog($EventIdPwdSyncPingAWSFailureAdalServiceExOldPasswordUsed)($EventMsgPwdSyncPingAWSFailureAdalServiceExOldPasswordUsed)
            }
            elseif ($errorMessage.Contains($stsErrorCodeAccountDisabled))
            {
                WriteEventLog($EventIdPwdSyncPingAWSFailureAdalServiceExAccountDisabled)($EventMsgPwdSyncPingAWSFailureAdalServiceExAccountDisabled)
            }
            elseif ($errorMessage.Contains($stsErrorCodeInvalidUsernameOrPassword))
            {
                WriteEventLog($EventIdPwdSyncPingAWSFailureAdalServiceExInvalidUsernameOrPwd)($EventMsgPwdSyncPingAWSFailureAdalServiceExInvalidUsernameOrPwd)
            }
            elseif ($errorMessage.Contains($stsErrorCodeTenantNotFound))
            {
                WriteEventLog($EventIdPwdSyncPingAWSFailureAdalServiceExTenantNotFound)($EventMsgPwdSyncPingAWSFailureAdalServiceExTenantNotFound)
            }
        }
        elseif ($errorMessage.Contains($securityNegotiationExceptionEntry))
        {
            WriteEventLog($EventIdPwdSyncPingAWSFailureSecurityNegotiationException)($EventMsgPwdSyncPingAWSFailureSecurityNegotiationException)
        }
    }
}

#
# Check if verbose logging is turned on for password hash sync
#
Function CheckVerboseLoggingForPHS
{
    $adSyncRegKey = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\AD Sync"
    $adSyncPath = $adSyncRegKey.Location
    $adSyncConfigurationPath = [System.IO.Path]::Combine($adSyncPath, "Bin\miiserver.exe.config")

    [xml]$adSyncConfiguration = Get-Content $adSyncConfigurationPath
    $passwordSyncLogging = $adSyncConfiguration.configuration.'system.diagnostics'.sources.source | ? { $_.name -eq 'passwordSync'}
    
    if($passwordSyncLogging -and $passwordSyncLogging.switchValue -eq 'Verbose')
    {
        ReportWarning "Verbose logging is enabled for Password Hash Synchronization, this can very quickly fill up a disk. Review configuration at '$adSyncConfigurationPath'."
    }
}


Function ReportPartitionPasswordSyncState
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.PartitionPasswordSyncState]
        [parameter(mandatory=$true)]
        $PartitionPasswordSyncState
    )

    $partitionPasswordSyncLastCycleStatus = $partitionPasswordSyncState.PasswordSyncLastCycleStatus.ToString()
    
    $culture = New-Object System.Globalization.CultureInfo 'en-us'
    $partitionPasswordSyncLastSuccessfulCycleStartDateTime = $partitionPasswordSyncState.PasswordSyncLastSuccessfulCycleStartTimestamp.ToString($culture)
    $partitionPasswordSyncLastSuccessfulCycleEndDateTime = $partitionPasswordSyncState.PasswordSyncLastSuccessfulCycleEndTimestamp.ToString($culture)

    if ($partitionPasswordSyncLastCycleStatus -eq "None")
    {
        "`tPassword Hash Synchronization agent has never attempted to synchronize passwords from this directory partition." | ReportWarning
    }
    elseif ($partitionPasswordSyncLastCycleStatus -eq "InProgress")
    {
        "`tPassword Hash Synchronization agent is currently synchronizing passwords from this directory partition." | ReportWarning

        $partitionPasswordSyncLastCycleStartDateTime = $partitionPasswordSyncState.PasswordSyncLastCycleStartTimestamp.ToString($culture)
        "`tPassword Hash Synchronization is in progress and started at: $partitionPasswordSyncLastCycleStartDateTime UTC" | ReportWarning
    }
    elseif ($partitionPasswordSyncState.PasswordSyncLastSuccessfulCycleStartTimestamp.Year -eq 1)
    {
        "`tPassword Hash Synchronization agent has never successfully completed synchronizing passwords from this directory partition." | ReportWarning
    }
    else
    {
        "`tLast successful attempt to synchronize passwords from this directory partition started at: $partitionPasswordSyncLastSuccessfulCycleStartDateTime UTC and ended at: $partitionPasswordSyncLastSuccessfulCycleEndDateTime UTC" |
        ReportOutput -PropertyName "Last successfull Passwords Sync from this directory partition Start Time " -PropertyValue "$partitionPasswordSyncLastSuccessfulCycleStartDateTime UTC"
        ReportOutput -PropertyName "Last successfull Passwords Sync from this directory partition End Time" -PropertyValue "$partitionPasswordSyncLastSuccessfulCycleEndDateTime UTC"
    }
}

Function DiagnoseADConnectivity
{
    param
    (
        [Microsoft.IdentityManagement.PowerShell.ObjectModel.Connector]
        [parameter(mandatory=$true)]
        $ADConnector
    )

    Write-Host "`r`n"
    Write-Host "`tDirectory Partitions:"
    Write-Host "`t====================="

    if ($ADConnector.Partitions.Count -eq 0)
    {
        "`tNo directory partition is found for AD Connector - $($ADConnector.Name)" | ReportError
        Write-Host "`r`n"
        return
    }

    #
    # Get password hash sync state for all directory partitions.
    #
    $partitionPasswordSyncStateList = Get-ADSyncPartitionPasswordSyncState

    foreach ($partition in $ADConnector.Partitions)
    {
        Write-Host "`tDirectory Partition - $($partition.Name)"

        # Check if directory partition is a domain
        if (-not $partition.IsDomain)
        {
            "`tDirectory partition `"$($partition.Name)`" is not a domain" | Write-Host -fore Yellow
            Write-Host "`r`n"

            if ($isNonInteractiveMode)
            {
                continue
            }

            # Check if corresponding AD partition is a domain
            $adObject = Search-ADSyncDirectoryObjects -AdConnectorId $ADConnector.Identifier -LdapFilter "(distinguishedName=$($partition.DN))" -SearchScope Subtree -SizeLimit 1

            if ($adObject -ne $null -and $adObject.Count -gt 0 -and (IsObjectTypeMatch($adObject[0])("domain")))
            {
                $domainChoiceOptions = [System.Management.Automation.Host.ChoiceDescription[]] @("&Yes", "&No")
                $setDomainFlag = !($host.UI.PromptForChoice("Set domain flag on partition", "To avoid password sync issues it is recommended that the domain flag for the partition be set to true in the Connector configuration. Is it okay to set it to true now?", $domainChoiceOptions, 0))

                if ($setDomainFlag)
                {
                    try
                    {
                        # Set IsDomain flag in AD Connector Partition
                        $adPartionI = $ADConnector.Partitions.IndexOf($partition)
                        $ADConnector.Partitions[$adPartionI].IsDomain = $true

                        # Adding AD Connector configuration
                        Add-ADSyncConnector -Connector $ADConnector
                        Write-Output "INFO: AD Partition `"$($partition.Name)`" set as Domain partition successfully."
                    }
                    catch
                    {
                        Write-Error "An error occurred setting the domain flag on the partition: $($_.Exception.Message)"
                        continue
                    }
                }
                else
                {
                    continue
                }
            }
            else
            {
                continue
            }
        }
        
        # Check if directory partition is selected for synchronization
        if (-not $partition.Selected)
        {
            "`tDomain `"$($partition.Name)`" is excluded from synchronization" | Write-Host -fore Yellow
            Write-Host "`r`n"
            continue
        }

        #
        # Check if password hash sync agent continuously gets domain failures
        #
        IsPersistentDomainFailure($partition.Name)

        #
        # Check if password hash sync agent fails to RESOLVE a domain controller for the current directory partition 
        # since it is unable to retrieve source domain information OR unable to resolve source host name
        #
        $unableToResolveDomainControllerEvent = GetLatestFailureToResolveDomainControllerEvent($partition.Name)
        
        if ($unableToResolveDomainControllerEvent -ne $null)
        {
            WriteEventLog($EventIdCannotResolveDomainController)($EventMsgCannotResolveDomainController -f $partition.Name)

            $unableToResolveDomainControllerIssueTime = GetDateTimeLocaleEnUs($unableToResolveDomainControllerEvent.TimeGenerated)
    
            $errString = "`tPassword Hash Synchronization agent had a problem to resolve a domain controller in the domain `"$($partition.Name)`" at: $unableToResolveDomainControllerIssueTime UTC `n" +
            "`tPlease check 611 error events in the application event logs for details `n" +
            "`r`n"
            $errString | ReportError

        }

        #
        # Check if password hash sync agent fails to LOCATE a domain controller for the current directory partition
        # after successfully retrieving the source domain information and resolving source host name
        #
        $unableToLocateDomainControllerEvent = GetLatestFailureToLocateDomainControllerEvent($partition.Name)

        if ($unableToLocateDomainControllerEvent -ne $null)
        {
            WriteEventLog($EventIdCannotLocateDomainController)($EventMsgCannotLocateDomainController -f $partition.Name)

            $unableToLocateDomainControllerIssueTime = GetDateTimeLocaleEnUs($unableToLocateDomainControllerEvent.TimeGenerated)

            $errString = 
            "`tPassword Hash Synchronization agent had a problem to locate a domain controller in the domain `"$($partition.Name)`" at: $unableToLocateDomainControllerIssueTime UTC `n" +
            "`tPlease setup reliable preferred domain controllers. Please see `"Connectivity problems`" section at https://go.microsoft.com/fwlink/?linkid=847231 `n" +
            "`tPlease check 611 error events in the application event logs for details `n" +
            "`r`n"

            $errString | ReportError

        }

        #
        # Check if AD Connector account has incorrect username or password problem for the directory partition
        #
        $incorrectUsernameOrPasswordEvent = GetADConnectorAccountLatestUsernameOrPasswordIncorrectEvent($partition.Name)

        if ($incorrectUsernameOrPasswordEvent -ne $null)
        {
            WriteEventLog($EventIdCannotBindToDomainController)($EventMsgCannotBindToDomainController -f $partition.Name)

            $incorrectUsernameOrPasswordIssueTime = GetDateTimeLocaleEnUs($incorrectUsernameOrPasswordEvent.TimeGenerated)

            $errString =
            "`tPassword Hash Synchronization agent had a problem about connecting to a domain controller in the domain `"$($partition.Name)`" at: $incorrectUsernameOrPasswordIssueTime UTC `n" +
            "`tPlease make sure AD Connector account username and password are correct `n" +
            "`tIn case the problem continues, then please setup reliable preferred domain controllers. Please see `"Connectivity problems`" section at https://go.microsoft.com/fwlink/?linkid=847231 `n" +
            "`tPlease check 611 error events in the application event logs for details `n" +
            "`r`n"

            $errString | ReportError
        }

        # Check if AD Connector account has password hash sync permission problem for the directory partition
        $passwordSyncPermissionFailedEvent = GetADConnectorAccountLatestPasswordSyncPermissionFailedEvent($partition.Name)
        
        if ($passwordSyncPermissionFailedEvent -ne $null)
        {
            WriteEventLog($EventIdConnectorAccountPwdSyncPermissionFailed)($EventMsgConnectorAccountPwdSyncPermissionFailed -f $partition.Name)

            $passwordSyncPermissionFailTime = GetDateTimeLocaleEnUs($passwordSyncPermissionFailedEvent.TimeGenerated)

            $errString = 
            "`tAD Connector account had a Password Hash Synchronization permission problem for the domain `"$($partition.Name)`" at: $passwordSyncPermissionFailTime UTC `n" +
            "`tPlease see: https://go.microsoft.com/fwlink/?linkid=847234 `n" +
            "`tPlease check 611 error events in the application event logs for details `n" +
            "`r`n"
            
            $errString | ReportError
        }

        #
        # Check if password hash sync agent fails by repeated RPC errors while connecting to a domain controller
        #
        IsPersistentRPCError($partition.Name)

        #
        # Check if password hash sync agent fails by repeated LDAP connection errors while connecting to a domain controller
        #
        IsPersistentLDAPConnectionError($partition.Name)

        #
        # Check if password hash sync agent fails by CryptographicException
        #
        $cryptographicExceptionEvent = GetLatestCryptographicExceptionEvent($partition.Name)

        if ($cryptographicExceptionEvent -ne $null)
        {
            WriteEventLog($EventIdPasswordSyncCryptographicException)($EventMsgPasswordSyncCryptographicException -f $partition.Name)

            $cryptographicExceptionIssueTime = GetDateTimeLocaleEnUs($cryptographicExceptionEvent.TimeGenerated)

            $errString = 
            "`tPassword Hash Synchronization agent had System.Security.Cryptography.CryptographicException for the domain `"$($partition.Name)`" at: $cryptographicExceptionIssueTime UTC `n" +
            "`tPlease check 611 error events in the application event logs for details `n" +
            "`r`n"

            $errString | ReportError
        }

        #
        # Check if password hash sync agent fails by an internal exception
        #
        $internalErrorEvent = GetLatestInternalErrorEvent($partition.Name)

        if ($internalErrorEvent -ne $null)
        {
            WriteEventLog($EventIdPasswordSyncInternalError)($EventMsgPasswordSyncInternalError -f $partition.Name)
        }
        
        #
        # Find the password hash sync state for the given directory partition (domain) using its distinguished name.
        #
        $partitionPasswordSyncState = $partitionPasswordSyncStateList | Where-Object{$_.DN -eq $partition.DN}

        # Report password hash sync state for the directory partition.
        ReportPartitionPasswordSyncState($partitionPasswordSyncState)

        # Check if DC connection settings is configured to use only preferred domain controllers
        $onlyUsePreferredDC = ($partition.Parameters["dc-failover"].Value -eq 0)

        "`tOnly Use Preferred Domain Controllers: $onlyUsePreferredDC" |
        ReportOutput -PropertyName "Use Preferred Domain Controllers" -PropertyValue $onlyUsePreferredDC

        if (-not $onlyUsePreferredDC)
        {
            Write-Host "`tChecking connectivity to the domain..."

            # Test connectivity to domain
            $isDomainReachable = IsDomainReachable($partition.Name)
            
            if ($isDomainReachable -eq $true)
            {
                "`tDomain `"$($partition.Name)`" is reachable" | ReportOutput 
            }
            else
            {
                WriteEventLog($EventIdDomainIsNotReachable)($EventMsgDomainIsNotReachable -f ($partition.Name))

                "`tDomain `"$($partition.Name)`" is not reachable" | ReportError            
            }

            Write-Host "`r`n"
        }
        else
        {
            Write-Host "`r`n"
            Write-Host "`t`tPreferred Domain Controllers:"
            Write-Host "`t`t============================="

            #
            # Test connectivity to preferred domain controllers
            # Success : querying at least one PDC successfully 
            # Failure : query fails for all PDCs
            #

            $isAllPDCsFailed = $true

            foreach ($preferredDC in $partition.PreferredDCs)
            {
                Write-Host "`t`tChecking connectivity to the preferred domain controller `"$preferredDC`"..."

                $isPreferredDCReachable = IsDomainReachable($preferredDC)

                if ($isPreferredDCReachable -eq $true)
                {
                    $isAllPDCsFailed = $false
                    "`t`tPreferred domain controller `"$preferredDC`" is reachable" | ReportOutput 
                    Write-Host "`r`n"
                    break
                }
                else
                {
                    "`t`tPreferred domain controller `"$preferredDC`" is not reachable" | ReportError
                    Write-Host "`r`n"
                }
            }

            if ($isAllPDCsFailed -eq $true)
            {
                WriteEventLog($EventIdDomainIsNotReachable)($EventMsgDomainIsNotReachable -f ($partition.Name))

                "`tDomain `"$($partition.Name)`" is not reachable" | ReportError
            }
            else
            {
                "`tDomain `"$($partition.Name)`" is reachable" | ReportOutput 
            }

            Write-Host "`r`n"
        }
    }
}

Function DiagnosePasswordSyncSingleObject
{
    param
    (
        [string]
        [parameter(mandatory=$false)]
        $ADConnectorName,

        [string]
        [parameter(mandatory=$false)]
        $DistinguishedName
    )

    if ([string]::IsNullOrEmpty($ADConnectorName) -and [string]::IsNullOrEmpty($DistinguishedName))
    {
        DiagnosePasswordSyncSingleObjectHelper
    }
    elseif ([string]::IsNullOrEmpty($ADConnectorName))
    {
        DiagnosePasswordSyncSingleObjectHelper -DistinguishedName $DistinguishedName
    }
    elseif ([string]::IsNullOrEmpty($DistinguishedName))
    {
        DiagnosePasswordSyncSingleObjectHelper -ADConnectorName $ADConnectorName
    }
    else
    {
        DiagnosePasswordSyncSingleObjectHelper -ADConnectorName $ADConnectorName -DistinguishedName $DistinguishedName
    }
    
    Write-Host "`r`n"

    if (-not $isNonInteractiveMode)
    {
        do
        {
            $answer = Read-Host "Did you find Password Hash Sync Single Object Diagnostics helpful? [y/n]"
        } 
        while(($answer -ne 'y') -and ($answer -ne 'Y') -and ($answer -ne 'n') -and ($answer -ne 'N'))

        WriteEventLog($EventIdIsPwdSyncSingleObjectDiagnosticsHelpful)($EventMsgIsPwdSyncSingleObjectDiagnosticsHelpful -f ($answer))
    }
}

#
# Diagnose password hash sync single object problems
#
# The object is specified by corresponding AD Connector Name and Distinguished Name of the object.
#
Function DiagnosePasswordSyncSingleObjectHelper
{
    param
    (
        [string]
        [parameter(mandatory=$false)]
        $ADConnectorName,

        [string]
        [parameter(mandatory=$false)]
        $DistinguishedName
    )

    WriteEventLog($EventIdSingleObjectDiagnosticsRun)($EventMsgSingleObjectDiagnosticsRun)

    Write-Host "`r`n"

    Write-Host "==========================================================================="
    Write-Host "=                                                                         ="
    Write-Host "=         Password Hash Synchronization Single Object Diagnostics         ="
    Write-Host "=                                                                         ="
    Write-Host "==========================================================================="

    $adConnectors = GetADConnectors
    if ($adConnectors -eq $null)
    {
        "No AD Connector is found. Password Hash Synchronization does not work in the absence of AD Connectors." | ReportError
        return        
    }

    if ([string]::IsNullOrEmpty($ADConnectorName) -or [string]::IsNullOrEmpty($DistinguishedName))
    {
        $adConnectorName = [string]::Empty
        $dn = [string]::Empty
    }
    else
    {
        $adConnectorName = $ADConnectorName
        $dn = $DistinguishedName
    }

    #
    # Get AD Connector Name as input
    # Prompt user again and provide a list of AD Connectors in case of wrong input
    #
    while ($true)
    {
        while ([string]::IsNullOrEmpty($adConnectorName))
        {
            Write-Host "`r`n"

            Write-Host "List of AD Connectors:"
            Write-Host "----------------------"

            foreach ($adConnector in $adConnectors)
            {
                Write-Host $adConnector.Name                
            }

            if ($adConnectors.length -eq 1)
            {
                $ADConnectorName = $adConnectors[0].Name
            }
            else
            {
                Write-Host "`r`n"

                $ADConnectorName = Read-Host "Please enter AD Connector Name"
            }
        }

        $adConnector = GetADConnectorByName($adConnectorName)

        if ($adConnector -eq $null)
        {
            ReportWarning "There is no AD Connector with name `"$adConnectorName`". Please try again!"
            $adConnectorName = [string]::Empty
            if ($isNonInteractiveMode)
            {
                return
            }
        }
        else
        {
            break
        }
    }

    # Get password hash sync configuration for the specified AD Connector
    $adConnectorPasswordSyncConfig = GetADConnectorPasswordSyncConfiguration($adConnector)

    # Check if password hash sync is enabled for the AD connector.
    if ($adConnectorPasswordSyncConfig.Enabled -eq $true)
    {
        "Password Hash Synchronization is enabled for AD Connector - $adConnectorName" | ReportOutput
    }
    else
    {
        WriteEventLog($EventIdSingleObjectConnectorDisabled)($EventMsgSingleObjectConnectorDisabled -f $adConnectorName)

        $errString = 
        "Password Hash Synchronization is disabled for AD Connector - $adConnectorName `n" +
        "Please enable Password Hash Synchronization from AADConnect Wizard in order to sync passwords"

        $errString | ReportError -PropertyName 'AD connector Password hash Sync' -PropertyValue 'Disabled'
        return
    }

    Write-Host "`r`n"

    while ($true)
    {
        while ([string]::IsNullOrEmpty($dn))
        {
            # Get AD connector space object Distinguished Name as input
            $dn = Read-Host "Please enter AD connector space object Distinguished Name"
        }
        
        #
        # Check if the object with the given Distinguished Name is in the AD connector space
        #
        $adCsObject = GetCSObject($adConnectorName)($dn)
    
        if ($adCsObject -eq $null)
        {
            "The object is not found in the AD connector space - $ADConnectorName" | ReportError
            Write-Host "`r`n"

            $dn = [string]::Empty

            if ($isNonInteractiveMode)
            {
                return
            }
            do
            {
                $confirmation = Read-Host "Would you like to try another Distinguished Name? [y/n]"

                if (($confirmation -eq 'n') -or ($confirmation -eq 'N'))
                {
                    Write-Host "`r`n"
                    return
                }
            } while(($confirmation -ne 'y') -or ($confirmation -ne 'Y'))

            Write-Host "`r`n"
        }
        else
        {
            Write-Host "`r`n"
            "The object is available in the AD connector space - $adConnectorName" | ReportOutput 
            break
        }
    }    
    
    #
    # Check if the object has a link to the metaverse
    #
    if ($adCsObject.IsConnector -eq $true)
    {
        "The object is a connector, it has a link to the metaverse" | ReportOutput 
    }
    else
    {
        WriteEventLog($EventIdSingleObjectDisconnector)($EventMsgSingleObjectDisconnector -f ($adConnectorName, $dn))

        "The object is a disconnector, it does not have a link to the metaverse" | ReportError
        return
    }
    
    #
    # Check if the object is synced to the AAD Connector
    #
    $aadConnector = GetAADConnector
    if ($aadConnector -eq $null)
    {
        "No AAD Connector is found. Password Hash Synchronization does not work in the absence of AAD Connector." | ReportError
        return
    }

    # Get metaverse object
    $mvObject = GetMVObjectByIdentifier($adCsObject.ConnectedMVObjectId)

    # Get target AAD connector space object identifier
    $aadCsObjectId = GetTargetCSObjectId($mvObject)($aadConnector.Identifier)
    if ($aadCsObjectId -eq $null)
    {
        WriteEventLog($EventIdSingleObjectNotSyncedToAADCS)($EventMsgSingleObjectNotSyncedToAADCS -f ($adConnectorName, $dn))

        "The object is not synced to the AAD connector space" | ReportError
        return
    }

    # Get target AAD connector space object
    $aadCsObject = GetCSObjectByIdentifier($aadCsObjectId)
    
    if ($aadCsObject -eq $null)
    {
        WriteEventLog($EventIdSingleObjectNotSyncedToAADCS)($EventMsgSingleObjectNotSyncedToAADCS -f ($adConnectorName, $dn))

        "The object is not synced to the AAD connector space" | ReportError
        return
    }
    else
    {
        "The object is synced to the AAD connector space" | ReportOutput 
    }

    Write-Host "`r`n"

    #
    # Check lineage of AD connector space object
    #
    $adCsObjectPasswordSyncRule = GetCsObjectPasswordSyncRule($adCsObject)

    if ($adCsObjectPasswordSyncRule -eq $null)
    {
        WriteEventLog($EventIdSingleObjectNoADPwdSyncRule)($EventMsgSingleObjectNoADPwdSyncRule -f ($adConnectorName, $dn))

        "There is no Password Hash Synchronization rule for AD connector space object" | ReportError

        # Check if AD connector space object has synchronization error
        if ($adCsObject.HasSyncError -eq $true)
        {
            "The AD connector space object has synchronization error" | ReportError 
        }

        "Please check synchronization rules or see: https://go.microsoft.com/fwlink/?linkid=847233" | Write-Host -fore Red

        return    
    }
    else
    {
        "Password Hash Synchronization rule is found for AD connector space object" | ReportOutput 
        $adCsObjectPasswordSyncRule | select Name, Direction, LinkType, EnablePasswordSync | ft -AutoSize | Out-String | Write-Host
    }
    
    #
    # Check lineage of AAD connector space object
    #
    $aadCsObjectPasswordSyncRule = GetCsObjectPasswordSyncRule($aadCsObject)

    if ($aadCsObjectPasswordSyncRule -eq $null)
    {
        WriteEventLog($EventIdSingleObjectNoAADPwdSyncRule)($EventMsgSingleObjectNoAADPwdSyncRule -f ($adConnectorName, $dn))

        "There is no Password Hash Synchronization rule for target AAD connector space object" | ReportError

        # Check if target AAD connector space object has synchronization error
        if ($aadCsObject.HasSyncError -eq $true)
        {
            "The target AAD connector space object has synchronization error" | ReportError
        }

        "Please check synchronization rules or see: https://go.microsoft.com/fwlink/?linkid=847233" | Write-Host -fore Red

        return
    }
    else
    {
        "Password Hash Synchronization rule is found for target AAD connector space object" | ReportOutput 
        $aadCsObjectPasswordSyncRule | select Name, Direction, LinkType, EnablePasswordSync | ft -AutoSize | Out-String | Write-Host    
    }

    #
    # Check CS Object Log Entry
    #
    $logEntryCount = 1
    $adCsObjectLogEntries = GetCSObjectLog($adCsObject)($logEntryCount)

    if ($adCsObjectLogEntries -eq $null)
    {
        WriteEventLog($EventIdSingleObjectNoPwdHistory)($EventMsgSingleObjectNoPwdHistory -f ($adConnectorName, $dn))

        $warningString = 
        "Password Hash Synchronization agent does not have any password change history for the specified object `n" +
        "Password change history is purged once in a week."
        
        $warningString | ReportWarning

        Write-Host "`r`n"
        return
    }

    $adCsObjectLatestLogEntry = $adCsObjectLogEntries[0]
    $adCsObjectLatestLogEntryDateTime = "$($adCsObjectLatestLogEntry.TimeStamp) UTC"


    $resultString =
    "Password Hash Synchronization agent read the last password change for the specified object at: $adCsObjectLatestLogEntryDateTime `n"  +
    "The result of the Password Hash Synchronization attempt was: `n"
    ReportOutput -PropertyName 'Last password change for the specified object at' -PropertyValue "$adCsObjectLatestLogEntryDateTime"


    if (-not $isNonInteractiveMode)
    {
        Write-Host $resultString
        $resultString = ""
    }

    if ($adCsObjectLatestLogEntry.Status -eq "Success")
    {
        WriteEventLog($EventIdSingleObjectSuccess)($EventMsgSingleObjectSuccess -f ($adConnectorName, $dn, $adCsObjectLatestLogEntryDateTime))

        $resultString + "Password hash is synchronized successfully" | ReportOutput 
        ReportOutput -PropertyName 'Last password change status for the specified object' -PropertyValue "Succeeded"
    }
    elseif ($adCsObjectLatestLogEntry.Status -eq "FilteredByTarget")
    {
        WriteEventLog($EventIdSingleObjectFilteredByTarget)($EventMsgSingleObjectFilteredByTarget -f ($adConnectorName, $dn, $adCsObjectLatestLogEntryDateTime))

        $resultString + 
        "Password is set with user must change password at next logon option. Temporary passwords are not supposed to be synchronized. `n" +
        "Please see: https://go.microsoft.com/fwlink/?linkid=847233" | ReportError

    }
    elseif ($adCsObjectLatestLogEntry.Status -eq "TargetNotExportedToDirectory")
    {
        WriteEventLog($EventIdSingleObjectNotExported)($EventMsgSingleObjectNotExported -f ($adConnectorName, $dn, $adCsObjectLatestLogEntryDateTime))

        $resultString + "The object in the AAD connector space has not yet been exported. The password hash is not supposed to be synchronized." | ReportError

        # Check if target AAD connector space object has export error
        if ($aadCsObject.HasExportError -eq $true)
        {
            "The target AAD connector space object has export error" | ReportError
        }

        "Please see: https://go.microsoft.com/fwlink/?linkid=847233" | Write-Host -fore Red
    }
    elseif ($adCsObjectLatestLogEntry.Status -eq "NoTargetConnection")
    {
        WriteEventLog($EventIdSingleObjectNoTargetConnection)($EventMsgSingleObjectNoTargetConnection -f ($adConnectorName, $dn, $adCsObjectLatestLogEntryDateTime))
        
        $resultString + "The object is not synced to the AAD connector space or Password Hash Synchronization rule(s) are not available" | ReportError
        "Please see: https://go.microsoft.com/fwlink/?linkid=847233" | Write-Host -fore Red
    }
    else
    {
        WriteEventLog($EventIdSingleObjectOtherFailure)($EventMsgSingleObjectOtherFailure -f ($adConnectorName, $dn, $adCsObjectLatestLogEntryDateTime, $adCsObjectLatestLogEntry.Status))

        $resultString + "$($adCsObjectLatestLogEntry.Status)" | ReportError
    }

    Write-Host "`r`n"
}

Function PromptPasswordSyncSingleObjectDiagnostics
{
    #
    # Prompt user to diagnose single object issues
    #
    do
    {
        $confirmation = Read-Host "Would you like to diagnose single object issues? [y/n]"

        if (($confirmation -eq 'n') -or ($confirmation -eq 'N'))
        {
            return
        }
    } while(($confirmation -ne 'y') -or ($confirmation -ne 'Y'))
    
    #
    # Diagnose password hash synchronization single object issues 
    #
    DiagnosePasswordSyncSingleObject
}

Function SynchronizeSingleObjectPassword
{
    Write-Host "`r`n"

    Write-Host "==========================================================================="
    Write-Host "=                                                                         ="
    Write-Host "=           Single Object Password Hash Synchronization Utility           ="
    Write-Host "=                                                                         ="
    Write-Host "==========================================================================="

    Write-Host "`r`n"

    "This utility will attempt to synchronize the current password hash stored in the on-premises Active Directory for the specified user account." | Write-Host -fore Cyan

    # Check if Staging Mode is enabled
    $isStagingModeEnabled = IsStagingModeEnabled
    if ($isStagingModeEnabled -eq $true)
    {
        Write-Host "`r`n"
        "Staging mode is enabled. Password Hash Synchronization does not work when staging mode is enabled." | Write-Host -fore Red
        return
    }

    # Get AD Connectors
    $adConnectors = GetADConnectors
    if ($adConnectors -eq $null)
    {
        Write-Host "`r`n"
        "No AD Connector is found. Password Hash Synchronization does not work in the absence of AD Connectors." | Write-Host -fore Red
        return
    }

    # Get AAD Connector
    $aadConnector = GetAADConnector
    if ($aadConnector -eq $null)
    {
        Write-Host "`r`n"
        "No AAD Connector is found. Password Hash Synchronization does not work in the absence of AAD Connector." | Write-Host -fore Red
        return
    }

    "Please specify the user account by providing the regarding AD Connector Name and DistinguishedName." | Write-Host -fore Cyan

    #
    # Get AD Connector Name as input
    # Prompt user again and provide a list of AD Connectors in case of wrong input
    #
    $adConnectorName = $null
    $adConnector = $null

    while ($true)
    {
        while ([string]::IsNullOrEmpty($adConnectorName))
        {
            Write-Host "`r`n"

            Write-Host "List of AD Connectors:"
            Write-Host "----------------------"

            foreach ($adConnector in $adConnectors)
            {
                Write-Host $adConnector.Name                
            }

            if ($adConnectors.length -eq 1)
            {
                $adConnectorName = $adConnectors[0].Name
            }
            else
            {
                Write-Host "`r`n"

                $adConnectorName = Read-Host "Please enter AD Connector Name"
            }
        }
        
        $adConnector = GetADConnectorByName($adConnectorName)

        if ($adConnector -eq $null)
        {
            Write-Warning "There is no AD Connector with name `"$adConnectorName`". Please try again!"

            $adConnectorName = [string]::Empty
        }
        else
        {
            break
        }
    }

    # Get password hash sync configuration for the specified AD Connector
    $adConnectorPasswordSyncConfig = GetADConnectorPasswordSyncConfiguration($adConnector)

    # Check if password hash sync is enabled for the AD connector.
    if ($adConnectorPasswordSyncConfig.Enabled -eq $true)
    {
        "Password Hash Synchronization is enabled for AD Connector - $adConnectorName" | Write-Host -fore Green
    }
    else
    {
        "Password Hash Synchronization is disabled for AD Connector - $adConnectorName" | Write-Host -fore Red
        "Please enable Password Hash Synchronization from AADConnect Wizard in order to synchronize passwords" | Write-Host -fore Red
        return
    }

    Write-Host "`r`n"
    $dn = $null
    $adCsObject = $null

    while ($true)
    {
        while ([string]::IsNullOrEmpty($dn))
        {
            # Get AD connector space object Distinguished Name as input
            $dn = Read-Host "Please enter AD connector space object Distinguished Name"
        }
        
        #
        # Check if the object with the given Distinguished Name is in the AD connector space
        #
        $adCsObject = GetCSObject($adConnectorName)($dn)
    
        if ($adCsObject -eq $null)
        {
            "The object is not found in the AD connector space - $ADConnectorName" | Write-Host -fore Red
            Write-Host "`r`n"

            $dn = [string]::Empty

            do
            {
                $confirmation = Read-Host "Would you like to try another Distinguished Name? [y/n]"

                if (($confirmation -eq 'n') -or ($confirmation -eq 'N'))
                {
                    Write-Host "`r`n"
                    return
                }
            } while(($confirmation -ne 'y') -and ($confirmation -ne 'Y'))

            Write-Host "`r`n"
        }
        else
        {
            break
        }
    }

    if ($adCsObject.ObjectType -ne "user")
    {
        "Connector space object type is $($adCsObject.ObjectType). Password Hash Synchronization is only supported for the object type user in Active Directory." | Write-Host -fore Red
        return
    }

    $singleObjectPasswordSyncResult = Invoke-ADSyncCSObjectPasswordHashSync -CsObject $adCsObject
    
    if ($singleObjectPasswordSyncResult.Contains("success"))
    {
        $singleObjectPasswordSyncResult | Write-Host -fore Green
    }
    else
    {
        $singleObjectPasswordSyncResult | Write-Host -fore Red
    }
}

Function DiagnosePasswordHashSyncNonInteractiveMode
{
    param
    (
        [string]
        [parameter(mandatory=$true)]
        $ADConnectorName
    )

    $timezone = [TimeZoneInfo]::Local
    ReportOutput -PropertyName 'Sync Server TimeZone' -PropertyValue $timezone.DisplayName

    DiagnosePasswordHashSyncHelper -ADConnectorName $ADConnectorName
}

Function DiagnosePasswordHashSync
{
    DiagnosePasswordHashSyncHelper

    Write-Host "`r`n"

    do
    {
        $answer = Read-Host "Did you find Password Hash Sync General Diagnostics helpful? [y/n]"
    } 
    while(($answer -ne 'y') -and ($answer -ne 'Y') -and ($answer -ne 'n') -and ($answer -ne 'N'))

    WriteEventLog($EventIdIsPwdSyncGeneralDiagnosticsHelpful)($EventMsgIsPwdSyncGeneralDiagnosticsHelpful -f $answer)
}

#
# Diagnose Password Hash Sync - composed of 3 parts
# 
#    + Password hash sync configurations
#    + Connectivity to each AD Forest
#    + Single Object Issues
#
# This function is the point of entry for diagnosing password hash sync issues
#
Function DiagnosePasswordHashSyncHelper
{
    param
    (
        [string]
        [parameter(mandatory=$false)]
        $ADConnectorName = [string]::Empty
    )

    WriteEventLog($EventIdPwdSyncTroubleshootingRun)($EventMsgPwdSyncTroubleshootingRun)

    # Check if Staging Mode is enabled
    $isStagingModeEnabled = IsStagingModeEnabled
    if ($isStagingModeEnabled -eq $true)
    {
        WriteEventLog($EventIdStagingModeEnabled)($EventMsgStagingModeEnabled)

        "Staging mode is enabled. Password Hash Synchronization does not work when staging mode is enabled." | ReportError
        return
    }

    # Get AD Connectors

    if (-not [string]::IsNullOrEmpty($ADConnectorName))
    {
        $adConnectors = GetADConnectorByName -ADConnectorName $ADConnectorName
    }
    else
    {
        $adConnectors = GetADConnectors
    }

    if ($adConnectors -eq $null)
    {
        "No AD Connector is found. Password Hash Synchronization does not work in the absence of AD Connectors." | ReportError
        return
    }

    # Get AAD Connector
    $aadConnector = GetAADConnector
    if ($aadConnector -eq $null)
    {
        "No AAD Connector is found. Password Hash Synchronization does not work in the absence of AAD Connector." | ReportError
        return
    }

    # AAD Tenant Name
    $aadTenantName = GetAADTenantName($aadConnector)

    Write-Host "`r`n"

    Write-Host "========================================================================"
    Write-Host "=                                                                      ="
    Write-Host "=            Password Hash Synchronization General Diagnostics         ="
    Write-Host "=                                                                      ="
    Write-Host "========================================================================"

    Write-Host "`r`n"

    Write-Host "AAD Tenant - $aadTenantName"

    if (-not $isNonInteractiveMode)
    {
        # Password Hash Sync Cloud Configuration
        $passwordHashSyncCloudConfiguration = GetPasswordHashSyncCloudConfiguration($aadConnector)
        if ($passwordHashSyncCloudConfiguration -eq $true)
        {
            "Password Hash Synchronization cloud configuration is enabled" | ReportOutput
        }
        else
        {
            "Password Hash Synchronization cloud configuration is disabled" | ReportError
        }
    }


    Write-Host "`r`n"

    #
    # Password Hash Sync Local Configuration
    #
    # Enabled  - there is one or more AD Connectors enabled for password hash sync
    # Disabled - all AD Connectors are disabled for password hash sync
    #
    $passwordHashSyncLocalConfiguration = $false

    # Check Password Hash Sync AWS API Call Failures 
    CheckLatestPasswordSyncAWSCallFailureEvents

    Write-Host "`r`n"

    #
    # Check if password hash sync agent continuously fails to compute MD5 decryption key.
    #
    IsPersistentMD5Failure

    #
    # Check if verbose logging for password hash sync is turned on
    #
    CheckVerboseLoggingForPHS

    #
    # Per AD Connector Password Hash Sync Status
    # 
    foreach ($adConnector in $adConnectors)
    {
        # AD Connector password hash sync configuration
        $adConnectorPasswordSyncConfig = GetADConnectorPasswordSyncConfiguration($adConnector)
        
        # AD Connector latest heartbeat (ping) event in the last 3 hours
        $adConnectorLatestPingEvent = GetADConnectorLatestPingEvent($adConnector)

        Write-Host "`r`n"
        Write-Host "AD Connector - $($adConnector.Name)"

        if ($adConnectorPasswordSyncConfig.Enabled -eq $true)
        {
            "Password Hash Synchronization is enabled" | ReportOutput 

            if ($adConnectorLatestPingEvent -eq $null)
            {
                WriteEventLog($EventIdConnectorNoHeartBeat)($EventMsgConnectorNoHeartBeat -f ($adConnector.Name))

                #
                # Check if password hash sync agent continuously gets health task failures
                #
                # AWS is pinged through password hash sync health task. The failures in this category are the ones 
                # prior to making an AWS API call for the ping.
                #
                IsPersistentHealthTaskFailure($adConnector)

                # AD Connector latest password hash sync activity event in the last 2 hours
                $adConnectorPasswordHashSyncLatestActivityEvent = GetADConnectorPasswordHashSyncLatestActivityEvent($adConnector)

                #
                # Password Hash Synchronization events 609, 610 and 615 are about stopping the password hash sync channel for the AD Connector.
                #
                # 609 and 610 indicates that there is an intentional attempt to stop the channel. When the channel is stopped intentionally,
                # AD Connector configuration is modified as password hash sync disabled. Therefore, it is NOT very likely to see these events 
                # here as there is already a check for the AD Connector password hash sync configuration above.
                #
                # 615 indicates that the channel stopped due to an exception.
                #
                if ($adConnectorPasswordHashSyncLatestActivityEvent -eq $null -or 
                    $adConnectorPasswordHashSyncLatestActivityEvent.InstanceId -eq 609 -or
                    $adConnectorPasswordHashSyncLatestActivityEvent.InstanceId -eq 610 -or
                    $adConnectorPasswordHashSyncLatestActivityEvent.InstanceId -eq 615)
                {
                    WriteEventLog($EventIdConnectorPwdSyncStopped)($EventMsgConnectorPwdSyncStopped -f ($adConnector.Name))

                    "Password Hash Synchronization is NOT running for AD Connector: $($adConnector.Name)" | ReportError
                    Write-Host "`r`n"

                    if (-not $isNonInteractiveMode)
                    {
                        do
                        {
                            $confirmation = Read-Host "Would you like to RESTART password hash synchronization for AD Connector: $($adConnector.Name)? [y/n]"

                            if (($confirmation -eq 'y') -or ($confirmation -eq 'Y'))
                            {
                                Write-Host "Restarting..."
                                RestartADConnectorPasswordHashSyncChannel($adConnector)($aadConnector)

                                Write-Host "`r`n"
                                break
                            }
                        } while(($confirmation -ne 'n') -or ($confirmation -ne 'N'))
                    }
                }
                else
                {
                    WriteEventLog($EventIdPwdSyncActivityWithoutHeartbeat)($EventMsgPwdSyncActivityWithoutHeartbeat -f ($adConnector.Name))
                }
            }
            else
            {
                $adConnectorLatestPingDateTime = GetDateTimeLocaleEnUs($adConnectorLatestPingEvent.TimeGenerated)
                "Latest Password Hash Synchronization heartbeat is detected at: $adConnectorLatestPingDateTime UTC" | 
                ReportOutput -PropertyName 'Latest PHS heartbeat detected at' -PropertyValue "$adConnectorLatestPingDateTime UTC"
                
            }
        }
        else
        {
            "Password Hash Synchronization is disabled" | ReportError
            continue
            Write-Host "`r`n"
        }

        $passwordHashSyncLocalConfiguration = $passwordHashSyncLocalConfiguration -or $adConnectorPasswordSyncConfig.Enabled

        # Diagnose connectivity for each AD forest
        DiagnoseADConnectivity($adConnector)
    }

    # Check if password hash sync local and cloud configurations are same. Skip comparing configuration in Non-Interactive mode. Since ASC already has config values.
    if ((-not $isNonInteractiveMode) -and ($passwordHashSyncLocalConfiguration -ne $passwordHashSyncCloudConfiguration))
    {
        WriteEventLog($EventIdPwdSyncLocalAndCloudConfigDifferent)($EventMsgPwdSyncLocalAndCloudConfigDifferent -f ($passwordHashSyncLocalConfiguration, $passwordHashSyncCloudConfiguration))

        if ($passwordHashSyncLocalConfiguration -eq $true -and $passwordHashSyncCloudConfiguration -eq $false)
        {
            WriteEventLog($EventIdPwdSyncLocalEnabledAndCloudDisabled)($EventMsgPwdSyncLocalAndCloudConfigDifferent -f ($passwordHashSyncLocalConfiguration, $passwordHashSyncCloudConfiguration))
        }
        elseif ($passwordHashSyncLocalConfiguration -eq $false -and $passwordHashSyncCloudConfiguration -eq $true)
        {
            WriteEventLog($EventIdPwdSyncLocalDisabledAndCloudEnabled)($EventMsgPwdSyncLocalAndCloudConfigDifferent -f ($passwordHashSyncLocalConfiguration, $passwordHashSyncCloudConfiguration))
        }
        elseif ($passwordHashSyncCloudConfiguration -eq $null)
        {
            WriteEventLog($EventIdPwdSyncCloudConfigNull)($EventMsgPwdSyncLocalAndCloudConfigDifferent -f ($passwordHashSyncLocalConfiguration, $passwordHashSyncCloudConfiguration))
        }

        Write-Host "`r`n"
        "Password Hash Synchronization local and cloud configurations are different" | ReportError
        return
    }
    elseif ($passwordHashSyncLocalConfiguration -eq $false)
    {
        WriteEventLog($EventIdPwdSyncLocalConfigDisabled)($EventMsgPwdSyncLocalConfigDisabled)

        Write-Host "`r`n"
        ReportWarning "Password Hash Synchronization is disabled for all AD Connectors"
        ReportWarning "In order to synchronize passwords, you need to enable Password Hash Synchronization from AADConnect Wizard"
        return
    }

    Write-Host "`r`n"
}
# SIG # Begin signature block
# MIIjnQYJKoZIhvcNAQcCoIIjjjCCI4oCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBlMPn63xvBib3y
# yqbhBaqpgf5G4evDg2UF7y3748N/NqCCDY0wggYLMIID86ADAgECAhMzAAABk0OF
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
# zKRdwaGIm1dxVk5IRcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIVZjCCFWIC
# AQEwgZUwfjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYG
# A1UEAxMfTWljcm9zb2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAZNDhb61
# Du616AAAAAABkzANBglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYB
# BAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0B
# CQQxIgQg7acRP/JCqxqyY7J+GEIIerCnt9rcq4abN9Ysvkd3ug0wQgYKKwYBBAGC
# NwIBDDE0MDKgFIASAE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbTANBgkqhkiG9w0BAQEFAASCAQDe1z+ess8IGcADsckaOrYlJEng
# knnOaAV0Qgh3BfitzugjT8CqQsRD3Z8nQVgsNhSRF4BTGiEv4OVhX8Oto5iYHjgX
# d+elsj+JFou25zaa2S+eSDuXMEFRkzFxYxLTSQHyiEaYa78xX1WSRuZITTUcM/rN
# WBdRwOqeV2Wa994daLFSAj6sAIxTy26PoRGbklT1SegUctt/yYW0qY1a4c/DyJsO
# /Mjv2a9ANc+0fBt9r7zcim+ebxsu/JwjU5f2H2HOO6KeWR0VC8xBjdVFInHqwIbO
# r/w5m9yMVNw2r9PN1x1D/DNrPIxn28JIDKUoU6Ld1xwSSV8SjTbdFb0/PNR7oYIS
# 8DCCEuwGCisGAQQBgjcDAwExghLcMIIS2AYJKoZIhvcNAQcCoIISyTCCEsUCAQMx
# DzANBglghkgBZQMEAgEFADCCAVQGCyqGSIb3DQEJEAEEoIIBQwSCAT8wggE7AgEB
# BgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEICJl38WefM6/+j27CJ9YKsXE
# 0raONmUHK+eRpssEAvzTAgZfFz76Hh8YEjIwMjAwNzI1MDcyNjA1LjAyWjAEgAIB
# 9KCB1KSB0TCBzjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEp
# MCcGA1UECxMgTWljcm9zb2Z0IE9wZXJhdGlvbnMgUHVlcnRvIFJpY28xJjAkBgNV
# BAsTHVRoYWxlcyBUU1MgRVNOOkY3N0YtRTM1Ni01QkFFMSUwIwYDVQQDExxNaWNy
# b3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIORDCCBPUwggPdoAMCAQICEzMAAAEq
# 6BeW+Ian76MAAAAAASowDQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3Rh
# bXAgUENBIDIwMTAwHhcNMTkxMjE5MDExNTAyWhcNMjEwMzE3MDExNTAyWjCBzjEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEpMCcGA1UECxMgTWlj
# cm9zb2Z0IE9wZXJhdGlvbnMgUHVlcnRvIFJpY28xJjAkBgNVBAsTHVRoYWxlcyBU
# U1MgRVNOOkY3N0YtRTM1Ni01QkFFMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1T
# dGFtcCBTZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn9+V
# gaSF0m3FKwcG72WZcX9RfE8XsvjmcSGa13TUoOixZtjzLngE3v6T0My/OpOg/f2/
# z9n420TMqPwF/kRCgbX+kl+nMIl7zQdmrKoyjShD0S6BVjpg1U1rZPW7nV33qrWE
# Wa7V2DG3y4PaDsikFB2FLa2lzePccTMq9X+/ASvv8FxO7CpQequsGAdz3vV6lVHi
# jls0qyOKRrCYzD0P+3KtNyLLcX0ar2kSCTwSol850BpuRqe4BZOOWYGFm1GI71bW
# oWnCe70bmpW900pErFB23EwLTilYZ+fHMNpzv6MiqXnfYgQLlBKe9jzizMSnHDfV
# Bb8tp9KIOYC1hYembwIDAQABo4IBGzCCARcwHQYDVR0OBBYEFHD0xS10Kz+uE3bL
# 0SQTpkj07xNpMB8GA1UdIwQYMBaAFNVjOlyKMZDzQ3t8RhvFM2hahW1VMFYGA1Ud
# HwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3By
# b2R1Y3RzL01pY1RpbVN0YVBDQV8yMDEwLTA3LTAxLmNybDBaBggrBgEFBQcBAQRO
# MEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2Vy
# dHMvTWljVGltU3RhUENBXzIwMTAtMDctMDEuY3J0MAwGA1UdEwEB/wQCMAAwEwYD
# VR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZIhvcNAQELBQADggEBAIrANPQKcdWjjo5b
# JRus8iPxAhx/49OMFVikqDUrYPXlnrES6+Z/6Kzo3yCP1/WeQUgAu+H6IaTHwaAZ
# r+gD0iFc0QVg80VofAdqf9QTDU/pON1qrLdy8sLx/zMTUJHUuFc2h+rrF+hP0csY
# VKD2yQ8szVND5EBBf0yKASbwUWWGGxDWIYHXf33Hx33aH0qymoYOc73pn0CPs5sO
# 11TpGhmuxmSJFA2deadfUj5G7C0u7ww3xeEktKXnCqoczeuppoy9IAhJW0rJKnMk
# LlmH7mQmWoV1KIgdbxD7xHoRYbwgtv09/7D8/J3IrdlORVdSkUD4mFaNzLOmFUbD
# 19+PRgowggZxMIIEWaADAgECAgphCYEqAAAAAAACMA0GCSqGSIb3DQEBCwUAMIGI
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylN
# aWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0xMDA3
# MDEyMTM2NTVaFw0yNTA3MDEyMTQ2NTVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqR0NvHcRijog
# 7PwTl/X6f2mUa3RUENWlCgCChfvtfGhLLF/Fw+Vhwna3PmYrW/AVUycEMR9BGxqV
# Hc4JE458YTBZsTBED/FgiIRUQwzXTbg4CLNC3ZOs1nMwVyaCo0UN0Or1R4HNvyRg
# MlhgRvJYR4YyhB50YWeRX4FUsc+TTJLBxKZd0WETbijGGvmGgLvfYfxGwScdJGcS
# chohiq9LZIlQYrFd/XcfPfBXday9ikJNQFHRD5wGPmd/9WbAA5ZEfu/QS/1u5ZrK
# sajyeioKMfDaTgaRtogINeh4HLDpmc085y9Euqf03GS9pAHBIAmTeM38vMDJRF1e
# FpwBBU8iTQIDAQABo4IB5jCCAeIwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYE
# FNVjOlyKMZDzQ3t8RhvFM2hahW1VMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBB
# MAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP
# 6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWlj
# cm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2
# LTIzLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMu
# Y3J0MIGgBgNVHSABAf8EgZUwgZIwgY8GCSsGAQQBgjcuAzCBgTA9BggrBgEFBQcC
# ARYxaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL1BLSS9kb2NzL0NQUy9kZWZhdWx0
# Lmh0bTBABggrBgEFBQcCAjA0HjIgHQBMAGUAZwBhAGwAXwBQAG8AbABpAGMAeQBf
# AFMAdABhAHQAZQBtAGUAbgB0AC4gHTANBgkqhkiG9w0BAQsFAAOCAgEAB+aIUQ3i
# xuCYP4FxAz2do6Ehb7Prpsz1Mb7PBeKp/vpXbRkws8LFZslq3/Xn8Hi9x6ieJeP5
# vO1rVFcIK1GCRBL7uVOMzPRgEop2zEBAQZvcXBf/XPleFzWYJFZLdO9CEMivv3/G
# f/I3fVo/HPKZeUqRUgCvOA8X9S95gWXZqbVr5MfO9sp6AG9LMEQkIjzP7QOllo9Z
# Kby2/QThcJ8ySif9Va8v/rbljjO7Yl+a21dA6fHOmWaQjP9qYn/dxUoLkSbiOewZ
# SnFjnXshbcOco6I8+n99lmqQeKZt0uGc+R38ONiU9MalCpaGpL2eGq4EQoO4tYCb
# IjggtSXlZOz39L9+Y1klD3ouOVd2onGqBooPiRa6YacRy5rYDkeagMXQzafQ732D
# 8OE7cQnfXXSYIghh2rBQHm+98eEA3+cxB6STOvdlR3jo+KhIq/fecn5ha293qYHL
# pwmsObvsxsvYgrRyzR30uIUBHoD7G4kqVDmyW9rIDVWZeodzOwjmmC3qjeAzLhIp
# 9cAvVCch98isTtoouLGp25ayp0Kiyc8ZQU3ghvkqmqMRZjDTu3QyS99je/WZii8b
# xyGvWbWu3EQ8l1Bx16HSxVXjad5XwdHeMMD9zOZN+w2/XU/pnR4ZOC+8z1gFLu8N
# oFA12u8JJxzVs341Hgi62jbb01+P3nSISRKhggLSMIICOwIBATCB/KGB1KSB0TCB
# zjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEpMCcGA1UECxMg
# TWljcm9zb2Z0IE9wZXJhdGlvbnMgUHVlcnRvIFJpY28xJjAkBgNVBAsTHVRoYWxl
# cyBUU1MgRVNOOkY3N0YtRTM1Ni01QkFFMSUwIwYDVQQDExxNaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQDqsuasofIgw/vp4+XfbXEp
# Qndhf6CBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqG
# SIb3DQEBBQUAAgUA4sZanzAiGA8yMDIwMDcyNTExMTU0M1oYDzIwMjAwNzI2MTEx
# NTQzWjB3MD0GCisGAQQBhFkKBAExLzAtMAoCBQDixlqfAgEAMAoCAQACAh4WAgH/
# MAcCAQACAhGMMAoCBQDix6wfAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQB
# hFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEA
# WmLelcWYkaEARB8tFkkcns5VHS1Imfk9dX+d+RhA9l1K26IEW+0G5DIYcPmaSt+z
# eBnxat2XCvGfC/cBPv4i7pF0wRfcd0DM2OSW4XqH8BjyaE+kkxWaRAbf2KCqJPhl
# x/TXNMd2CW4/2oQbHNp56IeWiivPiPYM3NHKV1tScZkxggMNMIIDCQIBATCBkzB8
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1N
# aWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAASroF5b4hqfvowAAAAAB
# KjANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEE
# MC8GCSqGSIb3DQEJBDEiBCCW25gVSciLz4u8NcC4jNT00duA5l+Ci02sT+e1uggQ
# sTCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIEOYNYRa9zp+Gzm3haijlD4U
# wUJxoiBXjJQ/gKm4GYuZMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAEq6BeW+Ian76MAAAAAASowIgQgcbHfCrRRh0WbPsAliFJziL7R
# WgtIBA3EuOXDF8jzLckwDQYJKoZIhvcNAQELBQAEggEAmpFTqRcsneugDGEMCbLc
# OAnNLfdwf5ZjxoytXerNAber1JmseydafJIHjTlWRvmVziE+5z4JxvVjQt745mYB
# +Es1uDgvEgFsB6HVqk5BQl00HFboZdjrsfS/fUWa2oQCXVP1AsNDFcgVznYNmIQK
# UbNm/4CYPcDPPAVujbvDPXIIdMS3xL+A0m4C4ug3lTN7XxN8RszwMvv861OhB8vP
# pCNkS8Y8GSuDt1DCieuVsfZB+0rGbRQy6+ivF7HtZhumpzuFKnDUu1InSOUh8lFw
# 3Hwn1a5DUcR6IO+MMKqR0rZBij0fWwm/q8UDh40sxFgOJ6AB3RiaqpCwFG7NPl2m
# uQ==
# SIG # End signature block
