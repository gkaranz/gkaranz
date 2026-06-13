<#
.SYNOPSIS
  Do not enumerate local users
  Local user enumeration was enabled, potentially exposing account information to unauthorized users.
  The system was remediated by disabling the enumeration of local users through policy-based registry configuration.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000130

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000130).ps1 
#>

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force | Out-Null

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
-Name "EnumerateLocalUsers" `
-Value 0 `
-PropertyType DWord `
-Force

gpupdate /force
