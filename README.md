# SoftwareDump
Crappy batch file to get system info from a Windows PC. Yes, it barely works, but it does.

## Disclaimer
This isn't intended to be used as a tool for unauthorised stealing of info from remote PCs. Don't use it for illegal stuff, and I am not responsible for any illegal things done with this program. Who would want to use this crappy code when there's probably better alternatives out there?

## Usage
Run `SOFTWARE-DUMP.bat` as administrator and wait. After a few minutes, it should create a file called "<COMPUTER NAME>.dump.txt" with loads of stuff in.

If you want to upload dump files to a central server (for sysadmins to get an overview of all PCs in the network, please don't use this for illegal stuff), edit `SOFTWARE-DUMP-IncUpload.bat`. Here's an example:

```batch
rem ----
powershell "$wc = New-Object System.Net.WebClient;$upload = $wc.DownloadString('http://hosting.url/uploader.txt');$resp = $wc.UploadFile($upload.trimEnd(),'.\%Name%.dump.txt')"
rem ----
```
