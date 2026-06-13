<#
.SYNOPSIS
  Cached logons must be limited
  Cached logon credentials were not limited, allowing excessive storage of user credentials on the system.
  The system was remediated by restricting the number of cached logons to four via registry configuration, reducing the risk of credential compromise.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000085

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000085).ps1 
#>

New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force | Out-Null

New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" `
-Name "CachedLogonsCount" `
-Value "4" `
-PropertyType String `
-Force

gpupdate /force
