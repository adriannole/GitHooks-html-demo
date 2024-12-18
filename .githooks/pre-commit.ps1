#!/bin/bash

# Script pre-commit para validar index.html

echo "Ejecutando validación del archivo HTML..."

# Verificar si existe el archivo index.html
if [ ! -f "index.html" ]; then
    echo "❌ Error: No se encontró index.html. No se puede hacer commit."
    exit 1
fi

# Validar si el archivo contiene la etiqueta <!DOCTYPE html>
if ! grep -q "<!DOCTYPE html>" index.html; then
    echo "❌ Error: El archivo index.html no contiene la etiqueta <!DOCTYPE html>."
    exit 1
fi

# Validar que el archivo contiene la etiqueta de cierre </html>
if ! grep -q "</html>" index.html; then
    echo "❌ Error: El archivo index.html no contiene la etiqueta de cierre </html>."
    exit 1
fi

echo "✅ Validación completada: El archivo index.html es válido. Commit permitido."
exit 0