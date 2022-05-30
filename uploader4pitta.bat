@echo off

echo ====================================
echo usage : uploader4pitta VID PID hexfile
echo ====================================

setlocal

if %1.==. goto viderror
set vid=%1

if %2.==. goto piderror
set pid=%2

if %3.==. goto fileerror
set hexfile=%3
if not exist %hexfile% goto fileerror

echo Start Flashing Arduino Micro
avrdude -v -patmega32u4 -C./avrdude.conf -cavr109 -D -P USB:%vid%:%pid% -Uflash:w:%hexfile%:i
goto upgradedone

:viderror
echo Missing parameter or VID, you should provide the VID of a USB you want to use.
goto end

:piderror
echo Missing parameter or PID, you should provide the PID of a USB you want to use.
goto end

:upgradedone
echo Upgrade Completed!

:end