---
description: Genera título y descripción de PR para la rama actual
argument-hint: [rama-base]
---

Vas a preparar un Pull Request:

1. Rama actual: ejecuta `git branch --show-current`
2. Rama base: usa "$1" si se pasó, si no usa `main` (verifica si existe `main` o `master` con `git branch -r`)
3. Ejecuta `git log <base>..HEAD --oneline` y `git diff <base>...HEAD` para entender los cambios
4. Genera:
   - **Título**: conventional commits style (feat/fix/chore/refactor: descripción corta, imperativo, <72 caracteres)
   - **Descripción**: en formato markdown con secciones:
     - ## Qué cambia
     - ## Por qué
     - ## Cómo probarlo
     - ## Notas (si aplica: breaking changes, deuda técnica, etc.)
5. Si existe .github/PULL_REQUEST_TEMPLATE.md, respeta esa estructura en vez de la de arriba.
6. Muestra el título y la descripción en el chat.
7. Pregunta al usuario: "¿Qué quieres hacer? (a) cambiar algo, (b) dejarlo así, (c) dejarlo así y crear el PR"
   - Si elige (a): pide qué cambiar, ajusta y vuelve a mostrar el resultado, repite este paso
   - Si elige (b): termina ahí, no hagas nada más
   - Si elige (c): crea el PR con `gh pr create --base <base> --title "<título>" --body "<descripción>"`

No inventes cambios que no estén en el diff. Si el diff es muy grande, resume por área/módulo en vez de listar archivo por archivo.
