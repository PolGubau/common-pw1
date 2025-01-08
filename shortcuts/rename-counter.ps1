# Shortcut para renombrar archivos
param (
    [string]$folderPath = ".",
    [string]$prefix = "new_",
    [string]$extension = "*.jpg"
)

$scriptPath = Join-Path $PSScriptRoot "..\image-tools\batch-rename.ps1"
& $scriptPath -folderPath $folderPath -prefix $prefix -extension $extension
