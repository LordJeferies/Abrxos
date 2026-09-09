# Arquitectura inicial propuesta
## Explicación sencilla
Una app con módulos conectados. El conocimiento y los archivos permanecen disponibles localmente. Gemini ayuda a crear y explicar cuando se solicita y está disponible.
## Diseño técnico
App: composición de dependencias, navegación SwiftUI y ciclo de vida.
Core: entidades e identificadores de cliente, marca, proyecto, campaña, contenido y revisiones; contratos sin dependencia de proveedores.
Data: persistencia local mediante adaptadores; SwiftData como opción inicial a validar con la primera entrega.
Modules: Sol Blanco, Sol Negro, Yod, Arquitecto y gestión de assets.
AI: Eclipse, construcción de contexto, validación de respuestas, reglas locales y adaptador Gemini.
VideoEngine: servicios AVFoundation; análisis Vision y transcripción sujetos a capacidades verificadas. Diarización, temas y silencios son operaciones distintas; no asumir que un framework las resuelve juntas.
Timeline: modelo no destructivo; distinguir tiempo de fuente, posición en composición y duración. Compartir interpretación entre visor y exportación.
Assets: recursos de diseño versionables. Originales reales, cachés y archivos de clientes van fuera del repositorio, por ejemplo LocalData/ ignorado.
Scripts: diagnóstico y automatización del desarrollo. Futura CLI usa los mismos servicios que App.
Tests: pruebas de reglas, persistencia, contratos y conexiones relevantes.
## Contratos de IA
Generación de texto y generación de imágenes son capacidades independientes.
ContextRequest identifica marca/revisión, estructura/revisión, tarea, fragmentos fuente y restricciones.
GenerationResult incluye salida estructurada, proveedor, modelo, versión del prompt, fuentes y estado de revisión. Validar JSON, referencias y reglas de negocio antes de aceptar.
Las respuestas del proveedor no escriben directamente sobre fichas aprobadas.
Local significa sin llamadas externas. Nube opcional significa solo operaciones habilitadas por usuario; pérdida de conexión no activa otro proveedor de pago silenciosamente.
Reglas offline permiten completar plantillas y consultar guías. Un chat generativo offline necesita un modelo local disponible; no prometer equivalencia con Gemini.
## Recursos compartidos
AssetDefinition: identidad estable y especificación de lo que debe producirse.
AssetVersion: archivo y metadatos de una versión producida y validada.
AssetUsage: referencia desde un clip/episodio, con recorte y transformación propios.
Una misma definición compartida genera un trabajo por versión de especificación. No deduplicar únicamente por nombre XR01 ni por similitud del prompt.
Similitud semántica propone reutilización; no fusiona automáticamente.
Una imagen puede necesitar variantes por encuadre. Versiones aprobadas quedan fijadas; una regeneración no las sustituye automáticamente.
Archivos externos requieren importación/observación y asociación con identidad; no basta con que aparezca cualquier archivo en una carpeta.
Cola persistente con estados pendiente, procesando, completado, fallido y cancelado. Reintentos controlados; después de timeout de proveedor el resultado puede ser incierto y repetir puede duplicar costes.
