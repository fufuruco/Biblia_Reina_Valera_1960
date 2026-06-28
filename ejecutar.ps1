# Santa Biblia - Ejecutador Automático
# Este script inicia automáticamente el servidor y abre la app

$scriptPath = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
Set-Location $scriptPath

Write-Host "`n" -ForegroundColor Black
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║          📖 SANTA BIBLIA - INICIANDO SERVIDOR             ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host "`n"

# Verificar archivos
$htmlFile = "santa-biblia_html(1).html"
$jsonFile = "Biblia.json"

if (-not (Test-Path $htmlFile)) {
    Write-Host "✗ ERROR: No se encontró $htmlFile" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit
}

if (-not (Test-Path $jsonFile)) {
    Write-Host "✗ ERROR: No se encontró $jsonFile" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit
}

Write-Host "✓ HTML encontrado" -ForegroundColor Green
Write-Host "✓ JSON encontrado (31,002 versículos)" -ForegroundColor Green
Write-Host "`n"

$port = 8000
$url = "http://localhost:$port/$htmlFile"

Write-Host "Iniciando servidor en puerto $port..." -ForegroundColor Yellow
Write-Host "URL: $url" -ForegroundColor Cyan
Write-Host "`n"

# Abrir navegador
Start-Sleep -Milliseconds 500
Start-Process $url

Write-Host "✓ Navegador abierto" -ForegroundColor Green
Write-Host "`nPresiona CTRL+C para detener el servidor`n" -ForegroundColor Yellow

# Iniciar servidor
python -m http.server $port
