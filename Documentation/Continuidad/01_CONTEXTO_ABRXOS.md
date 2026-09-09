# Abrxos — contexto de continuidad
Corte: 9 de septiembre de 2026. Fuente: conversación y resultados de Terminal aportados por el usuario. Este paquete no es una copia ni una auditoría del repositorio actual del Mac.

## Objetivo y alcance
Abrxos es una aplicación macOS para organizar marcas, proyectos, conocimiento y producción de contenido multimedia. Se construye por módulos comprobables, con procesamiento local y asistencia de IA opcional. El alcance completo de la edición de vídeo aún requiere la arquitectura original; no inventar funciones o requisitos ausentes.

## Decisión vigente del usuario
- Cursor gratuito no permite al usuario trabajar con los modelos que necesita.
- El usuario no puede usar Codex. No insistir en Codex ni en conectar ChatGPT Plus.
- Ejecutor elegido: OpenCode con una clave de Gemini API creada en Google AI Studio.
- ChatGPT Projects/Work sirve para continuidad, arquitectura, tareas y revisión.
- Xcode compila, depura y ejecuta la aplicación. Gemini en Xcode es una posibilidad pendiente de verificar.
- No financiar el flujo con cuentas sucesivas ni asumir cuotas ilimitadas.

## Entorno reportado
Mac Apple Silicon; usuario local lordjef. Repositorio: /Users/lordjef/Developer/Abrxos.
Xcode movido a /Applications/Xcode-beta.app; versión reportada 27.0, build 27A5252f.
Swift reportado 6.4; SDK macOS 27.0; Git 2.54.0. Datos históricos de la sesión, no comprobados de nuevo al crear este paquete.
Proyecto: App/Abrxos/Abrxos.xcodeproj. SwiftUI nativo. No migrar a React/Tauri por menciones de conversaciones anteriores.

## Forma de acompañar al usuario
Español sencillo, instrucciones copiables, pasos concretos y ordenados. Indicar si se pegan en Terminal, OpenCode o ChatGPT. Explicar el resultado esperado. No repetir preparaciones ya confirmadas. No pedir una clave API en el chat.

## Continuidad
Leer primero 02_ESTADO_Y_EVIDENCIAS.md y los archivos originales del repositorio cuando estén adjuntos. Un chat no obtiene acceso al Mac por conocer una ruta. Las exportaciones son instantáneas: registrar fecha y commit. Ante discrepancias, contrastar código y evidencia reciente con la documentación; conservar decisiones explícitas del usuario y explicar cualquier conflicto.
