@echo off

if not exist test goto nematestdirektorija
if not exist radni goto nemaradnidirektorija
if not exist check\stimer.exe goto nematimer
if not exist check\etimer.exe goto nematimer
if not exist check\diff.exe goto nemadiff
if "%1" == "" goto falizadatak

if not exist %1.exe goto faliexe
if "%2" == "" goto svi


:jedan
rem --- Testiranje jednog primjera

if not exist test\%1 goto krivizadatak
if not exist test\%1\%2.in goto kriviin
if not exist test\%1\%2.out goto kriviout

echo.
echo Zadatak %1, test podatak %2:
echo ===== Sluzbeno rjesenje =====
type test\%1\%2.out
echo == Natjecateljevo rjesenje ==
check\stimer.exe
%1.exe < test\%1\%2.in > radni\%2.out 2> radni\%2.stderr
type radni\%2.out
type radni\%2.stderr
echo =============================
check\etimer.exe
check\diff.exe -q -B -w test\%1\%2.out radni\%2.out

if errorlevel 1 goto krivo
goto ispravno

:krivo
echo Rjesenje nije ispravno
echo 0 >> radni\testni.txt
goto kraj

:ispravno
echo Rjesenje je ispravno
echo 1 >> radni\testni.txt
goto kraj


:svi
rem --- Testira sve primjere u nekom zadatku

if not exist test\%1 goto krivizadatak
echo 0 > radni\testni.txt 

for %%i in (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50) do (
   if not exist test\%1\%%i.in goto dalje
	call m.bat %1 %%i
	pause >nul

:dalje
   echo >nul
)


set /a BROJ=-1
set /a ZBROJ=0
for /f %%r in (radni\testni.txt) do (
   call :dodajBroj
   if %%r == 1 call :dodajZbroj
)

if %BROJ% == 0 goto end

echo REZULTAT: %ZBROJ%/%BROJ%
pause >nul

goto kraj


:nematestdirektorija
rem --- Ne postoji direktorij test
echo Ne postoji direktorij test (sa test podacima)!
goto kraj

:nemaradnidirektorija
rem --- Ne postoji direktorij radni
echo Ne postoji direktorij radni (gdje se spremaju izlazi natjecatelja)!
goto kraj

:nematimer
rem --- Nema stimer.exe ili etimer.exe
echo U direktoriju check ne postoji stoperica!
goto kraj

:nemadiff
rem --- Nema diff.exe
echo U direktoriju check ne postoji diff program za usporedjivanje datoteka!
goto kraj

:krivizadatak
rem --- Zadatak ne postoji
echo U direktoriju test ne postoji zadatak %1!
goto kraj


:falizadatak
rem --- Nije zadan zadatak
echo Nije zadan zadatak (vidi upute).
echo Pravilno koristenje: t zadatak [broj_tp]
goto kraj


:kriviin
rem --- Zadan nepostojeci test podatak
echo Ne postoji test podatak %2 (datoteka test\%1\%2.in)!
goto kraj


:kriviout
rem --- Zadan nepostojeci test podatak
echo Ne postoji test podatak %2 (datoteka test\%1\%2.out)!
goto kraj

:faliexe
rem --- Zadan nepostojeci test podatak
echo Ne postoji natjecateljsko rjesenje (datoteka %1.exe)!
goto kraj

:dodajBroj
set /A BROJ += 1
goto :end

:dodajZbroj
set /A ZBROJ += 1
goto :end


rem ---
:kraj
echo.

:end
endlocal