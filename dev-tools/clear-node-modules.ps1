# clear-node-modules.ps1

param (
    [string]$projectPath = "."  # Ruta del proyecto (por defecto es el directorio actual)
)

# Eliminar node_modules
$nodeModulesPath = Join-Path -Path $projectPath -ChildPath "node_modules"
if (Test-Path $nodeModulesPath) {
    Remove-Item -Path $nodeModulesPath -Recurse -Force
    Write-Host "Eliminado node_modules en $projectPath"
} else {
    Write-Host "No se encontró node_modules en $projectPath"
}

# Eliminar node_modules en el proyecto actual
# .\utils\clear-node-modules.ps1 -projectPath "C:\MiProyecto"