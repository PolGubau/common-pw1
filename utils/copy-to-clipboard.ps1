# copy-to-clipboard.ps1

param (
    [string]$text
)

# Copiar al portapapeles
Set-Clipboard -Value $text
Write-Host "Texto copiado al portapapeles: $text"


# # Copiar un texto al portapapeles
# .\utils\copy-to-clipboard.ps1 -text "Ruta de archivo: C:\MisArchivos\imagen.png"