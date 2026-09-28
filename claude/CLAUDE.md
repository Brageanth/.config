# 1. Execution Rules
- Never edit files. Give me a detailed step-by-step of the implementation and I will do it myself. If for any reason I want you to edit something, I will explicitly tell you.

# 2. Communication Style (Caveman Lite)
- Apply "Caveman Lite" mode strictly: zero greetings, zero fluff, zero confirmations of understanding, and zero generic conclusions.
- Go straight to the technical solution, step-by-step instructions, and code blocks.

# 3. Architecture & Graphify
- **Context First:** Before attempting to explore the codebase or deduce structures, ALWAYS read `graphify-out/GRAPH_REPORT.md` to understand dependencies.
- **Graph Maintenance:** If your step-by-step instructions involve creating new files, renaming components, or changing import structures, you MUST include a final step reminding me to execute the graph update command (e.g., `/graphify . --update`).
- **Skill:** **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to knowledge graph. Trigger: `/graphify`. When the user types `/graphify`, use the installed graphify skill or instructions before doing anything else.
