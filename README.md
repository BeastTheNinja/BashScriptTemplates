# Bash Script Templates

This repository contains small Bash scripts that automate project setup tasks.

## What this repository does

The main script, `SetupViteReact.sh`, bootstraps a new React project with Vite and a starter structure. It:

- creates a new Vite app using the `react-compiler-ts` template
- installs `react-router` and `sass`
- creates a basic folder structure inside `src/`
- removes the default Vite starter `App.css` and `App.tsx`
- adds a simple `App` component, router setup, and main layout

## How to use it

Run the script inside the folder where you want the new project to be created.

```bash
bash SetupViteReact.sh
```

## Requirements

- Node.js and npm installed
- Bash available through Git Bash, WSL, or another Bash-compatible shell

## Recommended workflow

1. Create or open an empty folder for your new project.
2. Place or run `SetupViteReact.sh` from that folder.
3. Execute the script.
4. Start working on your app inside the generated `src/` structure.

## Project structure created by the script

The script creates these folders inside `src/`:

- `assets`
- `components`
- `hooks`
- `layouts`
- `pages`
- `services`
- `types`
- `utils`
- `router`

## Notes

The script is designed to be run in a fresh project folder. If you run it inside an existing project, it may overwrite the default Vite starter files in `src/`.
