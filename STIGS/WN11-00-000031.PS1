<#
.SYNOPSIS
  BitLocker must require pre-boot authentication
  BitLocker pre-boot authentication policies were not fully configured, which could allow unauthorized access to encrypted data. 
  The system was remediated by enabling advanced startup authentication and enforcing TPM with PIN requirements through registry-based Group Policy settings. 
  This ensures compliance with STIG requirements for secure pre-boot authentication.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000031


.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-00-000031).ps1 
#>

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" -Force

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" `
-Name "UseAdvancedStartup" -Value 1 -PropertyType DWord -Force

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" `
-Name "UseTPMPIN" -Value 1 -PropertyType DWord -Force

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FVE" `
-Name "UseTPM" -Value 2 -PropertyType DWord -Force
