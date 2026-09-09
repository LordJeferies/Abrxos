#!/usr/bin/env bash
set -e

PORT=8080
HOST="127.0.0.1"
STATUS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../Status" && pwd)"

if [ ! -d "$STATUS_DIR" ]; then
    echo "Error: No se encuentra la carpeta Status en $STATUS_DIR"
    exit 1
fi

echo "=================================================="
echo "  Abrxos — Panel Local de Seguimiento del Desarrollo"
echo "=================================================="
echo "Sirviendo contenido desde: $STATUS_DIR"
echo "URL: http://$HOST:$PORT"
echo "Para detener el servidor, presiona Ctrl+C."
echo "=================================================="

if lsof -i :$PORT >/dev/null 2>&1; then
    echo "Aviso: El puerto $PORT ya está ocupado."
    echo "Por favor, detén el proceso que lo usa o cambia de puerto."
    exit 1
fi

(sleep 1 && open "http://$HOST:$PORT/index.html") &

cd "$STATUS_DIR"
python3 -m http.server $PORT --bind $HOST
