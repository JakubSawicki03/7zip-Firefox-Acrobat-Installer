# Adobe Acrobat Reader 

$adobe = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2300820533/AcroRdrDCx642300820533_pl_PL.exe"

$adobe_install = "c:\temp\adobe_installer.exe"




# Create "temp" directory

    New-Item "C:\temp" -itemType Directory -ErrorAction SilentlyContinue;

# Installing 7zip

    msiexec.exe /i https://www.7-zip.org/a/7z2301-x64.msi /qn;

# Installing Firefox 

    msiexec.exe /i https://download.mozilla.org/?product=firefox-msi-latest-ssl /qn;

# Installing Adobe

    Invoke-Webrequest -URI $adobe -OutFile $adobe_install;
    Start-Process $adobe_install -ArgumentList "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES" -Wait;

# Removing "temp" directory

    Remove-Item "C:\temp" -force -r;

# Finish alert

    powershell -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('7-zip, Firefox and Adobe are now installed!','Installing')}";

# Setting Default Policy

    Set-ExecutionPolicy Default;
