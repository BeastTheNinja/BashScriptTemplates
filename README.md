# Bash Script Templates

This repository contains Bash scripts that automate React project setup tasks.

## What this repository does

The main entry script, `setup-react.sh`, runs the setup steps in `scripts/` and bootstraps a new React project with Vite. It:

- creates a new Vite app using the `react-compiler-ts` template
- installs the dependencies needed for the starter
- creates the project structure inside `src/`
- adds routing, layout, navigation, UI components, pages, auth, API, hooks, error handling, users, search, pagination, and sorting files
- creates or updates the `.gitignore` used by the starter project

## How to use it

Run the script from the target project folder you want to set up.

```bash
bash ../setup-react.sh
```

If you want to test the script the same way this repository does, use the `TestProjects` folder as the target folder.

## Requirements

- Node.js and npm installed
- Bash available through Git Bash, WSL, or another Bash-compatible shell

## Recommended workflow

1. Create or open an empty target folder for your new project.
2. Run `setup-react.sh` from that folder.
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

## Script breakdown

The setup is split into small Bash scripts inside `scripts/` so each step stays focused:

- `01-create-project.sh` creates the Vite project
- `02-install-dependencies.sh` installs required packages
- `03-create-structure.sh` builds the folder structure
- `04-cleanup-vite.sh` removes default starter files and replaces them with your own setup
- `05-create-router.sh` sets up routing
- `06-create-layout.sh` creates the main layout
- `07-create-navigation.sh` adds navigation
- `08-create-ui-components.sh` creates shared UI components
- `09-create-pages.sh` creates page files
- `10-create-auth.sh` adds authentication-related files
- `11-create-api.sh` adds API-related files
- `12-create-hooks.sh` adds custom hooks
- `13-create-error-handling.sh` adds error handling files
- `14-create-users.sh` adds user-related files
- `15-create-search.sh` adds search files
- `16-create-pagination.sh` adds pagination files
- `17-create-sorting.sh` adds sorting files
- `18-create-gitignore.sh` creates the final `.gitignore`

## TestProjects

The `TestProjects` folder is a generated example project used to verify that the setup script works as expected.
It is not the template source itself, but the result of running the script in a test folder.

## Notes

The script is designed to be run in a fresh project folder. If you run it inside an existing project, it may overwrite files in the target folder.
