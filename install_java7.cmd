@echo off
setlocal

set "DesktopPath=%UserProfile%\Desktop"
set "ZipFilePath=%DesktopPath%\jre-7u3-windows-i586.zip"
set "ExtractPath=%DesktopPath%\jre-7u3-windows-i586"
set "DownloadUrl=https://cksvietnam.vn/download/jre-7u3-windows-i586.zip"

echo Dang tai tep...
curl "%DownloadUrl%" --output "%ZipFilePath%"

if errorlevel 1 (
    echo Khong the tai tep.
    pause
    exit /b 1
)

echo Dang giai nen...
powershell -Command "Expand-Archive -Path '%ZipFilePath%' -DestinationPath '%ExtractPath%' -Force"

if errorlevel 1 (
    echo Khong the giai nen.
    pause
    exit /b 1
)

echo Dang cai dat Java...
for /r "%ExtractPath%" %%i in (*.exe) do (
    set "ExePath=%%i"
    goto :run
)

echo Khong tim thay chuong trinh cai dat.
pause
exit /b 1

:run
"%ExePath%" /s
echo Da cai xong Java 7.

endlocal
pause
