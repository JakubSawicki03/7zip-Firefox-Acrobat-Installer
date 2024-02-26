# 7Zip

$apk1 = "https://www.7-zip.org/a/7z2301-x64.exe" 

$apk1_install = "c:\temp\7zip_installer.exe" 

# Adobe Acrobat Reader 

$apk3 = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2300820533/AcroRdrDCx642300820533_pl_PL.exe"

$apk3_install = "c:\temp\adobe_installer.exe"


# Create "temp" directory

    New-Item "C:\temp" -itemType Directory;
    
# Downloading 7zip

    Invoke-Webrequest -URI $apk1 -OutFile $apk1_install;

# Downloading Firefox

#    Invoke-Webrequest -URI $apk2 -OutFile $apk2_install;

# Installing 7zip

    Start-Process -FilePath $apk1_install -Args "/S";

# Installing Firefox 

    msiexec.exe /i https://download.mozilla.org/?product=firefox-msi-latest-ssl /qn

# Downloading Adobe

    Invoke-Webrequest -URI $apk3 -OutFile $apk3_install ;

# Installing Adobe

    Start-Process -FilePath $apk3_install /sAlls -Wait;

# Removing "temp" directory

    Remove-Item "C:\temp" -force -r;

# Finish alert

    powershell -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('7-zip, Firefox and Adobe are now installed!','Installing')}";

# Setting Default Policy

Set-ExecutionPolicy Default




