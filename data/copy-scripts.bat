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
xcopy "C:\Program Files (x86)\Windower\addons\GearSwap\data\macros\*.lua" "C:\Program Files (x86)\Windower\addons\Yush\data\" /E /H /C /I
@REM Copy the various aliases, binds, and macros into their respective directories.

cd "C:\Program Files (x86)\Windower\scripts\"
attrib +r "binds\*" /s /d
attrib +r "aliases\*" /s /d

cd "C:\Program Files (x86)\Windower\addons\Yush\data\"
attrib +r *.lua
@REM Stop people from editing the files directly - for audit control, these should be edited via Gearswap folders

echo Goodbye Vanadiel!
@REM pause
@REM If you need to see what happens, make line 8 just say "pause". @REM is a comment line.