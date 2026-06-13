<#
.SYNOPSIS
    PortProxy must not be enabled
    PortProxy configurations can allow unintended port forwarding and increase the risk of man-in-the-middle attacks.
    The system was remediated by clearing all existing port proxy configurations using netsh, ensuring no unauthorized forwarding rules remain.

.NOTES
    Author          : Karan
    LinkedIn        : https://www.linkedin.com/in/karan-s-9937543b3/
    GitHub          : https://github.com/gkaranz/
    Date Created    : 13/06/2026
    Last Modified   : 13/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000395

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN11-00-000395).ps1 
#>

netsh interface portproxy reset

Write-Host "✔ PortProxy cleared"
