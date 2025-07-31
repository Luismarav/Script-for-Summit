@echo off
:: Define an array of source and destination paths
setlocal EnableDelayedExpansion

:: Declare file paths
set "files[0]=M:\IT\ACCUM OUT\MAGELLAN-PARTNERS\ECIEMP1.txt|M:\IT\ACCUM IN\MAGELLAN-VARIOUS(PRIME)"
set "files[1]=M:\IT\ACCUM OUT\EMPI-MP\eciemp.txt|M:\IT\ACCUM IN\EMPIRX_MP"
set "files[2]=M:\IT\ACCUM OUT\CORTEZ-MAXOR\coremp.txt|M:\IT\ACCUM IN\CORTEZ_MAXOR"
set "files[3]=M:\IT\ACCUM OUT\OPTUM-YCT\yctemp.txt|M:\IT\ACCUM IN\YCT_OPTUM_NEW"
set "files[4]=M:\IT\ACCUM OUT\Smith - Sierra\svemp.txt|M:\IT\ACCUM IN\SV SMITHRX"
set "files[5]=M:\IT\ACCUM OUT\OPTUM-SCAHC1\scemp.txt|M:\IT\ACCUM IN\SC_OPTUM_NEW"
set "files[6]=M:\IT\ACCUM OUT\DREXI-QUECHAN\queemp.txt|M:\IT\ACCUM IN\DREXI"
set "files[7]=M:\IT\ACCUM OUT\Smith - JJ Safety\jjemp.txt|M:\IT\ACCUM IN\JJ-SAFETY SMITHRX"
set "files[8]=M:\IT\ACCUM OUT\Smith - Skyview\skyemp.txt|M:\IT\ACCUM IN\SKYVIEW_SMITHRX"
set "files[9]=M:\IT\ACCUM OUT\OPTUM-SCAHC1\scemp.txt|M:\IT\ACCUM IN\SC_OPTUM_NEW"
set "files[10]=M:\IT\ACCUM OUT\OPTUM-YAN\yanemp.txt|M:\IT\ACCUM IN\YAN_OPTUM_NEW"
set "files[11]=M:\IT\ACCUM OUT\OPTUM-YCT1\yctemp.txt|M:\IT\ACCUM IN\YCT_OPTUM_NEW"

:: Loop through each pair and process the copy
for /L %%i in (0,1,11) do (
    for /F "tokens=1,2 delims=|" %%A in ("!files[%%i]!") do (
        echo Copying %%~nxA to %%B...
        copy "%%A" "%%B"
        echo %%~nxA has been successfully copied to %%B.
    )
)
pause