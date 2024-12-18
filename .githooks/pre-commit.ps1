Write-Host "Ejecutando validación del archivo HTML..." -ForegroundColor Cyan

# Verificar si el archivo index.html existe
if (!(Test-Path "index.html")) {
    Write-Error "❌ Error: No se encontró index.html. No se puede hacer commit."
    exit 1
}

# Validar contenido del archivo index.html
$indexContent = Get-Content "index.html"

if ($indexContent -notmatch "<!DOCTYPE html>") {
    Write-Error "❌ Error: El archivo index.html no contiene <!DOCTYPE html>."
    exit 1
}

if ($indexContent -notmatch "</html>") {
    Write-Error "❌ Error: El archivo index.html no contiene </html>."
    exit 1
}

Write-Host "✅ Validación completada: El archivo index.html es válido." -ForegroundColor Green
exit 0
