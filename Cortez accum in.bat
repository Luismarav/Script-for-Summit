@echo off
setlocal enabledelayedexpansion

REM Set PATH variable
SET PATH=M:\eci\dbc13;%path%

REM Process all text files in the current directory
for %%F in (*.txt) do (
    REM Extract the date part (YYYYMMDD) from the filename
    for /f "tokens=2 delims=." %%A in ("%%F") do (
        set "date_part=%%A"
        call set "date_part=%%date_part:~0,8%%"
    )

    REM Extract month and day
    call set "month_day=%%date_part:~4,2%%%%date_part:~6,2%%"

    REM Create the new filename
    call set "new_filename=%%month_day%%.txt"

    REM Rename the file
    if exist "%%F" (
        call rename "%%F" "%%new_filename%%"
        echo Renamed %%F to %%new_filename%%
    ) else (
        echo The file %%F does not exist.
    )

    REM Execute the "build" command
    REM Assuming the fixed target file is 0531x.txt, modify if needed
    build !new_filename! 0731x.txt -t -a
)

pause
