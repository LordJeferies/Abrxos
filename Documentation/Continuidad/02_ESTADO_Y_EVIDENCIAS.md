# Estado y evidencias de Abrxos
Corte: 2026-09-09. Confirmado mediante salidas y descripciones compartidas; no inspección directa actual del Mac.

| Elemento | Estado | Evidencia |
|---|---|---|
| Repositorio local independiente | Creado, rama main | Salida de git init |
| Base documental | Registrada | Commit 844ce39: docs: establecer base inicial de Abrxos |
| App macOS SwiftUI mínima | Compiló y abrió | Ventana Hello, world! y Running Abrxos reportadas |
| App y actualización documental | Registradas | Commit 969b084: chore: registrar app macOS inicial y primer arranque |
| Árbol de trabajo | Limpio en última comprobación | nothing to commit, working tree clean |
| Pruebas automatizadas | No ejecutadas según contexto | Hay archivos de plantilla; no evidencia de ejecución |
| Funciones de marcas/proyectos | Pendientes | Solo app mínima confirmada |
| Persistencia | Pendiente | Sin implementación verificada |
| Gemini en OpenCode | Elegido, no conectado aún de forma verificada | Solicitud vigente del usuario |
| Gemini dentro de Abrxos | Diseño opcional, no implementado | Decisión previa |
| Gemini en Xcode | Pendiente de verificar | No asumir conexión operativa |
| GitHub | Publicación pendiente/no verificada | No hay URL remota confirmada |

## Archivos originales reportados
AGENTS.md; .gitignore; .cursor/rules/abrxos.mdc.
Documentation/LEER_PRIMERO.md, CONTEXTO.md, ARQUITECTURA.md, ROADMAP.md, ESTADO_ACTUAL.md, DECISIONES.md y Tasks/TASK_000_BASE.md.
App/Abrxos/Abrxos.xcodeproj/project.pbxproj y project.xcworkspace/contents.xcworkspacedata.
App/Abrxos/Abrxos/AbrxosApp.swift, ContentView.swift y Assets.xcassets.
App/Abrxos/AbrxosTests/AbrxosTests.swift; App/Abrxos/AbrxosUITests/AbrxosUITests.swift.
No se dispone en este paquete de los bytes actuales de esos archivos.

## Carpetas iniciales reportadas
App, Core, Modules, AI, VideoEngine, Timeline, Assets, Data, Design, Documentation/Tasks, Scripts, Tests y .cursor/rules. Una carpeta creada no demuestra un módulo implementado.

## Próximo paso
Conectar OpenCode con Google AI Studio; pedir lectura inicial de reglas, documentación y código; verificar git status y proyecto; después implementar la tarea propuesta de marcas y proyectos. No recrear el proyecto Xcode ni reinicializar Git.
