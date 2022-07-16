@echo off

rmdir /Q /S "C:\Program Files (x86)\Windower\scripts\aliases"
rmdir /Q /S "C:\Program Files (x86)\Windower\scripts\binds"
@REM Bin off the old binds and aliases
cd "C:\Program Files (x86)\Windower\addons\Yush\data\"
del /Q /S "*.lua"
@REM Bin off the old macros

echo Hello Vanadiel!
xcopy "C:\Program Files (x86)\Windower\addons\GearSwap\data\binds\" "C:\Program Files (x86)\Windower\scripts\binds\" /E /H /C /I
xcopy "C:\Program Files (x86)\Windower\addons\GearSwap\data\aliases\" "C:\Program Files (x86)\Windower\scripts\aliases\" /E /H /C /I
copy "C:\Program Files (x86)\Windower\addons\GearSwap\data\macros\*.lua" "C:\Program Files (x86)\Windower\addons\Yush\data\" /Y
@REM Copy the various aliases, binds, and macros into their respective directories.

echo Goodbye Vanadiel!
@REM pause
@REM If you need to see what happens, make line 8 just say "pause". @REM is a comment line.