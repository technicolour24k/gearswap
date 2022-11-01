@echo off

rmdir /Q /S "G:\Games\FFXI Windower\scripts\aliases"
rmdir /Q /S "G:\Games\FFXI Windower\scripts\binds"
@REM Bin off the old binds and aliases
cd "G:\Games\FFXI Windower\addons\Yush\data\"
del /Q /S "*.lua"
@REM Bin off the old macros

echo Hello Vanadiel!
xcopy "G:\Games\FFXI Windower\addons\GearSwap\data\binds\" "G:\Games\FFXI Windower\scripts\binds\" /E /H /C /I
xcopy "G:\Games\FFXI Windower\addons\GearSwap\data\aliases\" "G:\Games\FFXI Windower\scripts\aliases\" /E /H /C /I
copy "G:\Games\FFXI Windower\addons\GearSwap\data\macros\*.lua" "G:\Games\FFXI Windower\addons\Yush\data\" /Y
@REM Copy the various aliases, binds, and macros into their respective directories.

echo Goodbye Vanadiel!
@REM pause
@REM If you need to see what happens, make line 8 just say "pause". @REM is a comment line.