param (
    [string]$scriptName
)

switch ($scriptName) {
    "resize" { .\imagenes\resize.ps1 }
    "compress" { .\imagenes\compress.ps1 }
    "copy" { .\archivos\copy.ps1 }
    default { Write-Host "Script no encontrado." }
}