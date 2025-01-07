mogrify -path . -format png *.jpg && rm *.jpg

mkdir sized

for %f in (*.png) do magick "%f" -resize 608x1080^ -gravity center -background black -extent 608x1080 "sized\%~nf.png"

for file in *.png; do
    # Guarda el tamaño original del archivo
    original_size=$(stat -c %s "$file")
    
    # Comprime el archivo con ImageMagick
    convert "$file" -quality 90 "$file"

    # Comprueba si el archivo ha disminuido de tamaño
    new_size=$(stat -c %s "$file")
    if [ "$new_size" -ge "$original_size" ]; then
        # Si el archivo no se comprime más, restaura el original
        echo "No se comprimió más $file. Restaurando el original."
        cp "$file".bak "$file"
    fi
done