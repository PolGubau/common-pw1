param (
    [string]$n
)

switch ($n) {
    "delnod" { .\dev-tools\clear-node-modules.ps1 }
    "rename" { .\image-tool\batch-rename.ps1 }
    "optimize" { .\image-tool\optimize-img.ps1 }
    "flow" { .\image-tool\images-flow.ps1 }
    "copy" { .\utils\copy-to-clipboard.ps1 }
     "cl" {
        # Llamar al script count_lines.ps1 y pasarle el parámetro extension
        & ".\dev-tools\count_lines.ps1"
    }
    default { Write-Host "Script no encontrado." }
}