<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).
    The Application event log maximum size was not configured in accordance with STIG requirements, which could result in loss of audit data. 
    The system was remediated by defining the maximum log size via registry-based policy settings, ensuring sufficient capacity for event logging.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AU-000500).ps1 
#>

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Force | Out-Null

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" `
  -Name "MaxSize" `
  -Value 0x8000 `
  -PropertyType DWord `
  -Force
