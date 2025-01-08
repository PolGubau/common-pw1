param(
    [string]$path = ".",
    [string]$extension = ".tsx"
)

# Inicializar contador de líneas
$totalLines = 0

# Obtener todos los archivos y subdirectorios
$items = Get-ChildItem -Path $path -Recurse -File

foreach ($item in $items) {
    # Excluir carpetas node_modules y .git
    if ($item.FullName -match 'node_modules|\.git') {
        continue
    }

    # Si el archivo tiene la extensión correcta
    if ($item.Extension -eq $extension) {
        Write-Host "Procesando archivo: $($item.FullName)"
        $lines = (Get-Content $item.FullName).Count
        $totalLines += $lines
        Write-Host "Archivo: $($item.FullName) - Líneas: $lines"
    }
}

# Mostrar el total de líneas
Write-Host "Lines total: $totalLines (in ${extension} files)"
