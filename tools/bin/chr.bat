@ECHO OFF

set params=%*
set cors=

if [%1]==[] (
	echo usage: chr [name]
	goto:eof
)

if EXIST "C:\Chrome\%params%\cors" (
	set cors=--disable-web-security --ignore-certificate-errors
)

if EXIST "C:\Chrome\%params%" (
	goto:abrir
)

:ask
echo Deseja criar o Chrome "%params%" (y/cors/n):
set /p ans=
if ["%ans%"] EQU ["n"] (
	goto:eof
)

if ["%ans%"] EQU ["y"] (
	goto:abrir
)

if ["%ans%"] EQU ["cors"] (
	set cors=--disable-web-security --ignore-certificate-errors
	goto:abrir
)

goto:ask

:abrir
start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --user-data-dir="C:\Chrome\%params%" %cors%

if ["%ans%"] EQU ["cors"] (
	touch "C:\Chrome\%params%\cors"
)