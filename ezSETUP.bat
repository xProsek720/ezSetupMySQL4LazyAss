@echo off
SETLOCAL

REM Sprawdzenie, czy podano odpowiednią liczbę argumentów
if "%~4"=="" (
    echo Użycie: ezSETUP.bat <host> <username> <password> <database>
    exit /b 1
)

REM Pobranie argumentów wiersza poleceń
set SERVER=%1
set USERNAME=%2
set PASSWORD=%3
set DATABASE=%4

REM Instalacja wymaganych pakietów Pythona
pip install bcrypt mysql-connector-python

REM Uruchomienie skryptu SQL
mysql -h %SERVER% -u %USERNAME% -p%PASSWORD% < bazaIMPREZY.sql

REM Uruchomienie skryptu Python do aktualizacji haseł
python addPasswords.py %SERVER% %USERNAME% %PASSWORD% %DATABASE%

echo Instalacja zakończona pomyślnie.
pause
ENDLOCAL
