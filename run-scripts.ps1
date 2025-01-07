param (
    [string]$scriptName
)

switch ($scriptName) {
    "resize" { .\imgs\resize.ps1 }
    "compress" { .\imgs\compress.ps1 }
    "copy" { .\archivos\copy.ps1 }
    default { Write-Host "Script no encontrado." }
}