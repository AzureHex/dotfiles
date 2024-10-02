winfetch

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
$ENV:STARSHIP_DISTRO = "  eyes"
Invoke-Expression (&starship init powershell)

# Aliasis
Set-Alias vim nvim
Set-Alias ubuntu ubuntu2404.exe

# Networking
Set-Alias ping Test-Connection
Set-Alias ifconfig Get-NetIPAddress

# IP Address Command
function ip {
    param (
        [string]$a
    )
    if ($a -eq 'a') {
        Get-NetIPAddress
    } else {
        Write-Host "Unknown option: $a"
    }
}
