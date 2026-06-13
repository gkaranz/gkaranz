<#
.SYNOPSIS
    “Microsoft Defender SmartScreen for Explorer must be enabled”
    Microsoft Defender SmartScreen was not enabled, increasing the risk of executing malicious or untrusted downloaded files.
    The system was remediated by enabling SmartScreen and configuring it to block untrusted applications via registry-based policy settings.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000210


.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000210).ps1 
#>

# Create required registry path
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force | Out-Null

# Enable SmartScreen
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
  -Name "EnableSmartScreen" `
  -Value 1 `
  -PropertyType DWord `
  -Force

# Set to "Warn and prevent bypass" (Block)
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
  -Name "ShellSmartScreenLevel" `
  -Value "Block" `
  -PropertyType String `
  -Force
