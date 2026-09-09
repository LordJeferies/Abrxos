# Abrxos — instrucciones para agentes
Leer Documentation/LEER_PRIMERO.md antes de modificar el proyecto.
Nombre del producto: Abrxos. Repositorio nuevo; no importar código de proyectos anteriores sin una tarea que lo indique.
Aplicación nativa macOS, Swift y SwiftUI; módulos con contratos explícitos. iOS futuro.
Un ejecutor por tarea sobre los mismos archivos. Cambios pequeños y revisables.
No sustituir decisiones creativas aprobadas con respuestas de IA. Proponer una revisión separada.
No incorporar Firebase, modelos ni otras dependencias hasta la tarea correspondiente.
No incluir credenciales, originales multimedia ni datos reales de clientes en Git.
Al cerrar una tarea: registrar archivos modificados, comprobaciones realmente ejecutadas, resultados y bloqueos; actualizar ESTADO_ACTUAL.md, status.json y la tarea. No declarar completado por compilar solamente.
- Al iniciar una tarea, actualizar la actividad en status.json.
- Al bloquearse, registrar el bloqueo en status.json.
- Al cerrar una entrega, actualizar estado, evidencias e historial en status.json.
- Mantener ESTADO_ACTUAL.md coherente con el panel.
Si no se ejecutaron pruebas o la app, decirlo. No inventar resultados de análisis ni avances.


<!-- ABRXOS_CONTINUIDAD_2026_09_09 -->
## Continuidad y ejecutor vigente
Lee Documentation/Continuidad/01_CONTEXTO_ABRXOS.md,
02_ESTADO_Y_EVIDENCIAS.md y 04_METODO_DE_TRABAJO.md dentro de esa carpeta.
Decisión del usuario: OpenCode con Gemini API de Google AI Studio sustituye a
Cursor como ejecutor principal; Codex no está disponible para este flujo.
Conserva las demás reglas de este archivo y contrasta la documentación con el
código actual. El estado del 2026-09-09 es histórico, no una auditoría del HEAD.
No regeneres este archivo con /init. Nunca incluyas claves en prompts o commits.
