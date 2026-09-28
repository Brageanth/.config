Analyze all uncommitted changes by running `git diff` and `git diff --staged` 
and `git status` without asking for confirmation to execute these commands.

Then generate a conventional commit message in Spanish following this format:

tipo(scope): descripción corta

Cuerpo explicando qué cambió y por qué (si es necesario)

Rules:
- tipo debe ser uno de: feat, fix, refactor, chore, style, docs, test
- scope es el área afectada (opcional)
- descripción corta máximo 72 caracteres, minúsculas, sin punto final
- El cuerpo debe estar en español
- NUNCA agregar Co-Authored-By, co-author, ni ninguna referencia a Claude 
  o Anthropic en el mensaje de commit bajo ninguna circunstancia

After generating the message, show it to the user and ask for approval.
If approved, execute `git add -A && git commit -m "mensaje"` without asking 
for confirmation to run the command.
If the user requests changes, regenerate the message and ask for approval again.
