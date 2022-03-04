@echo off

rmdir /Q /S "C:\Program Files (x86)\Windower\scripts\aliases"
rmdir /Q /S "C:\Program Files (x86)\Windower\scripts\binds"
echo Hello Vanadiel!
xcopy "C:\Program Files (x86)\Windower\addons\GearSwap\data\binds\" "C:\Program Files (x86)\Windower\scripts\binds\" /E /H /C /I
xcopy "C:\Program Files (x86)\Windower\addons\GearSwap\data\aliases\" "C:\Program Files (x86)\Windower\scripts\aliases\" /E /H /C /I
echo Goodbye Vanadiel!
@REM pause
@REM If you need to see what happens, make line 8 just say "pause". @REM is a comment line.