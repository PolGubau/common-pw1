<#
.SYNOPSIS
Optimize images in a directory.

.DESCRIPTION
This script resizes and adjusts the quality of images in a specified directory.
Optimized images are saved in a subdirectory called "optimized" by default.

.PARAMETER folderPath
The path to the directory containing the images to optimize.

.PARAMETER outputFolder
The name of the subdirectory where the optimized images will be saved. Defaults to "optimized".

.PARAMETER quality
The quality percentage for the optimized images (default is 85).

.EXAMPLE
.\optimize.ps1 -folderPath "assets/images" -outputFolder "compressed" -quality 75
Optimizes images in "assets/images" and saves them to "assets/images/compressed" with 75% quality.

.NOTES
Requires ImageMagick to be installed on the system.
#>
param (
    [string]$folderPath = ".",
    [string]$outputFolder = "optimized",
    [int]$quality = 85
)

$scriptPath = Join-Path $PSScriptRoot "..\utils\optimize-img.ps1"
& $scriptPath -folderPath $folderPath -outputFolder $outputFolder -quality $quality


