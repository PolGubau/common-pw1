# optimize-images.ps1

param (
    [string]$folderPath = ".",   # Carpeta a optimizar
    [string]$outputFolder = "optimized", # Carpeta de salida
    [int]$quality = 85          # Calidad de la imagen optimizada
)

# Crear la carpeta de salida si no existe
if (-not (Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Force -Path $outputFolder
}

# Buscar todas las imágenes en la carpeta (JPG, PNG, GIF, etc.)
$images = Get-ChildItem -Path $folderPath -Include *.jpg, *.png, *.gif -File

foreach ($image in $images) {
    $outputPath = Join-Path -Path $outputFolder -ChildPath $image.Name

    # Optimizar la imagen
    magick $image.FullName -quality $quality $outputPath

    Write-Host "Optimizada: $($image.Name) -> $outputPath"
}

# USAGE:
# Optimizar imágenes en la carpeta actual
# .\utils\optimize-images.ps1 -folderPath "C:\MisImágenes"

# Optimizar imágenes en la carpeta "assets" y guardarlas en "output"
# .\utils\optimize-images.ps1 -folderPath "C:\MiProyecto\assets" -outputFolder "C:\MiProyecto\output"
