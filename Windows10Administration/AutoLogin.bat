@echo off

set /p DefUser="Enter Username "
set /p DefPass="Enter Password "
set /p Domain="Enter Domain "

set regpath='HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'

powershell.exe -command New-ItemProperty %regpath% -Name "DefaultDomainName" -Value %Domain% -Force
powershell.exe -command New-ItemProperty %regpath% -Name "DefaultUsername" -Value %DefUser% -Force
powershell.exe -command New-ItemProperty %regpath% -Name "DefaultPassword" -Value %DefPass% -Force
powershell.exe -command Set-ItemProperty %regpath% -Name "AutoAdminLogon" -Value "1" -Force
powershell.exe -command New-ItemProperty %regpath% -Name "ForceAutoLogon" -Value "1" -Force


shutdown /r