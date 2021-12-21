@echo off
setlocal

if %1.==. goto fileerror
set hexfile=%1
if not exist %hexfile% goto fileerror

set detectPort=NONE
set detectBLPort=NONE

for /f "tokens=1* delims==" %%I in ('wmic path win32_pnpentity get caption  /format:list ^| find "Arduino Micro"') do (
    set detectPort="Detected"
    call :resetCOM "%%~J"
)

if %detectPort%==NONE goto nodevice

:: wmic /format:list strips trailing spaces (at least for path win32_pnpentity)
:: Arduino Micor board use "Arduino Micro bootloader" or "Arduino Leonardo bootloader"
for /f "tokens=1* delims==" %%I in ('wmic path win32_pnpentity get caption  /format:list ^| find "Arduino"') do (
    set detectPort="BLDetected"
    call :setCOM "%%~J"
)

if %detectPort%==NONE goto nobldevice

:: end main batch
goto :eof

:resetCOM <WMIC_output_line>
    setlocal
    set "str=%~1"
    set "num=%str:*(COM=%"
    set "num=%num:)=%"
    set port=COM%num%
    echo Reset %str%
    mode %port%: BAUD=1200 parity=N data=8 stop=1
    :: add 2 sec pause to let bootloader come up
    timeout 2 > nul
goto :eof

:setCOM <WMIC_output_line>
    setlocal
    set "str=%~1"
    set "num=%str:*(COM=%"
    set "num=%num:)=%"
    set port=COM%num%
    echo Set %str%

:flash
echo Start Flashing Arduino Micro
avrdude -v -patmega32u4 -C./avrdude.conf -cavr109 -b57600 -D -P%port% -Uflash:w:%hexfile%:i
goto upgradedone

:nodevice
echo No matching board found, you should connect the board you want to upgrade.
goto end

:nobldevice
echo Reset into bootloader failed, please try again...
goto end

:fileerror
echo Missing parameter or file, you should provide the full filename of an existing .hex file you want to use.
goto end

:upgradedone
echo Upgrade Completed!

:end