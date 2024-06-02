@echo off
SETLOCAL

REM Pytanie o wersję MySQL do zainstalowania
set /p MYSQL_VERSION="Podaj wersję MySQL (np. 8.0): "

REM Pobieranie i instalacja MySQL Server
echo Pobieranie i instalacja MySQL Server %MYSQL_VERSION%
curl -LO https://dev.mysql.com/get/Downloads/MySQL-%MYSQL_VERSION%/mysql-%MYSQL_VERSION%-winx64.zip
tar -xf mysql-%MYSQL_VERSION%-winx64.zip
cd mysql-%MYSQL_VERSION%-winx64

REM Konfiguracja MySQL Server
echo Konfiguracja MySQL Server
mysqld --initialize --console
mysqld --install MySQL

REM Uruchomienie MySQL Server
echo Uruchomienie MySQL Server
net start MySQL

echo Instalacja zakończona. Domyślne hasło root jest wyświetlone w konsoli powyżej.
pause
ENDLOCAL
