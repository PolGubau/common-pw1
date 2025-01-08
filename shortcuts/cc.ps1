<#
.SYNOPSIS
Shortcut to copy text to the clipboard.

.DESCRIPTION
This command takes a text argument and copies it to the clipboard using the function defined in `copy-to-clipboard.ps1`.

.PARAMETER text
The text to be copied to the clipboard.

.EXAMPLE
.\copy.ps1 -text "Hello, world"
Copies "Hello, world" to the clipboard.

.NOTES
This script is a shortcut and depends on the `copy-to-clipboard.ps1` script located in the `/utils` folder.
#>

param (
    [string]$text
)

$scriptPath = Join-Path $PSScriptRoot "..\utils\copy-to-clipboard.ps1"
& $scriptPath -text $text

