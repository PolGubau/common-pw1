# batch-rename.ps1

param (
    [string]$folderPath = ".",  # Carpeta donde están los archivos
    [string]$prefix = "new_",    # Prefijo para los archivos
    [string]$extension = "*.jpg" # Tipo de archivos a renombrar
)

# Obtener todos los archivos en la carpeta especificada
$files = Get-ChildItem -Path $folderPath -Filter $extension

$counter = 1
foreach ($file in $files) {
    $newName = "{0}{1}{2}" -f $prefix, $counter, $file.Extension
    $newPath = Join-Path -Path $folderPath -ChildPath $newName

    Rename-Item -Path $file.FullName -NewName $newName
    Write-Host "Renombrado: $($file.Name) -> $newName"

    $counter++
}

# Renombrar todas las imágenes .jpg en la carpeta actual con el prefijo "image_"
# .\utils\batch-rename.ps1 -folderPath "C:\MisImágenes" -prefix "image_" -extension "*.jpg"