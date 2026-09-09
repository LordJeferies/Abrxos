#!/usr/bin/env bash
set -e
# Prepara la salida pública independiente de la web AbrxOS.
# Incluye únicamente: index.html, styles.css, app.js y status.json filtrado.
# No copia el repositorio, Documentation, App/, ni logs internos.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STATUS_DIR="$ROOT/Status"
PUBLIC_DIR="$ROOT/Public"

if [ ! -f "$STATUS_DIR/status.json" ]; then
  echo "Error: no existe $STATUS_DIR/status.json"
  exit 1
fi

echo "Validando JSON..."
python3 -m json.tool "$STATUS_DIR/status.json" > /dev/null
echo "JSON válido."

# Control básico de datos privados antes de publicar (solo en el JSON público y rutas personales)
if grep -E "/Users/|/home/" "$STATUS_DIR/status.json" 2>/dev/null; then
  echo "Aviso: posible ruta personal en status.json. Revísalo antes de publicar."
  exit 1
fi
if grep -R -E "AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z_-]{20,}|xox[bap]-|-----BEGIN [A-Z ]*PRIVATE KEY" "$STATUS_DIR" 2>/dev/null; then
  echo "Aviso: posible secreto en Status/. Revísalo antes de publicar."
  exit 1
fi

rm -rf "$PUBLIC_DIR"
mkdir -p "$PUBLIC_DIR"

cp "$STATUS_DIR/index.html" "$PUBLIC_DIR/index.html"
cp "$STATUS_DIR/styles.css" "$PUBLIC_DIR/styles.css"
cp "$STATUS_DIR/app.js" "$PUBLIC_DIR/app.js"

# Campos explícitamente seleccionados para publicación:
# fase, tarea, actividad, hitos, comprobaciones, pendientes, historial y fecha real.
python3 - "$STATUS_DIR/status.json" "$PUBLIC_DIR/status.json" <<'PY'
import json, sys
src, dst = sys.argv[1], sys.argv[2]
with open(src, encoding="utf-8") as f:
    data = json.load(f)
public = {
    "lastUpdate": data.get("lastUpdate"),
    "phase": data.get("phase"),
    "phaseObjective": data.get("phaseObjective"),
    "activeTask": data.get("activeTask"),
    "workInProgress": data.get("workInProgress"),
    "checks": data.get("checks"),
    "nextSteps": data.get("nextSteps"),
    "blockers": data.get("blockers"),
    "roadmapMilestones": data.get("roadmapMilestones"),
    "history": data.get("history"),
}
with open(dst, "w", encoding="utf-8") as f:
    json.dump(public, f, ensure_ascii=False, indent=2)
    f.write("\n")
print("status público generado con campos seleccionados.")
PY

echo "Salida pública lista en: $PUBLIC_DIR"
echo "Contenido:"
ls -1 "$PUBLIC_DIR"
echo "Para previsualizar local: cd \"$PUBLIC_DIR\" && python3 -m http.server 8081 --bind 127.0.0.1"
echo "Una edición local NO está publicada hasta terminar el despliegue manual."
