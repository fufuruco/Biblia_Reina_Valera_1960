@echo off
REM Ejecutador automático de Santa Biblia
REM Este archivo inicia el servidor y abre el navegador automáticamente

title Santa Biblia - Servidor Local
cls

echo.
echo ╔═══════════════════════════════════════════════════════════╗
echo ║         📖 SANTA BIBLIA - INICIANDO SERVIDOR             ║
echo ╚═══════════════════════════════════════════════════════════╝
echo.

REM Obtener la ruta actual del script
cd /d "%~dp0"

REM Verificar que existen los archivos necesarios
if not exist "santa-biblia_html(1).html" (
    echo ✗ ERROR: No se encontró santa-biblia_html(1).html
    pause
    exit /b 1
)

if not exist "Biblia.json" (
    echo ✗ ERROR: No se encontró Biblia.json
    pause
    exit /b 1
)

echo ✓ Archivos encontrados
echo ✓ Iniciando servidor en puerto 8000...
echo.
echo URL: http://localhost:8000/santa-biblia_html(1).html
echo.
echo Presiona CTRL+C para detener el servidor
echo.

REM Iniciar el servidor Python
python -m http.server 8000

pause
