# Configuración: OpenCode con Gemini API
Verificación documental: 2026-09-09. La cuenta y el Mac del usuario no se han conectado ni probado desde este chat.

## Ruta principal
1. Descargar OpenCode Desktop para macOS Apple Silicon desde https://opencode.ai/download y abrirlo.
2. Abrir /Users/lordjef/Developer/Abrxos, la raíz que contiene AGENTS.md y Documentation.
3. Crear o consultar una clave en https://aistudio.google.com/apikey. Usar un proyecto propio y revisar su nivel y cuota. No compartir la clave en ChatGPT.
4. En el selector de proveedores de OpenCode, buscar Google / Google Generative AI (Gemini) y conectar mediante API key. Usar el proveedor de Gemini Developer API / AI Studio; Vertex AI tiene otra configuración.
5. Si se usa la interfaz de Terminal de OpenCode, /connect abre la conexión y /models selecciona el modelo. Son comandos dentro de OpenCode, no comandos de bash. En Desktop usar los controles equivalentes de proveedor/modelo; las etiquetas pueden variar.
6. Elegir un modelo Gemini de texto que admita herramientas y tenga cuota en el proyecto. No elegir modelos de imagen, audio o embedding para implementar código. No se fija un ID sin verificar la lista real de la cuenta.
7. Pegar 08_INICIO_OPENCODE.txt. Primera prueba: lectura del proyecto y git status sin modificaciones. Registrar modelo exacto, versión de OpenCode y resultado, nunca la clave.

## Si se necesita OpenCode en Terminal
Con Homebrew ya instalado: brew install anomalyco/tap/opencode
Después:
    cd "$HOME/Developer/Abrxos"
    opencode
Si Homebrew no existe, usar Desktop; no instalar otro gestor solo para esta prueba.

## Cuotas y errores
La clave identifica el proyecto de Google; no elimina cuotas ni implica un plan de pago. El nivel gratuito depende del modelo y del proyecto. Revisar AI Studio antes de seleccionar un modelo; no habilitar facturación automáticamente.
Un 429 puede indicar cuota o límite temporal: leer el error y la cuota, detener reintentos repetidos. Un 401/403 puede corresponder a credencial, permisos o restricciones; compartir solo el texto con secretos ocultos. Un 404 puede indicar un modelo o endpoint incorrecto.
OpenCode y Xcode pueden consumir la cuota del mismo proyecto. Crear otra clave del mismo proyecto no crea una cuota independiente.

## Gemini en Xcode: compatibilidad por verificar
Apple permite proveedores de chat con Chat Completions API. Su documentación exige:
    {Model provider URL}/v1/models
    {Model provider URL}/v1/chat/completions
Google documenta la base compatible:
    https://generativelanguage.googleapis.com/v1beta/openai/
Por tanto no está confirmado que pegar esa base en Xcode funcione: hay que comprobar cómo la versión instalada construye las rutas. Puede requerir un adaptador. No se incluye ni se instala un proxy en este paquete.
En Xcode > Settings > Intelligence, distinguir Agents de Chat. Un proveedor de chat no equivale a un agente autónomo. Si aparece un agente Gemini instalable, su autenticación propia debe comprobarse; no asumir que el campo del proveedor de chat sirve para él.
Para investigar esa opción, compartir una captura de Intelligence y del formulario del proveedor, con la clave oculta. Mientras tanto OpenCode puede trabajar sobre los mismos archivos y Xcode compilar sin conectar Gemini dentro de Xcode.

## Fuentes oficiales
- Proveedores OpenCode: https://opencode.ai/docs/providers/
- Selección de modelos: https://opencode.ai/docs/models/
- Instalación: https://opencode.ai/docs/
- Instrucciones AGENTS.md: https://opencode.ai/docs/rules/
- Claves Google: https://ai.google.dev/gemini-api/docs/api-key
- Cuotas por proyecto/modelo: https://ai.google.dev/gemini-api/docs/rate-limits
- Compatibilidad OpenAI: https://ai.google.dev/gemini-api/docs/openai
- Ajustes Xcode: https://developer.apple.com/documentation/xcode/setting-up-coding-intelligence
No se efectuó una solicitud API de pago ni se comprobó una clave del usuario al preparar estos archivos.
