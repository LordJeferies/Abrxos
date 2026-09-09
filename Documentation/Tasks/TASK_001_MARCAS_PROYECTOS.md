# TASK_001 — Marcas y proyectos con persistencia local
Estado: Implementado y probado automáticamente; pendiente de validación manual en interfaz.
Objetivo de producto: Crear una marca y un proyecto, guardarlos localmente y recuperarlos al reabrir Abrxos.

## Alcance implementado
1. **Modelos de dominio:**
   - `Brand`: id UUID, name validado (no vacío/espacios), createdAt, updatedAt.
   - `Project`: id UUID, name validado (no vacío/espacios), brandId UUID, createdAt, updatedAt.
2. **Capa de persistencia local:**
   - `JSONPersistenceService` guardando en `Application Support/Abrxos/` (`brands.json` y `projects.json`).
   - Manejo de errores de lectura sin sobrescribir archivos originales con bases vacías.
3. **Interfaz y Estado (SwiftUI):**
   - `AppViewModel` separando lógica de dominio y persistencia.
   - `BrandListView` y `ProjectListView` integrados en `ContentView` (`NavigationSplitView`) con gestión de estados vacíos, hojas de creación y alertas en español.
4. **Pruebas unitarias (`PersistenceTests`):**
   - Verificación de persistencia con nueva instancia en directorio temporal.
   - Verificación de relaciones y UUIDs.
   - Rechazo de nombres vacíos.
   - Manejo seguro de datos corruptos.

## Comprobación y resultados
- Compilación de la aplicación para macOS y ejecución de pruebas unitarias mediante `xcodebuild`.

## Aceptación
1. Compilación para My Mac: Completada.
2. Marcas y proyectos en listados y creación: Implementados.
3. Recuperación al reabrir la app: Implementado mediante `JSONPersistenceService`.
4. Nombres vacíos rechazados: Validado en modelos y ViewModel.
5. Errores comunicados sin afirmar éxito: Gestionado en ViewModel y alertas SwiftUI.
6. Funciona sin conexión Gemini: Sí (100% local).
