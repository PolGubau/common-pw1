



# Convertir todos los archivos .jpg a .png y borrar los originales
Get-ChildItem -Filter *.jpg | ForEach-Object {
    $newFileName = $_.FullName -replace '\.jpg$', '.png'
    magick $_.FullName -format png $newFileName
    Remove-Item $_.FullName
}

# Crear el directorio 'sized' si no existe
if (-Not (Test-Path -Path "sized")) {
    New-Item -ItemType Directory -Path "sized"
    Write-Host "Se creó la carpeta 'sized'"
}else{
    # Eliminar todos los archivos .png en la carpeta 'sized'
    Get-ChildItem -Path "sized" -Filter *.png | Remove-Item
    # explica que se eliminaron los archivos
    Write-Host "Se eliminaron todos los archivos .png en la carpeta 'sized'"
}

# Redimensionar todas las imágenes .png y moverlas a la carpeta 'sized'
Get-ChildItem -Filter *.png | ForEach-Object {
    $outputPath = "sized\$($_.BaseName).png"
    magick $_.FullName -resize 608x1080^ -gravity North -background black -extent 608x1080 -bordercolor black -border 100x100 $outputPath



}
 


# Asegúrate de que el archivo original esté comprimido
Get-ChildItem -Filter *.png | ForEach-Object {
    # Guarda el tamaño original del archivo
    $original_size = (Get-Item $_.FullName).length

    # Comprimir el archivo con ImageMagick (ajusta según tu configuración)
    magick $_.FullName -quality 90 $_.FullName

    # Obtiene el tamaño del archivo comprimido
    $new_size = (Get-Item $_.FullName).length

    # Si el archivo no se comprimió más, restaura el original
    if ($new_size -ge $original_size) {
        Write-Host "No se comprimió más $_.Name. Restaurando el original."

        # Verificar si el archivo .bak existe antes de intentar copiarlo
        $backupFile = "$($_.FullName).bak"
        if (Test-Path $backupFile) {
            # Si existe, restaurar el archivo
            Copy-Item $backupFile $_.FullName -Force
        } else {
            Write-Host "El archivo de respaldo no existe: $backupFile"
        }
    }
}
