---
description: Estima tiempo invertido en la tarea actual y genera nombre corto
argument-hint: [rama-base]
---

Vas a estimar el tiempo invertido en el trabajo de esta rama:

1. Rama actual: ejecuta `git branch --show-current`
2. Rama base: usa "$1" si se pasó, si no usa `main` (verifica si existe `main` o `master`)
3. Recolecta contexto:
   - `git log <base>..HEAD --format="%h %ad %s" --date=iso` (para ver commits y timestamps reales)
   - `git diff <base>...HEAD --stat` (para ver alcance: archivos y líneas)
   - `git diff <base>...HEAD` (para entender complejidad real, no solo tamaño)
4. Con los timestamps de los commits, calcula:
   - Ventana total real (primer commit a último commit)
   - Gaps grandes entre commits (probablemente no fueron trabajados, no los cuentes como tiempo activo)
5. Con el diff, evalúa complejidad cualitativa: ¿es CRUD simple, lógica de negocio compleja, integración externa, refactor grande, UI, config?
6. Genera una estimación de horas por fase, siendo realista (no optimista):
   - Investigación / entendimiento del problema
   - Desarrollo
   - Pruebas / debugging
   - Iteración / ajustes por feedback
   - Limpieza de código
   - Commit, PR, code review propio
7. Muestra el resultado así:

**Nombre corto de la tarea:** (3-6 palabras, tipo título de ticket)

**Estimado total:** X-Y horas

| Fase | Horas estimadas |
|---|---|
| Investigación | |
| Desarrollo | |
| Pruebas/debugging | |
| Iteración | |
| Limpieza | |
| Commit/PR | |

**Nota:** breve justificación de por qué esa estimación (basado en qué viste en el diff/commits).

No inventes trabajo que no esté evidenciado en el diff o los commits. Si los timestamps de los commits sugieren que se hizo en muy poco tiempo real, sé honesto con eso en la estimación en vez de inflar por "quedar bien".
