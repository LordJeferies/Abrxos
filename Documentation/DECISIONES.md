# Decisiones
D001 — Abrxos: nombre nuevo y repositorio independiente. macOS primero.
D002 — Swift/SwiftUI y frameworks Apple como base. FFmpeg no es requisito inicial.
D003 — Core y conocimiento local; Gemini opcional mediante adaptador. El proveedor no es la base de datos.
D004 — Sol Blanco/Sol Negro son datos editables y versionados, no texto fijo dentro del código.
D005 — Resultados estructurados y validados; Markdown es un formato de exportación, no un protocolo separado por ---.
D006 — Arquitecto sugiere mejoras y conserva decisiones aprobadas. Guardar explicaciones online para consulta offline, sin convertirlas automáticamente en reglas fiables.
D007 — Generación multimedia separada de análisis local. No inferir emociones ni identidades como hechos a partir de detecciones.
D008 — Reutilización por identidad de asset, versiones y usos; conservar recorte y posición por composición.
D009 — Firebase AI Logic es candidato oficial para el adaptador Swift. Validar integración macOS, App Check, modelo y coste antes de incorporarlo. No implica migrar SwiftData a Firestore.
D010 — Un ejecutor por tarea; ChatGPT prepara y revisa, Cursor o agente Xcode implementa y comprueba. Documentos actualizados por tarea, no automáticamente por GitHub.
## Fuentes de la incorporación Gemini (consultadas 2026-09-09)
SDK Swift y proxy: https://firebase.google.com/docs/ai-logic
Generación visual: https://firebase.google.com/docs/ai-logic/generate-images-gemini
Salidas estructuradas: https://ai.google.dev/gemini-api/docs/structured-output
Los ejemplos de código pegados por el usuario mezclan generaciones de APIs y no son código aprobado. Elegir modelos y límites contra documentación vigente en la tarea de integración.
