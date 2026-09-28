---
description: Investiga a fondo un error reportado y propone fix de raíz sin implementar
argument-hint: [descripción del error o pasos para reproducir]
---

El usuario reportó este error: $ARGUMENTS

Tu trabajo es investigar a fondo, NO implementar nada todavía. Sigue este proceso:

## 0. Verifica si esto ya se resolvió antes
- Antes que nada, busca en TODAS las ramas (no solo main/actual) commits creados por `bdpa-13` o `brageanth`:
  - `git log --all --author="bdpa-13" --oneline`
  - `git log --all --author="brageanth" --oneline`
  - Si hay remoto GitHub: `gh pr list --author bdpa-13 --state all --limit 100` y `gh pr list --author brageanth --state all --limit 100`
  - También revisa PRs cerrados/mergeados y ramas sin mergear: `git branch -a | grep -iE "bdpa-13|brageanth"` (o revisa convención de nombres de rama del repo si es distinta)
- Primer filtro (rápido, por contexto): revisa nombres de branch, títulos de commit/PR, mensajes de commit y comentarios en busca de palabras clave relacionadas al síntoma reportado.
- NO te quedes solo en ese filtro de contexto. Aunque el nombre/título/comentario no mencione el bug explícitamente, sigue este paso:
  - En cuanto tengas una hipótesis de causa raíz o una idea de fix (aunque sea preliminar, del paso 3 en adelante), vuelve a este punto y busca en el código real de esos commits/PRs/branches de bdpa-13 y brageanth si ya existe una solución equivalente:
    - `git log --all --author="bdpa-13" -p -- <archivo/función relacionado>` (y lo mismo con brageanth) para ver el diff real, no solo el mensaje
    - Si el PR está en GitHub: `gh pr diff <numero>` para revisar el código propuesto, esté mergeado o no
    - Compara ese código contra la causa raíz identificada: ¿toca el mismo archivo/función/flujo? ¿aplica el mismo tipo de guard/validación/fix?
- Si encuentras que ya se resolvió (mergeado): dilo explícitamente, indica el commit/PR, y explica si el fix actual ya cubre el síntoma reportado o si sigue reproduciéndose pese a eso (posible regresión o fix incompleto).
- Si encuentras un intento no mergeado (branch/PR abierto o cerrado sin merge): dilo, resume qué hacía ese código, y evalúa si es un enfoque válido, incompleto, o descartado por alguna razón (revisa comentarios del PR si los hay).
- Si no encuentras nada relacionado ni por contexto ni por código, dilo explícitamente ("no se encontró intento previo de bdpa-13/brageanth") y continúa con el proceso normal.

## 1. Entender el síntoma
- Si falta info clave (steps para reproducir, mensaje de error exacto, en qué ambiente, desde cuándo pasa), pregunta antes de seguir. No asumas.

## 2. Reproducir el camino del código
- Busca el punto de entrada relacionado al síntoma (endpoint, componente, función, evento)
- Traza el flujo completo: qué llama a qué, qué datos entran, qué transformaciones sufren, dónde podría romperse
- Revisa también: manejo de errores/excepciones alrededor de esa zona, validaciones (o falta de ellas), tipos de datos, casos borde (null, vacío, concurrencia, race conditions)

## 3. Busca causas, no solo el síntoma
- Lista TODAS las causas posibles que veas en el código, no solo la más obvia
- Para cada una, di si la puedes CONFIRMAR viendo el código, o si es HIPÓTESIS que requiere más info/logs/reproducir para confirmar
- Piensa si esto es un síntoma de un problema más amplio (ej: falta un patrón de validación en varios lugares, no solo aquí)

## 4. Revisa el historial si ayuda
- Si el archivo/función tiene relación con cambios recientes, usa `git log -p --follow <archivo>` o `git blame` en las líneas sospechosas para ver si un cambio reciente lo introdujo

## 5. Presenta el diagnóstico así:

**Causa raíz (confirmada / hipótesis):**
Explicación clara de qué está pasando y por qué, no solo qué línea falla.

**Por qué pasó / por qué no se detectó antes:**
(ej: falta de validación, edge case no contemplado, dependencia externa, condición de carrera, etc.)

**Propuesta de fix:**
Para cada archivo a tocar:
- Ruta del archivo
- Línea(s) aproximadas
- Qué cambiar y por qué (explica el razonamiento, no solo el código)
- El fragmento de código propuesto (antes/después), en formato para copiar

**Cómo esto mitiga que se repita:**
Explica específicamente por qué esta solución cierra la causa raíz y no solo tapa el síntoma. Si hay que agregar validación/test/guard en otros lugares similares, menciónalo.

**Riesgos o efectos secundarios del cambio:**
Qué otra parte del sistema podría verse afectada.

**Cosas que me generan duda o que deberías confirmar:**
Sé honesto si algo no estás 100% seguro, o si hay más de un enfoque válido y quieres que el usuario decida.

## Reglas
- NO edites archivos. NO ejecutes comandos que modifiquen el código. Solo lectura e investigación (grep, git log, leer archivos, tests si existen para reproducir).
- NO propongas solo un parche superficial (ej: un try/catch que oculte el error) si la causa raíz es más profunda — sé explícito si el fix "fácil" no resuelve el problema real, y ofrece ambos si aplica.
- Preferir cambios pequeños y quirúrgicos sobre refactors grandes, a menos que el problema realmente lo amerite (y en ese caso, dilo explícitamente y explica por qué).
