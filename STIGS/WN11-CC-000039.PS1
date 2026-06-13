<#
.SYNOPSIS
  Run as different user” must be removed
  The “Run as different user” option allows applications to be executed with alternate credentials, increasing the risk of credential exposure.
  The system was remediated by configuring suppression policies for executable file types (BAT, CMD, EXE, MSC) to disable this functionality. 
  This ensures users cannot invoke alternate credentials through the user interface, aligning with STIG requirements.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000039


.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000039).ps1 
#>

$types = @("batfile","cmdfile","exefile","mscfile")

foreach ($type in $types) {
    $path = "HKLM:\SOFTWARE\Classes\$type\shell\runasuser"
    New-Item -Path $path -Force | Out-Null

    New-ItemProperty -Path $path `
    -Name "SuppressionPolicy" `
    -Value 4096 `
    -PropertyType DWord `
    -Force
}
