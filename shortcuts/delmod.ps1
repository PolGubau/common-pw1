# Shortcut para eliminar node_modules
param (
    [string]$projectPath = "."
)

$scriptPath = Join-Path $PSScriptRoot "..\dev-tools\clear-node-modules.ps1"
& $scriptPath -projectPath $projectPath