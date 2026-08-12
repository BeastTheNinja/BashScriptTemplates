#!/bin/bash

set -e

echo "🚀 Starting React project setup..."

bash ../scripts/01-create-project.sh
bash ../scripts/02-install-dependencies.sh
bash ../scripts/03-create-structure.sh
bash ../scripts/04-cleanup-vite.sh
bash ../scripts/05-create-router.sh
bash ../scripts/06-create-layout.sh
bash ../scripts/07-create-navigation.sh
bash ../scripts/08-create-ui-components.sh
bash ../scripts/09-create-pages.sh
bash ../scripts/10-create-auth.sh
bash ../scripts/11-create-api.sh
bash ../scripts/12-create-hooks.sh
bash ../scripts/13-create-error-handling.sh
bash ../scripts/14-create-users.sh
bash ../scripts/15-create-search.sh
bash ../scripts/16-create-pagination.sh
bash ../scripts/17-create-sorting.sh
bash ../scripts/18-create-gitignore.sh

echo ""
echo "================================"
echo "✅ React starter is ready!"
echo "================================"