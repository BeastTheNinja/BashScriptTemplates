#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Starting React project setup..."

bash "$SCRIPT_DIR/scripts/01-create-project.sh"
bash "$SCRIPT_DIR/scripts/02-install-dependencies.sh"
bash "$SCRIPT_DIR/scripts/03-create-structure.sh"
bash "$SCRIPT_DIR/scripts/04-cleanup-vite.sh"
bash "$SCRIPT_DIR/scripts/05-create-router.sh"
bash "$SCRIPT_DIR/scripts/06-create-layout.sh"
bash "$SCRIPT_DIR/scripts/07-create-navigation.sh"
bash "$SCRIPT_DIR/scripts/08-create-ui-components.sh"
bash "$SCRIPT_DIR/scripts/09-create-pages.sh"
bash "$SCRIPT_DIR/scripts/10-create-auth.sh"
bash "$SCRIPT_DIR/scripts/11-create-api.sh"
bash "$SCRIPT_DIR/scripts/12-create-hooks.sh"
bash "$SCRIPT_DIR/scripts/13-create-error-handling.sh"
bash "$SCRIPT_DIR/scripts/14-create-users.sh"
bash "$SCRIPT_DIR/scripts/15-create-search.sh"
bash "$SCRIPT_DIR/scripts/16-create-pagination.sh"
bash "$SCRIPT_DIR/scripts/17-create-sorting.sh"
bash "$SCRIPT_DIR/scripts/18-create-gitignore.sh"

echo ""
echo "================================"
echo "✅ React starter is ready!"
echo "================================"