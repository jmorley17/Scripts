:: Start script

:: Disable Windows Management Instrumentation Service
sc config winmgmt start= disabled
net stop winmgmt /y

:: Rename repository to old in order to rebuild a new repository
winmgmt /resetrepository

:: Register dlls
regsvr32 /s %systemroot%\system32\scecli.dll
regsvr32 /s %systemroot%\system32\userenv.dll

:: Restart Windows Management Instrumentation service
sc config winmgmt start= auto
for /F "tokens=3 delims=: " %%H in ('sc query "winmgmt" ^| findstr "        STATE"') do (
if /I "%%H" NEQ "RUNNING" (
net start "winmgmt"
)
)
timeout /t 15 /nobreak > NUL

:: Recompile MOF files, and regestister dlls and exe's in wbem folder
cd C:\Windows\System32\wbem\
for /f %%s in ('dir /b *.mof') do mofcomp %%s
for /f %%s in ('dir /b en-us\*.mof') do mofcomp en-us\%%s
for %%i in (*.dll) do RegSvr32 -s %%i
for %%i in (*.exe) do %%i /RegServer

:: Recompile a few MOFs that have to be done last to prevent gpupdate RSOP errors
mofcomp policman.mof
mofcomp polprocl.mof
mofcomp polstore.mof
mofcomp scersop.mof
mofcomp rsop.mof 

:: End script
