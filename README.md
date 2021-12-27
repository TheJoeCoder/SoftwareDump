# SoftwareDump
Crappy batch file to get system info from a Windows PC. Yes, it barely works, but it does.

## Disclaimer
This isn't intended to be used as a tool for unauthorised stealing of info from remote PCs. Don't use it for illegal stuff; I'm not responsible for anything done with this program. Also, who would want to use this crappy code when there's probably better alternatives out there?

## Usage
Run `SOFTWARE-DUMP.bat` as administrator and wait. After a few minutes, it should create a file called "<COMPUTER NAME>.dump.txt" with loads of stuff in.

If you want to upload dump files to a central server (for sysadmins to get an overview of all PCs in the network), edit `SOFTWARE-DUMP-IncUpload.bat` and replace the line with `rem Upload code - please change`. Here's an example:

### First example (for using ngrok)
```batch
rem ----
powershell "$wc = New-Object System.Net.WebClient;$upload = $wc.DownloadString('http://hosting.url/uploader.txt');$resp = $wc.UploadFile($upload.trimEnd(),'.\%Name%.dump.txt')"
rem ----
```
This code downloads a file from a website (the file being http://hosting.url/uploader.txt in this example). This file can be hosted on github, dropbox, etc, and should contain an ngrok url or ip address to the upload code (see `upload-server/` directory), for example:
```
http://abcd-127-0-0-1.ngrok.io/upload
```

### Second example (static server url)
```batch
rem ----
powershell "$wc = New-Object System.Net.WebClient;$resp = $wc.UploadFile('http://some-server.tld:8080/upload','.\%Name%.dump.txt')"
rem ----
```
This code sends the file directly to a known URL. Simple.