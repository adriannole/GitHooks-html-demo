Write-Host "Ejecutando validación del archivo HTML..." -ForegroundColor Cyan

# Verifica si el archivo existe
if (!(Test-Path "index.html")) {
    Write-Error "❌ Error: No se encontró index.html. No se puede hacer commit."
    exit 1
}

# Imprime la primera línea del archivo para diagnóstico
$firstLine = (Get-Content "index.html" -First 1)
Write-Host "Primera línea del archivo: '$firstLine'" -ForegroundColor Yellow

# Realiza la comparación exacta
if ($firstLine -notmatch "<!DOCTYPE html>") {
    Write-Error "❌ Error: El archivo index.html no contiene <!DOCTYPE html>."
    exit 1
}

Write-Host "✅ Validación completada: El archivo index.html es válido." -ForegroundColor Green
exit 0
