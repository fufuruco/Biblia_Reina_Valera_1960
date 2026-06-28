@echo off
echo Iniciando servidor local para la Biblia...
echo.
echo ✓ Asegúrate de tener Python instalado
echo.
cd /d "%~dp0"
python -m http.server 8000
pause
