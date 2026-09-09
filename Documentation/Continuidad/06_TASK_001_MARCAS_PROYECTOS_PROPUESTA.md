# TASK_001 — Marcas y proyectos con persistencia local
Estado: propuesta preparada, pendiente de contrastar con código y documentación originales. No implementada.

## Objetivo de producto confirmado
Crear una marca y un proyecto, guardarlos localmente y recuperarlos al reabrir Abrxos.

## Alcance mínimo propuesto
Marca: identidad estable, nombre no vacío y fechas de creación/actualización.
Proyecto: identidad estable, nombre no vacío, referencia a una marca existente y fechas de creación/actualización.
Interfaz SwiftUI: listado de marcas, creación de marca, listado de sus proyectos y creación de proyecto. Estados vacíos y errores de guardado comprensibles. Selección de una marca para crear su proyecto.
Estos campos son una propuesta mínima de esta tarea, no una definición histórica ya aprobada. Ajustar a las reglas originales y registrar la decisión.

## Antes de modificar
Leer AGENTS.md y las reglas documentadas; verificar git status; inspeccionar modelos o persistencia ya existentes; descubrir esquema real con xcodebuild -list -project App/Abrxos/Abrxos.xcodeproj.
No reemplazar funciones si existe avance posterior a 969b084. Respetar modificaciones pendientes del usuario.

## Implementación
Elegir y justificar la persistencia mínima compatible con la arquitectura y deployment target actuales. No imponer SwiftData ni JSON sin inspección. Separar dominio, guardado e interfaz lo suficiente para comprobarlos. Usar una ubicación local apropiada del contenedor de la aplicación, no el repositorio ni Descargas. Manejar lectura fallida sin sustituir silenciosamente datos existentes por una base vacía. Mantener identidad y relación marca-proyecto después de guardar.
No cambiar requisitos de macOS, firma, frameworks o arquitectura sin necesidad explicada. Registrar archivos nuevos en el target si la estructura de Xcode lo requiere.

## Fuera de alcance
Gemini dentro de la app, Firebase, sincronización, edición de vídeo, subtítulos, generación de imágenes, borrado en cascada y rediseño completo.

## Aceptación
1. La app compila para My Mac con el esquema real.
2. Una marca creada aparece en el listado.
3. Un proyecto se crea asociado a esa marca.
4. Al cerrar por completo y reabrir la app, ambos se recuperan con identidad y relación conservadas.
5. No se aceptan nombres vacíos o solo espacios.
6. Un error de persistencia se comunica sin afirmar un guardado exitoso.
7. El flujo funciona sin conexión Gemini.
8. Comprobaciones útiles de persistencia: escritura y lectura desde almacenamiento temporal real, asociación y error de lectura; evitar pruebas que solo repiten la implementación.

## Entrega
Diff revisable, pruebas realizadas con resultado, pasos para comprobación manual, actualización de Documentation/ESTADO_ACTUAL.md y tarea. Si se crea commit, registrar hash. No marcar aceptación manual antes de que exista evidencia.
