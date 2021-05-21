# Auto login script

# Gets user input to set variables
$DefUser = Read-Host "Enter username"
$DefPass = Read-Host "Enter Password"
$Domain = Read-Host "Enter Domain"

# Sets variable to registry path 
$regpath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'

# Adds/Changes registry keys to setup auto login
New-ItemProperty $regpath -Name "DefaultDomainName" -Value $Domain -Force
New-ItemProperty $regpath -Name "DefaultUsername" -Value $DefUser -Force
New-ItemProperty $regpath -Name "DefaultPassword" -Value $DefPass -Force
Set-ItemProperty $regpath -Name "AutoAdminLogon" -Value "1" -Force
New-ItemProperty $regpath -Name "ForceAutoLogon" -Value "1" -Force

# Restarts the computer
Restart-Computer 

# If the script was successful, the usre account will auto login after reboot. 