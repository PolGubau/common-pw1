param (
    [string]$e = ".tsx"  # Parámetro para la extensión
)

# Llamar al script count_lines.ps1 y pasar el parámetro extension
& "C:\scripts\dev-tools\count_lines.ps1" -extension $e
