winfetch

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
$ENV:STARSHIP_DISTRO = "  eyes"
Invoke-Expression (&starship init powershell)
