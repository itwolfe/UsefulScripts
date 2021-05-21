# Google Chrome

# Sets variable to dowload url for current google chrome version
$SourceURL = "http://dl.google.com/chrome/install/375.126/chrome_installer.exe"

# Sets the path and name of the chrome installation file
$Installer = $env:TEMP + "\chrome_installer.exe"

# Executes the download of the Chrome installer
Invoke-WebRequest $SourceURL -OutFile $Installer

# Runs the Chrome installer in the back ground
Start-Process -FilePath $Installer -Args "/silent","/install" -Verb RunAs -Wait

# Removes the Chrome installer
Remove-Item $Installer