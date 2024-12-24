# Set the source directories for the fonts
$FontDirs = @(".\google-fonts", ".\nerdfonts") # Add more directories as needed

# Create a COM object to handle font installation
$Shell = New-Object -ComObject Shell.Application

foreach ($FontDir in $FontDirs) {
    # Get all TTF files in the current directory
    $FontList = Get-ChildItem -Path $FontDir -Filter *.ttf -Recurse

    foreach ($Font in $FontList) {
        Write-Host "Installing font - $($Font.BaseName)"
        
        # Copy the font to the Windows Fonts directory
        $DestinationPath = "C:\Windows\Fonts\$($Font.Name)"
        
        if (-not (Test-Path $DestinationPath)) {
            # Copy the font file to the Fonts directory
            Copy-Item -Path $Font.FullName -Destination $DestinationPath
            
            # Install the font using the Shell COM object
            $Shell.Namespace(0x14).CopyHere($DestinationPath, 0x10)

            # Register the font in the Windows registry for all users
            New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" `
                             -Name "$($Font.BaseName) (TrueType)" `
                             -PropertyType String `
                             -Value "$($Font.Name)" -Force
        } else {
            Write-Host "Font already installed: $($Font.BaseName)"
        }
    }
}

Write-Host "Fonts installation completed."