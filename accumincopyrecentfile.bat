@echo off
setlocal enabledelayedexpansion

:: Define transfer rules
set "sourceDir1=M:\bank2\bank\ME_WORK\accum in batch files\YCT_WORK"
set "destDir1=M:\IT\ACCUM IN\SC_OPTUM_NEW"
set "pattern1=sc*.txt"

set "sourceDir2=M:\bank2\bank\ME_WORK\accum in batch files\YCT_WORK"
set "destDir2=M:\IT\ACCUM IN\YAN_OPTUM_NEW"
set "pattern2=*yan*.txt"

set "sourceDir3=M:\bank2\bank\ME_WORK\accum in batch files\YCT_WORK"
set "destDir3=M:\IT\ACCUM IN\YCT_OPTUM_NEW"
set "pattern3=*yct*.txt"

set "sourceDir4=M:\bank2\bank\ME_WORK\accum in batch files\SKYVIEW_WORK"
set "destDir4=M:\IT\ACCUM IN\JJ-SAFETY SMITHRX"
set "destDir5=M:\IT\ACCUM IN\SKYVIEW_SMITHRX"
set "destDir6=M:\IT\ACCUM IN\SV SMITHRX"
set "pattern4=*.csv"

set "sourceDir5=M:\bank2\bank\ME_WORK\accum in batch files\PRIME_WORK"
set "destDir7=M:\IT\ACCUM IN\MAGELLAN-VARIOUS(PRIME)"
set "pattern5=*.txt"

set "sourceDir6=M:\bank2\bank\ME_WORK\accum in batch files\EMPIRX_WORK"
set "destDir8=M:\IT\ACCUM IN\EMPIRX_MP"
set "pattern6=*.txt"

set "sourceDir7=M:\bank2\bank\ME_WORK\accum in batch files\DREXI_QUECHAN WORK"
set "destDir9=M:\IT\ACCUM IN\DREXI"
set "pattern7=*.txt"

set "sourceDir8=M:\bank2\bank\ME_WORK\accum in batch files\CORTEZ_WORK"
set "destDir10=M:\IT\ACCUM IN\CORTEZ_MAXOR"
set "pattern8=*.txt"

:: Process text file transfers dynamically
call :copyLatest "%sourceDir1%" "%destDir1%" "%pattern1%"
call :copyLatest "%sourceDir2%" "%destDir2%" "%pattern2%"
call :copyLatest "%sourceDir3%" "%destDir3%" "%pattern3%"
call :copyLatest "%sourceDir5%" "%destDir7%" "%pattern5%"
call :copyLatest "%sourceDir6%" "%destDir8%" "%pattern6%"
call :copyLatest "%sourceDir7%" "%destDir9%" "%pattern7%"
call :copyLatest "%sourceDir8%" "%destDir10%" "%pattern8%"  :: Added CORTEZ_WORK

:: Process CSV file transfer to multiple locations
call :copyToMultiple "%sourceDir4%" "%pattern4%" "%destDir4%" "%destDir5%" "%destDir6%"

echo All transfers completed.
exit /b

:: Function to find and copy the most recent matching file
:copyLatest
set "latestFile="
for /f "delims=" %%F in ('dir "%~1\%~3" /b /o:-d') do (
    set "latestFile=%%F"
    goto :copyFile
)

:copyFile
if not "%latestFile%"=="" (
    copy "%~1\%latestFile%" "%~2"
    echo Copied %latestFile% to %~2
) else (
    echo No matching files found in %~1
)
exit /b

:: Function to copy a file to multiple destinations
:copyToMultiple
for %%F in ("%~1\%~2") do (
    copy "%%F" "%~3"
    copy "%%F" "%~4"
    copy "%%F" "%~5"
    echo Copied %%F to all destinations.
    exit /b
)

echo No matching CSV files found in %~1
exit /b