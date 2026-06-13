<#
.SYNOPSIS
  PowerShell 2.0 must be disabled
  Windows PowerShell 2.0 was disabled to prevent downgrade attacks that could bypass modern logging and security controls.
  This ensures that only newer, more secure PowerShell versions are available for use.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000155

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-00-000155).ps1 
#>

$ps2Features = Get-WindowsOptionalFeature -Online | Where-Object {
    $_.FeatureName -like "*PowerShellV2*"
}

foreach ($feature in $ps2Features) {
    if ($feature.State -ne "Disabled") {
        Disable-WindowsOptionalFeature -Online -FeatureName $feature.FeatureName -NoRestart
    }
}
