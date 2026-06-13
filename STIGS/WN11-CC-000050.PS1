<#
.SYNOPSIS
    Hardened UNC Paths must be configured
    Hardened UNC Paths were not defined for SYSVOL and NETLOGON shares, exposing the system to potential spoofing or tampering attacks.
    The system was remediated by enforcing mutual authentication and integrity requirements through registry-based Group Policy configuration.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026  
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000050

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000050).ps1 
#>

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Force | Out-Null

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" `
  -Name "\\*\SYSVOL" `
  -Value "RequireMutualAuthentication=1,RequireIntegrity=1" `
  -PropertyType String -Force

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" `
  -Name "\\*\NETLOGON" `
  -Value "RequireMutualAuthentication=1,RequireIntegrity=1" `
  -PropertyType String -Force

Write-Host "✔ Hardened UNC Paths configured"
