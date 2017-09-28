set runtype=%1
PowerShell -Command "& {(Get-WmiObject -class win32_NetworkAdapterConfiguration -Filter 'ipenabled = "true"').ipaddress[0]}" > tmpFile
set /p myvar= < tmpFile 
del tmpFile

wmic os get osarchitecture | find /i "bit"> tmpFile
set /p arch= < tmpFile
del tmpFile

set arch=%arch: =%

if "%arch%"=="64-bit" (

start "" "C:\Program Files (x86)\Xming\Xming.exe" -multiwindow -clipboard -ac

) else (
start "" "C:\Program Files\Xming\Xming.exe" -multiwindow -clipboard -ac
)

if "%runtype%"=="gui" (
docker run -ti --net=host -v c:/Users/%USERNAME%:/root -e DISPLAY=%myvar%:0 laramaktub/docker-domino DOMINO

) else  (

if  "%runtype%"=="commandline" (

docker run -ti --net=host -v c:/Users/%USERNAME%:/root -e DISPLAY=%myvar%:0 laramaktub/docker-domino /bin/bash

) else  (

echo "Wrong input parameter. Correct parameters are: commandline or gui")

)

         


