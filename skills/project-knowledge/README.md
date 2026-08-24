# project-knowledge

Keeps a `.project-knowledge/` folder at your project root — one focused file per concern, a master index for navigation. Replaces a single `PROJECT_KNOWLEDGE.md` that grows into an unmanageable wall of text.

## Why a folder instead of one file

A single file works until it doesn't. Real projects hit 700+ lines fast — schema, routes, hooks, components, features, session history all in one place. An AI loading the whole thing on every task wastes tokens and context. With a folder, each file is loaded only when relevant. The `INDEX.md` tells the AI exactly which files to open for a given task.

## What's in the folder

```
.project-knowledge/
├── INDEX.md          ← project summary + context-loading guide (what to read for each task)
├── stack.md          ← tech stack, dev commands, env vars
├── structure.md      ← file tree, entry points, key files
├── schema.md         ← DB / localStorage / storage schema
├── routes.md         ← server actions, API routes
├── hooks.md          ← custom hooks, composables, service functions
├── components.md     ← component inventory grouped by folder
├── systems.md        ← auth, email, payments, queues, AI, realtime
├── features.md       ← user-facing features and multi-step workflows
├── integrations.md   ← external systems and data contracts
├── roadmap.md        ← known bugs, active TODOs, planned features, current goal
├── history.md        ← removed items, past fixes, decisions (append-only)
└── sessions.md       ← session-by-session log (append-only)
```

Only files with real content are created. `INDEX.md` lists only what exists.

## Four modes

**Old `PROJECT_KNOWLEDGE.md` found, no folder yet → MIGRATE**
Reads the old single file, maps each section to its new home (`## Hooks & Services` → `hooks.md`, `## Known Issues` → `roadmap.md`, etc.), creates the folder, skips empty sections. Asks you to confirm before deleting the old file.

**No folder, no old file → CREATE**
Auto-scans your codebase (file tree, stack, routes, hooks, components, env vars, systems), asks only what scanning can't answer (purpose, what's working, known bugs, current goal), then generates all relevant files.

**Fresh session, folder exists → ORIENT**
Reads `INDEX.md`, uses the context-loading guide to pick which files are relevant to your current task, loads only those, gives a <150-word briefing. Asks what you're working on if you haven't said.

**Mid-session, folder exists → UPDATE**
Detects what changed (from conversation context + git diff + recently modified files), maps changes to the right files, updates only those, appends one entry to `sessions.md`. Never touches files that weren't affected.

## roadmap.md vs history.md

These are kept separate on purpose:

- **roadmap.md** — forward-looking: known bugs, active TODOs, planned features, current goal. Load this before starting any task to know what's in flight.
- **history.md** — past-only: removed items, fixed bugs, architectural decisions. Append-only.

When a bug gets fixed: remove it from `roadmap.md`, add it to `history.md`.

## Usage

```
project knowledge         → auto-detects the right mode
start a new session       → ORIENT mode
update project docs       → UPDATE mode
log what we did           → UPDATE mode
sync project knowledge    → UPDATE mode
what have we done so far  → UPDATE mode
we're done                → offer to UPDATE before closing
```

## Attribution

Every `.project-knowledge/INDEX.md` the skill creates includes a footer crediting the skill and linking back to this repo.

If the `.project-knowledge/` folder is **not** in `.gitignore` (i.e. it's being pushed with the project), the skill also appends a collapsible `🧠 AI Context` section to the project's `README.md` so others can discover the skill through the repo.

## Install

```bash
claude skill install project-knowledge.skill
```

## Source

Made by [Yahya Zekry](https://github.com/YahyaZekry/claude-code-skills) · See [SKILL.md](SKILL.md) for the full skill definition.
