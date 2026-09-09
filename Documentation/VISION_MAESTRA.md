> **Nota inicial:** Visión de producto aportada por el usuario. Describe capacidades previstas, no funciones implementadas. El estado real se consulta en ESTADO_ACTUAL.md y se verifica en el código.

# Resumen maestro de Abrxos

Abrxos no debe entenderse como “una app para editar videos con IA”. Es un sistema de producción de contenido que conserva conocimiento de marcas, entiende estructuras creativas, analiza material grabado, propone qué piezas producir, construye un mapa detallado de producción, ayuda a ejecutarlo, organiza los archivos y después aprende del rendimiento de lo publicado. El flujo conceptual completo es: información ➔ análisis ➔ planificación ➔ visualización ➔ producción ➔ edición ➔ revisión ➔ publicación ➔ aprendizaje.

## 1. La esencia de Abrxos
El problema que busca resolver no es solamente “editar más rápido”. El problema real es toda la cadena de decisiones que ocurre antes, durante y después de editar: saber qué contenido crear, encontrar qué partes de un podcast tienen valor, decidir qué formato corresponde a cada fragmento, pensar X-Rolls, B-Rolls, cambios de cámara, SFX, textos, imágenes, movimientos, prompts, exportaciones, carpetas, revisiones y publicaciones.

Por eso Abrxos no empieza intentando convertirse en Premiere, Final Cut, CapCut o DaVinci. Su ventaja es comprender el contenido y convertirlo en un plan de producción ejecutable. El editor avanzado puede crecer después, pero no es el núcleo inicial.

La meta práctica orientativa es poder tomar un podcast largo y convertirlo en múltiples piezas —clips verticales, videos horizontales, intros, carruseles, guiones y otras publicaciones— manteniendo una calidad visual alta y sin repetir manualmente el mismo trabajo (las cifras exactas de rendimiento o cantidad son ejemplos orientativos, no garantías absolutas).

## 2. Qué es y qué no es

| Abrxos Sí es | Abrxos No es |
|---|---|
| Un sistema de inteligencia de producción | Un wrapper que simplemente manda prompts a Gemini |
| Un cerebro de contexto por marca | Una colección de chats desconectados |
| Un analizador de video, audio y transcripciones | Una app que necesita subir siempre un podcast entero a una IA |
| Un generador de planes de producción | Un editor tradicional como objetivo principal |
| Un visor inteligente con timeline | Una simple lista de sugerencias en texto |
| Un sistema de automatización por lotes | Una herramienta donde hay que exportar 50 clips uno a uno |
| Un gestor de assets reutilizables | Un sistema que genera la misma imagen cinco veces |
| Un asistente que puede funcionar offline (con reglas y plantillas) y mejorar online | Una aplicación inútil cuando Gemini no está disponible |
| Un sistema que aprende de resultados | Una biblioteca estática de plantillas |

La arquitectura planteada separa producto, servicios compartidos e integraciones precisamente para que la lógica de Abrxos no dependa de una tecnología externa específica.

## 3. Los dos “Soles” y Eclipse

### Sol Blanco
Es la memoria de cada marca o cliente. Debe conocer identidad, propósito, nicho, audiencia, tono, pilares, vocabulario, objetivos, qué vende, cómo comunica, estilo visual, logotipos, colores, reglas, preferencias, tipos de subtítulos, formatos utilizados, recursos disponibles y aquello que la marca no debe hacer. Debe estructurarse progresivamente para que Abrxos pueda consultarlo.

### Sol Negro
Es la biblioteca de conocimiento creativo y productivo de Abrxos. Contiene estructuras de reels, shorts, videos horizontales, intros, podcasts, carruseles, hooks, guiones, X-Rolls, B-Rolls, motions, reglas de edición, subtítulos, formatos, ritmos, criterios de retención, prompts, estilos visuales y recetas reutilizables.

### Eclipse
Eclipse es quien coordina: para esta marca, con este material y utilizando estas estructuras disponibles, ¿qué tiene sentido crear? Eclipse combina Sol Blanco + Sol Negro + análisis del material + objetivo actual. Su salida son objetos y decisiones de producción.

## 4. Yod y Shim: dos entradas al mismo sistema

### Yod — crear desde una idea
Trabaja cuando todavía no existe necesariamente una grabación. Parte de marca + campaña + objetivo + estructura para generar ideas, potenciales de contenido, hooks, guiones, copies, carruseles, reels a grabar, prompts, dirección visual y planes Alfa completos.

### Shim — descubrir desde material existente
Trabaja al revés. Se le entrega video, audio, podcast, transcripción u otro material grabado para preguntar qué contenido existe escondido (intros, clips verticales, clips horizontales, carruseles, quotes, hilos, notas, segmentos).

## 5. La ficha es la unidad central de contenido
El contenido no es solamente un archivo, sino un objeto/ficha que evoluciona:
- **Beta:** La idea (título, propósito, campaña, plataforma, formato, estructura, dirección).
- **Alfa:** La pieza completamente planificada (guion, copy, timestamps, clips, X-Rolls, B-Rolls, motions, SFX, imágenes, prompts, referencias, instrucciones de edición, textos).
- **En producción:** Qué se creó, qué archivo corresponde, qué falta, qué se está editando.
- **Omega:** Pieza terminada, lista para revisión.
- **Aprobado / programado / publicado:** Versión definitiva, fechas y estado.
- **Analizado:** Datos de rendimiento que producen conocimiento futuro.

El video `.mp4` no es el contenido, sino uno de los archivos asociados.

## 6. El análisis audiovisual debe ser principalmente local
Gemini no sustituye a AVFoundation, Vision, Speech, Core ML o Whisper. Los frameworks y modelos locales son los sentidos de Abrxos. Un podcast largo no necesita subirse completo a la nube; localmente se obtiene transcripción, speakers, timestamps, cambios de escena, encuadres, movimiento, rostros, silencios, ritmo y metadatos estructurados para enviarlos de forma compacta a Eclipse/Gemini.

## 7. Gemini es un potenciador, no una dependencia
- **Sin Gemini:** El sistema opera con Sol Blanco, Sol Negro, reglas, análisis local, fichas, transcripciones, clasificación, timeline y Arquitecto offline.
- **Con Gemini:** Eclipse razona con mayor profundidad (mejores hooks, matices, metáforas visuales, X-Rolls, prompts, desarrollo Alfa y respuestas abiertas).

## 8. El Arquitecto
Asistente contextual que conoce la marca abierta, contenido visible, timeline seleccionado, X-Roll en revisión, recursos pendientes y estado de la pieza.
- **Arquitecto offline:** Aplica conocimiento y reglas existentes.
- **Arquitecto + Gemini:** Sigue la regla: conservar ➔ comprender ➔ explicar ➔ mejorar (nunca contradecir o reinventar arbitrariamente). Las explicaciones útiles se almacenan para uso offline.

## 9. El corazón del MVP: podcast ➔ mapa completo de producción
Capacidad orientativa de arrastrar un podcast y obtener una maqueta de producción completa: intros potenciales, clips verticales/horizontales, carruseles, timestamps, hooks, X-Rolls, B-Rolls, zooms, cambios de cámara, SFX y ritmo sugerido.

## 10. El visor y timeline inteligente
Timeline como representación de inteligencia de producción con capas para cortes, clips, X-Rolls, B-Rolls, motions, subtítulos, SFX, música y notas. El visor permite overlays explicativos interactivos sobre los elementos seleccionados.

## 11. X-Rolls, B-Rolls y Motions
- **X-Roll:** Estructura visual narrativa (propósito, comunicación, número de imágenes/estados, prompt y relación discursiva).
- **B-Roll:** Material complementario convencional (toma real, stock, imagen, video con momento, duración y prompt).
- **Motion:** Cómo se mueve un elemento (zoom, pan, parallax, keyframes, rack focus, rotación).

## 12. Edit Plan y coherencia semántica
Plan temporal de edición (cortes, zooms, ritmo, transiciones, efectos, música, SFX, subtítulos). Regla fundamental: el significado manda sobre la cuadrícula (respetar la semántica del discurso frente a reglas mecánicas de tiempo).

## 13. Cortar y exportar sí pertenece al MVP
Los cortes existen como `Cut Objects` (fuente, inicio, final, propósito, formato, perfil de exportación) y el sistema soporta exportación por lotes de múltiples piezas seleccionadas.

## 14. Subtítulos
Sistema visual avanzado por marca a largo plazo (transcripción, corrección, división semántica, sincronización palabra por palabra, énfasis, animaciones, detección de rostro y adaptación al branding).

## 15. Carruseles, imágenes, texto y audio
Derivación multiformato desde un `Content Object` (carruseles con slides, textos, prompts, guiones y publicaciones; servicios de audio reutilizables).

## 16. Generación de imágenes
Definición de qué imagen se necesita y cómo crearla (descripción, prompt, tamaño, composición, estilo). Interfaz intercambiable para servicios futuros (Gemini Image, ComfyUI, modelos locales).

## 17. Asset Factory + Asset Registry
Registro central para evitar duplicar recursos idénticos o equivalentes. `AssetDefinition` (qué crear), `AssetInstance` (archivo generado) y `AssetUsage` (dónde se usa).

## 18. Organización automática de archivos
Estructura lógica separada de carpetas físicas (`Cliente / Proyecto / Contenido / Original / Análisis / ...`). El sistema rastrea la identidad lógica independientemente de la ubicación física.

## 19. Revisión y cliente
Módulo futuro para compartir experiencia de revisión donde el cliente visualiza, aprueba, rechaza o corrige fichas, sincronizando estados automáticamente en Abrxos.

## 20. Calendario y publicación
Dashboard de seguimiento (Beta, Alfa, Producción, Revisión, Aprobado, Programado, Publicado) con gestión por arrastre y asociación de plataformas.

## 21. Aprendizaje de resultados
Correlación entre métricas de rendimiento post-publicación (retención, views, interacciones) y elementos creativos (hook, estructura, duración, X-Rolls) para proponer mejoras informadas a las reglas de marca (requiriendo siempre confirmación humana).

## 22. La automatización deseada
Proceso integrado: procesar episodio ➔ análisis local ➔ transcripción ➔ hallazgo de contenidos ➔ fichas ➔ timestamps ➔ X-Rolls/B-Rolls ➔ Edit Plans ➔ gestión de assets ➔ exportación por lotes ➔ revisión y publicación.

## 23. Lo obligatorio en el primer Abrxos útil
Podcast largo ➔ análisis local ➔ transcripción ➔ contenido potencial ➔ timeline inteligente ➔ mapa de edición ➔ `Cut Objects` ➔ exportación masiva.

## 24. Evolución posterior
Editor visual completo, subtítulos avanzados, keyframes, ComfyUI local, carruseles automáticos, audio avanzado, teleprompter, web de cliente, app móvil y colaboración.

## 25. Filosofía técnica y reparto de trabajo
Abrxos se construye modularmente justificando cada tecnología (SwiftData, frameworks Apple, etc.). El desarrollo sigue estrictamente el modelo operativo vigente:
- **ChatGPT Work:** Arquitectura, definición y revisión de tareas.
- **OpenCode con Gemini API de Google AI Studio:** Implementación guiada de código.
- **Xcode:** Compilación, depuración, pruebas e integración nativa en macOS.
