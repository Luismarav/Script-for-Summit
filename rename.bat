@echo off
setlocal enabledelayedexpansion

:: Get today's date in MMDD format
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set mm=!datetime:~4,2!
set dd=!datetime:~6,2!
set mmdd=!mm!!dd!

:: === Step 1: CORTEZ_MAXOR ===
cd /d "M:\IT\ACCUM IN\CORTEZ_MAXOR"

for %%F in (*.oopded.txt) do (
    echo Renaming "%%F" to "cor%mmdd%x.txt"
    ren "%%F" "cor%mmdd%x.txt"

    echo Copying "cor%mmdd%x.txt" to "S:\prod\f"
    copy /Y "cor%mmdd%x.txt" "S:\prod\f\"
)


:: === Step 2: DREXI ===
cd /d "M:\IT\ACCUM IN\DREXI"
set "srcDrexi=8%mmdd%x.accum"
set "dstDrexi=qu8%mmdd%x.txt"
if exist "!srcDrexi!" (
    echo Renaming "!srcDrexi!" to "!dstDrexi!"
    ren "!srcDrexi!" "!dstDrexi!"

    echo Copying "!dstDrexi!" to "S:\prod\f"
    copy /Y "!dstDrexi!" "S:\prod\f\"
) else (
    echo File "!srcDrexi!" not found in DREXI.
)


:: === Step 3: EMPIRX_MP ===
cd /d "M:\IT\ACCUM IN\EMPIRX_MP"
if exist "caremark-in-2025.txt" (
    echo Renaming "caremark-in-2025.txt" to "mp%mmdd%x.txt"
    ren "caremark-in-2025.txt" "mp%mmdd%x.txt"
	copy /Y "mp%mmdd%x.txt" "S:\prod\f"
) else (
    echo No caremark-in-2025.txt file found in EMPIRX_MP.
)

:: === Step 4: MAGELLAN-VARIOUS(PRIME) ===
cd /d "M:\IT\ACCUM IN\MAGELLAN-VARIOUS(PRIME)"
set "src1=in-ded-%mmdd%x.txt"
set "dst1=magd%mmdd%x.txt"
if exist "!src1!" (
    echo Renaming "!src1!" to "!dst1!"
    ren "!src1!" "!dst1!"
	copy /Y "!dst1!" "S:\prod\f\"
) else (
    echo File "!src1!" not found.
)
set "src2=in-oop-%mmdd%x.txt"
set "dst2=mago%mmdd%x.txt"
if exist "!src2!" (
    echo Renaming "!src2!" to "!dst2!"
    ren "!src2!" "!dst2!"
	copy /Y "!dst2!" "S:\prod\f\"
) else (
    echo File "!src2!" not found.
)

:: === Step 5: JJ-SAFETY SMITHRX ===
cd /d "M:\IT\ACCUM IN\JJ-SAFETY SMITHRX"
set "src3=2025.ded.txt"
set "dst3=jjd%mmdd%.txt"
if exist "!src3!" (
    echo Renaming "!src3!" to "!dst3!"
    ren "!src3!" "!dst3!"
	copy /Y "!dst3!" "S:\prod\f\"
) else (
    echo File "!src3!" not found.
)
set "src4=2025.oop.txt"
set "dst4=jjo%mmdd%.txt"
if exist "!src4!" (
    echo Renaming "!src4!" to "!dst4!"
    ren "!src4!" "!dst4!"
	copy /Y "!dst4!" "S:\prod\f\"
) else (
    echo File "!src4!" not found.
)

:: === Step 6: SKYVIEW_SMITHRX ===
cd /d "M:\IT\ACCUM IN\SKYVIEW_SMITHRX"
set "src5=2025.ded.txt"
set "dst5=skyd%mmdd%.txt"
if exist "!src5!" (
    echo Renaming "!src5!" to "!dst5!"
    ren "!src5!" "!dst5!"
	copy /Y "!dst5!" "S:\prod\f\"
) else (
    echo File "!src5!" not found.
)
set "src6=2025.oop.txt"
set "dst6=skyo%mmdd%.txt"
if exist "!src6!" (
    echo Renaming "!src6!" to "!dst6!"
    ren "!src6!" "!dst6!"
	copy /Y "!dst6!" "S:\prod\f\"
) else (
    echo File "!src6!" not found.
)

:: === Step 7: SV SMITHRX ===
cd /d "M:\IT\ACCUM IN\SV SMITHRX"
set "src7=2025.ded.txt"
set "dst7=svd%mmdd%.txt"
if exist "!src7!" (
    echo Renaming "!src7!" to "!dst7!"
    ren "!src7!" "!dst7!"
    copy /Y "!dst7!" "S:\prod\f\"
)
set "src8=2025.oop.txt"
set "dst8=svo%mmdd%.txt"
if exist "!src8!" (
    echo Renaming "!src8!" to "!dst8!"
    ren "!src8!" "!dst8!"
    copy /Y "!dst8!" "S:\prod\f\"
)

:: === Step 8: SC_OPTUM_NEW ===
cd /d "M:\IT\ACCUM IN\SC_OPTUM_NEW"

set "src9=sc%mmdd%.net.txt"
set "dst9=sc%mmdd%n.txt"
if exist "!src9!" (
    echo Renaming "!src9!" to "!dst9!"
    ren "!src9!" "!dst9!"
    copy /Y "!dst9!" "S:\prod\f\"
) else (
    echo File "!src9!" not found.
)

set "src10=sc%mmdd%.std.txt"
set "dst10=sc%mmdd%s.txt"
if exist "!src10!" (
    echo Renaming "!src10!" to "!dst10!"
    ren "!src10!" "!dst10!"
    copy /Y "!dst10!" "S:\prod\f\"
) else (
    echo File "!src10!" not found.
)

:: === Step 9: YAN_OPTUM_NEW ===
cd /d "M:\IT\ACCUM IN\YAN_OPTUM_NEW"

set "src11=yan%mmdd%.net.txt"
set "dst11=yan%mmdd%n.txt"
if exist "!src11!" (
    echo Renaming "!src11!" to "!dst11!"
    ren "!src11!" "!dst11!"
    copy /Y "!dst11!" "S:\prod\f\"
) else (
    echo File "!src11!" not found.
)

set "src12=yan%mmdd%.std.txt"
set "dst12=yan%mmdd%s.txt"
if exist "!src12!" (
    echo Renaming "!src12!" to "!dst12!"
    ren "!src12!" "!dst12!"
    copy /Y "!dst12!" "S:\prod\f\"
) else (
    echo File "!src12!" not found.
)

:: === Step 10: YCT_OPTUM_NEW ===
cd /d "M:\IT\ACCUM IN\YCT_OPTUM_NEW"

set "src13=yct%mmdd%.net.txt"
set "dst13=yct%mmdd%n.txt"
if exist "!src13!" (
    echo Renaming "!src13!" to "!dst13!"
    ren "!src13!" "!dst13!"
    copy /Y "!dst13!" "S:\prod\f\"
) else (
    echo File "!src13!" not found.
)

set "src14=yct%mmdd%.std.txt"
set "dst14=yct%mmdd%s.txt"
if exist "!src14!" (
    echo Renaming "!src14!" to "!dst14!"
    ren "!src14!" "!dst14!"
    copy /Y "!dst14!" "S:\prod\f\"
) else (
    echo File "!src14!" not found.
)


endlocal
pause
