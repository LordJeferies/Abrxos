# Método de trabajo
Decisión vigente: ChatGPT Work + OpenCode con Gemini API de AI Studio + Xcode + Git local.

## Ciclo de una tarea
1. ChatGPT concreta objetivo, alcance, criterios de aceptación y decisiones pendientes.
2. OpenCode lee AGENTS.md, instrucciones de continuidad, documentación relevante y código afectado; consulta git status.
3. Implementa una tarea delimitada usando el proyecto existente. No arrastra refactorizaciones ajenas.
4. Compila y realiza comprobaciones útiles. Puede usar xcodebuild desde el Mac; una respuesta del modelo no prueba que compiló.
5. El usuario prueba la interfaz cuando haga falta. Registrar exactamente qué comprobó cada parte.
6. Actualizar estado, tarea y decisiones. Revisar diff y guardar un commit local cuando corresponda. No publicar ni hacer push por defecto.
7. Exportar de nuevo el contexto si va a continuarse en otro chat.

## Reglas operativas
- Un ejecutor modificando la misma tarea a la vez. Dejar constancia antes de cambiar entre OpenCode y Xcode.
- Resolver detalles rutinarios dentro del alcance; consultar decisiones que cambien producto o arquitectura.
- No ejecutar git reset --hard, clean -fd ni sobrescribir trabajo ajeno para resolver una discrepancia.
- No reescribir AGENTS.md con /init: ya existe. Leerlo y conservarlo.
- Las reglas de .cursor no se cargan automáticamente en cualquier herramienta; leerlas explícitamente cuando sean relevantes y compatibilizarlas con la decisión actual.
- Mantener claves fuera del repositorio, adjuntos, logs compartidos y prompts.
- Una cuota agotada requiere esperar o cambiar a un proveedor autorizado. No reintentos infinitos.
- No prometer un número fijo de mensajes ni que fragmentar tareas garantiza bajo consumo.

## Entrega del ejecutor
Objetivo completado; archivos modificados; decisiones tomadas; comandos de comprobación y resultados; limitaciones pendientes; pasos de prueba del usuario; git status y commit si fue creado. No afirmar pruebas que no se ejecutaron.
