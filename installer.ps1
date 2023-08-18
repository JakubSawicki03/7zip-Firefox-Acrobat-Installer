# 7Zip

$apk1 = "https://www.7-zip.org/a/7z2301-x64.exe" 

$apk1_install = "c:\temp\7zip_installer.exe" 

# Mozilla Firefox

$apk2 = "https://download.mozilla.org/?product=firefox-stub&os=win&lang=pl&attribution_code=c291cmNlPXd3dy5iaW5nLmNvbSZtZWRpdW09cmVmZXJyYWwmY2FtcGFpZ249KG5vdCBzZXQpJmNvbnRlbnQ9KG5vdCBzZXQpJmV4cGVyaW1lbnQ9KG5vdCBzZXQpJnZhcmlhdGlvbj0obm90IHNldCkmdWE9ZWRnZSZjbGllbnRfaWQ9MTIyOTEzNjYyNS4xNjkwOTY0NDE4JnNlc3Npb25faWQ9NzYzODYxMDU3OSZkbHNvdXJjZT1tb3pvcmc.&attribution_sig=423f9d49b30f1a5c0fbf0339eb807d43358998f030a4eb7f0d83118df3a182fd&_gl=1*h61qn5*_ga*MTIyOTEzNjYyNS4xNjkwOTY0NDE4*_ga_MQ7767QQQW*MTY5MTA0MjEwMi41LjEuMTY5MTA0MjE0NC4wLjAuMA.."

$apk2_install = "c:\temp\firefox_installer.exe"

# Adobe Acrobat Reader 

$apk3 = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2300320244/AcroRdrDCx642300320244_pl_PL.exe"

$apk3_install = "c:\temp\adobe_installer.exe"


# Create "temp" directory

    New-Item "C:\temp" -itemType Directory;
    
# Downloading 7zip

    Invoke-Webrequest -URI $apk1 -OutFile $apk1_install;

# Downloading Firefox

    Invoke-Webrequest -URI $apk2 -OutFile $apk2_install;

# Installing 7zip

    Start-Process -FilePath $apk1_install -Args "/S";

# Installing Firefox 

    Start-Process -FilePath $apk2_install -ArgumentList  '/q', '/i';

# Downloading Adobe

    Invoke-Webrequest -URI $apk3 -OutFile $apk3_install ;

# Installing Adobe

    Start-Process -FilePath $apk3_install /sAlls -Wait;

# taskKill the Firefox process

    taskkill /IM firefox.exe  /F;

# Removing "temp" directory

    Remove-Item "C:\temp" -force -r;

# Finish alert

    powershell -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('7-zip, Firefox and Adobe are now installed!','Installing')}";

# Setting Default Policy

Set-ExecutionPolicy Default




