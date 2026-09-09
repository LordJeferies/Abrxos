# Arquitectura y decisiones conservadas
Resumen de decisiones presentes en la conversación. Complementa la ARQUITECTURA.md original; no la sustituye.

| Concepto | Responsabilidad prevista |
|---|---|
| Core y persistencia | Identidad, marcas, proyectos y guardado local |
| Sol Blanco | Conocimiento de marca editable y versionado |
| Sol Negro | Estructuras, plantillas y reglas de producción |
| Eclipse | Selección de contexto y coordinación de solicitudes |
| Análisis local | Transcripción, metadatos y detecciones mediante motores compatibles |
| Adaptador Gemini | Asistencia online opcional y desacoplada |
| Arquitecto | Explicaciones y propuestas sobre fichas existentes |
| Registro de assets | Identidad de recursos reutilizables entre contenidos |

## Decisiones previas
1. La app debe abrir y permitir sus funciones locales sin Gemini.
2. Sin modelo local, offline significa consultas guardadas, plantillas y reglas; no razonamiento ilimitado.
3. Transcripción, hablantes y detección de temas son funciones diferentes y se validan por separado.
4. Las sugerencias de IA no sobrescriben fichas aprobadas automáticamente.
5. Conservar procedencia y revisión del conocimiento generado. Guardar una respuesta no la vuelve correcta.
6. Pedir respuestas estructuradas y validar campos, referencias y reglas.
7. Analizar material largo por segmentos y enviar el contexto necesario.
8. Reutilizar assets por identidad; cada uso puede tener su propio encuadre y posición. Prompts parecidos no prueban identidad.
9. Separar servicios de texto y generación visual. ComfyUI es un adaptador futuro.
10. Firebase AI Logic para Swift se mencionó como candidato, no como dependencia instalada ni decisión definitiva. No incorporar Firestore automáticamente.

## Separación necesaria
Gemini en OpenCode ayuda a escribir código durante el desarrollo. Gemini dentro de Abrxos será una función futura del producto. Conectar el primero no implementa el segundo ni autoriza incrustar la clave de desarrollo en la app.

## Orden conservado
App mínima (confirmada) → Core y persistencia de marcas/proyectos → Eclipse con plantillas y Gemini opcional → capacidades multimedia y generación visual según roadmap original y dependencias reales. No tratar este resumen como un roadmap exhaustivo.
