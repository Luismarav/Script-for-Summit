@echo off
:: Set the source and destination paths for the first file
set "source1=S:\prod\f\hpclmhst.fle"
set "destination=M:\bank2\bank\ME_WORK\accum out batch files"

:: Copy the first file
copy "%source1%" "%destination%"

:: Set the source paths for the other files
set "source2=M:\ECI\BI\hpclmhst.txt"
set "source3=M:\ECI\BI\eciemp.txt"
set "source4=M:\ECI\BI\ecidep.txt"

:: Copy the remaining files to the destination
copy "%source2%" "%destination%"
copy "%source3%" "%destination%"
copy "%source4%" "%destination%"

:: Confirm the copy operation
echo All files have been successfully copied to %destination%.
pause