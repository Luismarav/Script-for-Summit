@echo off
setlocal enabledelayedexpansion

REM Set PATH variable
SET PATH=M:\eci\dbc13;%path%

REM Process all text files in the current directory
for %%F in (*.txt) do (
    REM Extract the numeric date (YYYYMMDD) from the filename
    for /f "tokens=3 delims=_" %%A in ("%%F") do (
        set "date_part=%%A"
        call set "date_part=%%date_part:~0,8%%"
    )

    REM Extract month and day from the date
    call set "month_day=%%date_part:~4,2%%%%date_part:~6,2%%"

    REM Create the new filename in MMDD.txt format
    call set "new_filename=%%month_day%%.txt"

    REM Rename the file
    if exist "%%F" (
        call rename "%%F" "%%new_filename%%"
        echo Renamed %%F to %%new_filename%%
    ) else (
        echo The file %%F does not exist.
    )

    REM Execute the "build" command for the renamed file
    build !new_filename! 0731x.txt -t -a
)

pause
