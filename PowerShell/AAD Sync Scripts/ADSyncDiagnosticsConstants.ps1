#-------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation.  All rights reserved.
#-------------------------------------------------------------------------

#region Object Synchronization Diagnostic Options

Set-Variable DiagnoseObjectSyncIssues                   "Diagnose Object Synchronization Issues"                                          -Option Constant -Scope global

Set-Variable DiagnoseAttributeSyncIssues                "Diagnose Attribute Synchronization Issues"                                          -Option Constant -Scope global

Set-Variable ChangePrimaryEmailAddress                  "Changing Exchange Online Primary Email Address"                                  -Option Constant -Scope global

Set-Variable HideFromGlobalAddressList                  "Hiding Mailbox from Exchange Online Global Address List"                         -Option Constant -Scope global

Set-Variable ADConnectorAccountReadPermissions          "Check AD Connector Account Read Permissions"                                     -Option Constant -Scope global

Set-Variable DiagnoseGroupMembershipSyncIssues          "Diagnose Group Membership Synchronization Issues"                                -Option Constant -Scope global               

#endregion



#region Synchronization Issues

Set-Variable UPNMismatchNonVerifiedUpnSuffixIssue       "UPN Mismatch due to Non-Verified UPN Suffix"                                     -Option Constant -Scope global

Set-Variable UPNMismatchFederatedDomainChangeIssue      "UPN Mismatch due to Federated Domain Change"                                     -Option Constant -Scope global

Set-Variable UPNMismatchDirSyncFeatureIssue             "UPN Mismatch due to Disabled -SynchronizeUpnForManagedUsers- Tenant Feature"     -Option Constant -Scope global 

Set-Variable DomainFilteringIssue                       "Domain Filtering"                                                                -Option Constant -Scope global

Set-Variable OuFilteringIssue                           "Organization Unit (OU) Filtering"                                                -Option Constant -Scope global

Set-Variable LinkedMailboxIssue                         "Linked Mailbox"                                                                  -Option Constant -Scope global

Set-Variable DynamicDistributionGroupIssue              "Dynamic Distribution Group"                                                      -Option Constant -Scope global

Set-Variable CloudOwnedAttributeIssue                   "Cloud owned attributes found"                                                    -Option Constant -Scope global

#endregion



#region Html Report

Set-Variable HtmlTitle                                  "Azure AD Connect: Object Synchronization Diagnostics"    -Option Constant -Scope global

Set-Variable HtmlObjectDistinguishedNameSectionTitle    "Object Distinguished Name"                               -Option Constant -Scope global

Set-Variable HtmlSynchronizationIssuesSectionTitle      "Synchronization Issues"                                  -Option Constant -Scope global

Set-Variable HtmlObjectDetailsSectionTitle              "Object Details"                                          -Option Constant -Scope global

Set-Variable HtmlAttributeDetailsSectionTitle           "Attribute Details"                                       -Option Constant -Scope global

Set-Variable HtmlADObjectTitle                          "On-Premises Active Directory"                            -Option Constant -Scope global

Set-Variable HtmlAADConnectObjectTitle                  "AADConnect Database"                                     -Option Constant -Scope global

Set-Variable HtmlAzureADObjectTitle                     "Azure AD"                                                -Option Constant -Scope global

Set-Variable HtmlADObjectType                           "AD Object"                                               -Option Constant -Scope global

Set-Variable HtmlAADConnectObjectType                   "AADConnect Object"                                       -Option Constant -Scope global

Set-Variable HtmlAzureADObjectType                      "Azure AD Object"                                         -Option Constant -Scope global

Set-Variable HtmlADAttributesComparisonTitle            "AD Attributes Comparison"                                -Option Constant -Scope global

#endregion



#region urls

Set-Variable DomainBasedFilteringUrl                    "https://go.microsoft.com/fwlink/?linkid=866237"          -Option Constant -Scope global
Set-Variable DomainBasedFilteringText                   "domain based filtering"                                  -Option Constant -Scope global

Set-Variable OuBasedFilteringUrl                        "https://go.microsoft.com/fwlink/?linkid=866235"          -Option Constant -Scope global
Set-Variable OuBasedFilteringText                       "organizational unit based filtering"                     -Option Constant -Scope global

Set-Variable ConvertLinkedMailboxUrl                    "https://go.microsoft.com/fwlink/?linkid=871132"          -Option Constant -Scope global
Set-Variable ConvertLinkedMailboxText                   "convert linked mailbox"                                  -Option Constant -Scope global

Set-Variable InstallationUrl                            "https://go.microsoft.com/fwlink/?linkid=871127"          -Option Constant -Scope global
Set-Variable InstallationText                           "installation of Azure AD Connect"                        -Option Constant -Scope global

Set-Variable TopologiesUrl                              "https://go.microsoft.com/fwlink/?linkid=871130"          -Option Constant -Scope global
Set-Variable TopologiesText                             "topologies for Azure AD Connect"                         -Option Constant -Scope global

Set-Variable UPNMismatchUrl                             "https://go.microsoft.com/fwlink/?linkid=866335"          -Option Constant -Scope global
Set-Variable UPNMismatchText                            "upn mismatch - SynchronizeUpnForManagedUsers feature"    -Option Constant -Scope global

Set-Variable FederatedDomainChangeUrl                   "https://go.microsoft.com/fwlink/?linkid=866304"          -Option Constant -Scope global
Set-Variable FederatedDomainChangeText                  "upn mismatch - federated domain change"                  -Option Constant -Scope global

Set-Variable CloudUPNPopulationUrl                      "https://go.microsoft.com/fwlink/?linkid=867477"          -Option Constant -Scope global
Set-Variable CloudUPNPopulationText                     "Azure AD userprincipalname population"                   -Option Constant -Scope global

Set-Variable VerifyDomainNameUrl                        "https://go.microsoft.com/fwlink/?linkid=862773"          -Option Constant -Scope global
Set-Variable VerifyDomainNameText                       "Add a custom domain name to Azure Active Directory"      -Option Constant -Scope global

Set-Variable SetUPNCmdletUrl                            "https://go.microsoft.com/fwlink/?linkid=866303"          -Option Constant -Scope global
Set-Variable SetUPNCmdletText                           "Set-MsolUserPrincipalName"                               -Option Constant -Scope global

Set-Variable AlternativeUPNSuffixUrl                    "https://go.microsoft.com/fwlink/?linkid=862772"          -Option Constant -Scope global
Set-Variable AlternativeUPNSuffixText                   "alternative upn suffix"                                  -Option Constant -Scope global

Set-Variable ExtendSchemaUrl                            "https://go.microsoft.com/fwlink/?linkid=2000703"         -Option Constant -Scope global
Set-Variable ExtendSchemaText                           "extend the active directory schema"                      -Option Constant -Scope global

Set-Variable RefreshSchemaUrl                           "https://go.microsoft.com/fwlink/?linkid=2000602"         -Option Constant -Scope global
Set-Variable RefreshSchemaText                          "aadconnect wizard - refresh directory schema"            -Option Constant -Scope global

Set-Variable AzurePortalSupportBladeUrl                 "https://go.microsoft.com/fwlink/?linkid=874619"          -Option Constant -Scope global
Set-Variable AzurePortalSupportBladeText                "microsoft azure portal help and support"                 -Option Constant -Scope global

Set-Variable OfficePortalUrl                            "https://go.microsoft.com/fwlink/?linkid=874624"          -Option Constant -Scope global
Set-Variable OfficePortalText                           "office 365 portal"                                       -Option Constant -Scope global   
  
#endregion



#region On-Premises AD Object Attributes

Set-Variable -Option Constant -Scope global -Name ADObjectAttributes -Value @("displayname",
                                                                              "mail",
                                                                              "mailnickname",
                                                                              "msexchhidefromaddresslists",
                                                                              "msexchrecipienttypedetails",
                                                                              "proxyaddresses",
                                                                              "samaccountname",
                                                                              "useraccountcontrol",
                                                                              "userprincipalname")
#endregion



#region AD Connector Space Object Attributes

Set-Variable -Option Constant -Scope global -Name AdCsObjectAttributes -Value @("displayName",
                                                                                "mail",
                                                                                "mailNickName",
                                                                                "proxyAddresses",
                                                                                "sAMAccountName",
                                                                                "userAccountControl",
                                                                                "userPrincipalName")
#endregion



#region Metaverse Object Attributes

Set-Variable -Option Constant -Scope global -Name MvObjectAttributes -Value @("accountEnabled",
                                                                              "cloudAnchor",
                                                                              "displayName",
                                                                              "mail",
                                                                              "mailNickName",
                                                                              "proxyAddresses",
                                                                              "sourceAnchor",
                                                                              "userPrincipalName")
#endregion



#region AAD Connector Space Object Attributes

Set-Variable -Option Constant -Scope global -Name AadCsObjectAttributes -Value @("accountEnabled",
                                                                                 "alias",
                                                                                 "cloudAnchor",
                                                                                 "cloudMastered",
                                                                                 "displayName",
                                                                                 "mail",
                                                                                 "onPremisesSamAccountName",
                                                                                 "proxyAddresses",
                                                                                 "sourceAnchor",
                                                                                 "userPrincipalName")
#endregion
# SIG # Begin signature block
# MIIjngYJKoZIhvcNAQcCoIIjjzCCI4sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAfteSrD+aTO3lz
# ujMpHNr7cTZLYAgQbzeyOA6L7JI4GKCCDY0wggYLMIID86ADAgECAhMzAAABk0OF
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
# CQQxIgQgF0ZFcmSJHu5j4dhdWS0+IOOM8Iz3zrSNSp3yruUytNcwQgYKKwYBBAGC
# NwIBDDE0MDKgFIASAE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbTANBgkqhkiG9w0BAQEFAASCAQCHIsJQQXUkX5yZNbPOUjF9l6kB
# Y/g90NLgioiENuWAv0m9B0u5QfELawyz6GCVMkTqwSsVFiHHYIgd/PL2C4uAqH0A
# by/l5DWakmsHODa5O6YnUfOTenwjzh76LcC6YVUW2Y5GES+GgP0+H5xZLobaGk/+
# AodQUBXttzoN8Fms6uh0b+rgSkzD2BJ8nFWNshFEvBbSZjblBDFla5TbOut7HcKi
# pIQSromhjOp3HTFH8IhUGLBuPLTS1yrg0efcM5hMjjXErVVXE6PTKtCu/FKfFWfm
# ekX4zcD/xr3oPUpkrDiiTG0JPOKbl6EawcCprjSrUos6Ek5Ekc+YX0xkxmdxoYIS
# 8TCCEu0GCisGAQQBgjcDAwExghLdMIIS2QYJKoZIhvcNAQcCoIISyjCCEsYCAQMx
# DzANBglghkgBZQMEAgEFADCCAVUGCyqGSIb3DQEJEAEEoIIBRASCAUAwggE8AgEB
# BgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIOkmlMs52T89IIns4CdFOY6O
# ISqBx7xMqun4GFhUkP+nAgZfFz76HRIYEzIwMjAwNzI1MDcyNTM4LjY0M1owBIAC
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
# BDAvBgkqhkiG9w0BCQQxIgQgqgGtJfgXDX5KdHuGXCgXVzRg2g08UggV5RZ6WOoj
# LfUwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCBDmDWEWvc6fhs5t4Woo5Q+
# FMFCcaIgV4yUP4CpuBmLmTCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAABKugXlviGp++jAAAAAAEqMCIEIHGx3wq0UYdFmz7AJYhSc4i+
# 0VoLSAQNxLjlwxfI8y3JMA0GCSqGSIb3DQEBCwUABIIBADc2WhvfDY/uO0djbMiK
# 1VQbkS/L/qGp9TCm3tOKvF33yur3Sk7douPCcE2J2aa7lr2qYw0gi7VSfGepU+Qs
# 9OjhB+tpVAqyOyAHa3S6s+iLi2IJ7nlJ74AIUJHkQNIvMovVe3KSQVBtyE6Vy+oa
# fg2UGu/7p6O8h94okDcsEaKd+1zUzoAMlOzychtsIx8mtDGKdfyjKTMokdEUaQzP
# HiRbw9zVd6v2XPShdWK/0nFqBIf8XIK/avOLTsu637tN2rUloSNBW3Zx6cdJB8c3
# nFdPGxkgmqjUORTwUA8ZLOLBdePcw1/tkNB/mQ/5LbJzXE+VGUR9hwMmfAQ4PSxT
# 3aQ=
# SIG # End signature block
