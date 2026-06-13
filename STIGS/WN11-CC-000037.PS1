<#
.SYNOPSIS
  UAC restrictions for local accounts over network logons
  User Account Control (UAC) restrictions were enforced for local accounts used over network logons,
  preventing elevated privileges from being used remotely and reducing the risk of lateral movement attacks.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000037

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000037).ps1 
#>

New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force

New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
-Name "LocalAccountTokenFilterPolicy" `
-Value 0 `
-PropertyType DWord `
-Force
