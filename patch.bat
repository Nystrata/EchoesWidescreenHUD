cd /d %~dp0
@echo off
setlocal
setlocal EnableDelayedExpansion
title Echoes Widescreen HUD Patcher

set errorflag=0

set nodToolPath=.\tools\nodtool.v1.win64.exe
set xdelta3Path=.\tools\xdelta-3.1.0-x86_64.exe

set "knownHash=ce781ad1452311ca86667cf8dbd7d112"

echo.
echo # ECHOES WIDESCREEN HUD PATCHER #

:start
echo. && echo.
echo ## START ##
echo.
echo To begin, make a copy of your Metroid Prime 2: Echoes ^(USA^) ^(G2ME01^) ISO and place it in ths same folder as this script.
echo Make sure it is named: echoes.iso
echo.
echo Then,
echo Press any key to to patch and create echoes_widescreenhud.iso . . .
pause > NUL

:fileverify
echo. && echo.
echo ## FILE VERIFICATION ##
echo Checking for echoes.iso in "%cd%"
echo.
if exist .\echoes.iso (
    echo echoes.iso found. Continuing...
) else (
    echo echoes.iso not found.
    echo.
    echo Make a copy of your Metroid Prime 2: Echoes ^(USA^) ^(G2ME01^) ISO and place it in ths same folder as this script.
    echo Make sure it is named: echoes.iso
    echo.
    echo Press any key to try again . . .
    pause > nul
    goto fileverify
)

echo.
echo Verifying MD5 hash of echoes.iso...
call .\tools\md5.bat .\echoes.iso md5
echo.
echo            echoes.iso hash: %md5%
echo   Expected G2ME01 ISO hash: %knownHash%
echo.

if %md5% == %knownHash% (
    echo Hash verified. Continuing...
) else (
    echo Warning: The hash of echoes.iso does not match the known expected MD5 hash for Metroid Prime 2: Echoes ^(G2ME01^).
    echo This may be due to echoes.iso being an improperly dumped image, in a different image format, a different localized version of the game, etc.
    echo While you may still continue, this process will likely fail.
    echo.
    echo Press any key to continue anyway . . .
    pause > nul
    echo.
)

echo. && echo.
echo ## EXTRACTING ORIGINAL IMAGE ##
%nodToolPath% extract -f .\echoes.iso ".\imgfs"
if %ERRORLEVEL% neq 0 (
    set errorflag=1
    echo.
    echo An error has occured. ERRORLEVEL: %ERRORLEVEL%
    echo.
    echo Press any key to continue anyway . . .
    pause > nul
)

echo. && echo.
echo ## PATCHING ##
%xdelta3Path% -v -f -d -s ".\imgfs\files\GGuiSys.pak" ".\vcdiff\GGuiSys.pak.vcdiff" ".\GGuiSys.pak"
if %ERRORLEVEL% neq 0 (
    set errorflag=1
    echo.
    echo An error has occured. ERRORLEVEL: %ERRORLEVEL%
    echo.
    echo Press any key to continue anyway . . .
    pause > nul
)
del ".\imgfs\files\GGuiSys.pak"
copy ".\GGuiSys.pak" ".\imgfs\files\GGuiSys.pak"

echo. && echo.
echo ## BUILDING NEW IMAGE ##
"%nodToolPath%" makegcn ".\imgfs" "echoes_widescreenhud.iso"
if %ERRORLEVEL% neq 0 (
    set errorflag=1
    echo.
    echo An error has occured. ERRORLEVEL: %ERRORLEVEL%
    echo.
    echo Press any key to continue anyway . . .
    pause > nul
)

echo. && echo.
echo ## ClEANING UP ##
echo Deleting temporary files that are no longer needed...
@echo on
rmdir %~dp0imgfs /q /s
del %~dp0GGuiSys.pak
@echo off

echo. && echo.
echo ## FINISHED ##

echo.
if %errorflag% neq 0 (
    echo Something went wrong. echoes_widescreenhud.iso may have failed to be created properly.
) else (
    echo echoes_widescreenhud.iso has been created.
)
echo.
echo Reminder: Remember to enable the Widescreen Gecko cheat-codes in the emulator or loader. 
echo           See the included README text for details.
echo.

:exit
echo.
echo Press any key to to exit . . .
pause > NUL

