# Uninstaller Script for Google Fonts & Nerd Fonts on Windows
# ----------------------------------------------------------
# This script assumes that the original installer registered the fonts in:
# HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts
# using the format: "<Font BaseName> (TrueType)"
#
# Usage:
# 1. Place this script in the same folder as your "google-fonts" and "nerdfonts" directories.
# 2. Run PowerShell as Administrator.
# 3. Execute the script: .\uninstaller.ps1
# 
# Note:
# - This script removes both the registry entries and .ttf files in C:\Windows\Fonts.
# - If you have additional font folders, update the $FontDirs array accordingly.

# Specify the font source directories (same as used for installation).
$FontDirs = @(".\google-fonts", ".\nerdfonts") # Add more directories as needed

Write-Host "Font uninstallation initiated..."

# Loop through each directory and remove any installed TTF fonts
foreach ($FontDir in $FontDirs) {
    $FontList = Get-ChildItem -Path $FontDir -Filter *.ttf -Recurse -ErrorAction SilentlyContinue

    foreach ($Font in $FontList) {
        Write-Host "Attempting to uninstall font - $($Font.BaseName)"

        # Construct the expected path in the Fonts folder
        $InstalledFontPath = "C:\Windows\Fonts\$($Font.Name)"

        # The registry property name used by the installer
        $RegistryPropertyName = "$($Font.BaseName) (TrueType)"

        # Check if the font file actually exists in the Fonts folder
        if (Test-Path $InstalledFontPath) {
            # Remove the registry entry
            Remove-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" `
                                -Name $RegistryPropertyName `
                                -ErrorAction SilentlyContinue

            # Remove the font file from C:\Windows\Fonts
            Remove-Item -Path $InstalledFontPath -Force -ErrorAction SilentlyContinue

            Write-Host "Uninstalled font: $($Font.BaseName)"
        }
        else {
            Write-Host "Font not found in C:\Windows\Fonts: $($Font.BaseName)"
        }
    }
}

Write-Host "Font uninstallation completed."
