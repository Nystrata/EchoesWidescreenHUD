cd /d %~dp0
@echo off
setlocal
setlocal EnableDelayedExpansion
title Echoes Widescreen HUD Patcher

set errorflag=0

set nodToolPath=.\tools\nodtool.v1.win64.exe
set xdelta3Path=.\tools\xdelta-3.1.0-x86_64.exe

set "knownHashG2ME01=ce781ad1452311ca86667cf8dbd7d112"
set "knownHashG2MP01=37fa7767fff54cd4c19bf0db30443520"
set "gameversion="
set "vcdiffdir="

echo.
echo # ECHOES WIDESCREEN HUD PATCHER #

:start
echo. && echo.
echo ## START ##
echo.
echo To begin, make a copy of your Metroid Prime 2: Echoes ISO and place it in ths same folder as this script.
echo Make sure it is named: echoes.iso
echo.
echo This will only work for NTSC-U G2ME01 and PAL G2MP01 versions of the game. (NTSC-J is not supported.)
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
    echo Make a copy of your Metroid Prime 2: Echoes ISO and place it in ths same folder as this script.
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
echo   NTSC-U ^(G2ME01^) ISO hash: %knownHashG2ME01%
echo      PAL ^(G2MP01^) ISO hash: %knownHashG2MP01%
echo.
echo            echoes.iso hash: %md5%
echo.

if %md5% == %knownHashG2ME01% (
    echo Hash successfully verified for NTSC-U ^(G2ME01^)...
    set "gameversion=ntscu"
    goto extraction
)
if %md5% == %knownHashG2MP01% (
    set "gameversion=pal"
    echo Hash successfully verified for PAL ^(G2MP01^)...
    goto extraction)

echo Warning: The hash of echoes.iso does not match the known expected MD5 hash for Metroid Prime 2: Echoes NTSC-U ^(G2ME01^) or PAL ^(G2MP01^)
echo This may be due to echoes.iso being an improperly dumped image, in a different image format, a different localized version of the game, etc.
echo While you may still continue, this process will likely fail.
echo.
echo Press any key to continue anyway . . .
pause > nul
echo.
echo Select the game version for echoes.iso:
echo   N: NTSC-U ^(G2ME01^)
echo   P: PAL ^(G2MP01^)
choice /c np
if %ERRORLEVEL% == 2 (
    echo Selected PAL ^(G2MP01^)...
    set "gameversion=pal"
)
if %ERRORLEVEL% == 1 (
    echo Selected NTSC-U ^(G2ME01^)...
    set "gameversion=ntscu"    
)

:extraction
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

echo %gameversion%

if %gameversion% == ntscu (
    set "vcdiffdir=G2ME01-NTSC"
)
if %gameversion% == pal (
    set "vcdiffdir=G2MP01-PAL"
)

%xdelta3Path% -v -f -d -s ".\imgfs\files\GGuiSys.pak" ".\vcdiff\%vcdiffdir%\GGuiSys.pak.vcdiff" ".\GGuiSys.pak"
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

%xdelta3Path% -v -f -d -s ".\imgfs\files\Standard.ntwk" ".\vcdiff\%vcdiffdir%\Standard.ntwk.vcdiff" ".\Standard.ntwk"
if %ERRORLEVEL% neq 0 (
    set errorflag=1
    echo.
    echo An error has occured. ERRORLEVEL: %ERRORLEVEL%
    echo.
    echo Press any key to continue anyway . . .
    pause > nul
)
del ".\imgfs\files\Standard.ntwk"
copy ".\Standard.ntwk" ".\imgfs\files\Standard.ntwk"


echo. && echo.
echo ## BUILDING NEW IMAGE ##
"%nodToolPath%" makegcn ".\imgfs" "echoes_%gameversion%_widescreenhud.iso"
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
rmdir "%~dp0imgfs" /q /s
del "%~dp0GGuiSys.pak"
del "%~dp0Standard.ntwk"
@echo off

echo. && echo.
echo ## FINISHED ##

echo.
if %errorflag% neq 0 (
    echo Something went wrong. echoes_widescreenhud.iso may have failed to be created properly.
) else (
    echo echoes_%gameversion%_widescreenhud.iso has been created.
)
echo.
echo Reminder: Remember to enable the Widescreen Gecko cheat-codes in the emulator or loader. 
echo           See the included README text for details.
echo.

:exit
echo.
echo Press any key to to exit . . .
pause > NUL

