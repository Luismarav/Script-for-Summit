#this is step 1 of loading the accumulators, after I manually drag the files in filezilla I use this script to do it all at once.

@echo off

:: List of source and destination folders
set "folders=M:\bank2\bank\ME_WORK\accum in batch files\CORTEZ - IN|M:\bank2\bank\ME_WORK\accum in batch files\CORTEZ_WORK"
set "folders=%folders%;M:\bank2\bank\ME_WORK\accum in batch files\DREXI_QUECHAN IN|M:\bank2\bank\ME_WORK\accum in batch files\DREXI_QUECHAN WORK"
set "folders=%folders%;M:\bank2\bank\ME_WORK\accum in batch files\EMPIRX - IN|M:\bank2\bank\ME_WORK\accum in batch files\EMPIRX_WORK"
set "folders=%folders%;M:\bank2\bank\ME_WORK\accum in batch files\PRIME - IN|M:\bank2\bank\ME_WORK\accum in batch files\PRIME_WORK"
set "folders=%folders%;M:\bank2\bank\ME_WORK\accum in batch files\SKYVIEW - IN|M:\bank2\bank\ME_WORK\accum in batch files\SKYVIEW_WORK"
set "folders=%folders%;M:\bank2\bank\ME_WORK\accum in batch files\YCT - IN|M:\bank2\bank\ME_WORK\accum in batch files\YCT_WORK"

:: Move all .txt and .csv files from each source to the corresponding destination
for %%F in ("%folders:;=" "%") do (
    for /f "tokens=1,2 delims=|" %%A in (%%F) do (
        echo Moving files from %%A to %%B
        move "%%A\*.txt" "%%B\"
        move "%%A\*.csv" "%%B\"
    )
)

:: Optional: Display a message after moving files
echo Files have been moved successfully!
pause
