# 7Zip

$apk1 = "https://www.7-zip.org/a/7z2301-x64.exe" 

$apk1_install = "c:\temp\7zip_installer.exe" 

# Mozilla Firefox

$apk2 = "https://download.mozilla.org/?product=firefox-stub&os=win&lang=pl&attribution_code=c291cmNlPXd3dy5nb29nbGUuY29tJm1lZGl1bT1yZWZlcnJhbCZjYW1wYWlnbj0obm90IHNldCkmY29udGVudD0obm90IHNldCkmZXhwZXJpbWVudD0obm90IHNldCkmdmFyaWF0aW9uPShub3Qgc2V0KSZ1YT1jaHJvbWUmY2xpZW50X2lkPShub3Qgc2V0KSZzZXNzaW9uX2lkPShub3Qgc2V0KSZkbHNvdXJjZT1tb3pvcmc.&attribution_sig=8050a714514346fdc6eb8a04a5cf8bad6805f8964fec63b63a8e91e7962fa0f7"

$apk2_install = "c:\temp\firefox_installer.exe"

# Adobe Acrobat Reader 

$apk3 = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2300820533/AcroRdrDCx642300820533_pl_PL.exe"

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




