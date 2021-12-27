@echo off
title Software Dump
color 97
echo ####################
echo # SOFTWARE DUMP    #
echo ####################

echo Checking for admin privileges...
openfiles > nul
if not %ERRORLEVEL% EQU 0 goto noadmin
echo Admin detected. Dump should show everything.
set ad=Administrator access detected.
goto continue
:noadmin
echo Admin NOT detected. You may experience loss of some statistics.
set ad=Administrator NOT detected. Some statistics may not show up.
:continue
echo Dumping data. please wait...

FOR /F "usebackq" %%i IN (`hostname`) DO SET Name=%%i

(
echo ####################
echo # SOFTWARE DUMP    #
echo ####################
echo %ad%
echo -----------------------------
echo -==Computer Hostname==-
hostname
echo -----------------------------
echo -==Windows Version==-
ver
echo -----------------------------
echo -==Task List==-
tasklist
echo -----------------------------
echo -==IP Configuration==-
ipconfig
echo -----------------------------
echo -==Installed Win32 Apps==-
powershell "Get-WmiObject -Class Win32_Product | Select-Object -Property Name,Vendor,Version"
echo -----------------------------
echo -==Installed Appx Packages for all users==-
powershell "Get-AppxPackage -AllUsers | Format-Table Name,Version,Status,PackageFullName -Wrap"
echo -----------------------------
echo -==Network Interfaces==-
netsh interface show interface
echo -----------------------------
echo -==Firewall Profiles==-
netsh advfirewall show allprofiles
echo -----------------------------
echo -==WiFi Visible Networks==-
netsh wlan show networks
echo -----------------------------
echo -==WiFi Profiles==-
netsh wlan show profiles
echo -----------------------------
echo -==SysInfo==-
systeminfo
echo -----------------------------
echo -==Storage Devices==-
powershell "wmic volume get Label,Capacity,FreeSpace,DriveLetter,DriveType,FileSystem"
echo -----------------------------
echo -=Users=-
net user 
echo -----------------------------
echo -=Local Groups=-
net localgroup
echo -----------------------------
echo Created with SoftwareDump version %v%
)> "%Name%.dump.txt"

rem Done!
echo Data dumped to file. Press any key to exit...
pause > nul
endlocal
exit