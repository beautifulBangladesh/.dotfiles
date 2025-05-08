#!/bin/bash

echo "Dotfiles init.sh running..."

# Extract Gitpod Workspace URL, without https:// and /
GITPOD_HOST=$(echo $GITPOD_WORKSPACE_URL | sed 's|https://||' | sed 's|/.*||')

CONFIG_PATH="vite.config.js"

if [ -f "$CONFIG_PATH" ]; then
  echo "🔧 Injecting Gitpod host: $GITPOD_HOST into vite.config.js..."

  # Check if the host is already in vite.config.js
  if ! grep -q "$GITPOD_HOST" "$CONFIG_PATH"; then
    # Inject the allowedHosts property
    sed -i "/server: {/a \ \ \ \ allowedHosts: ['$GITPOD_HOST']," "$CONFIG_PATH"
    echo "✅ Injection done!"
  else
    echo "ℹ️ Host already exists in vite.config.js"
  fi
else
  echo "❌ vite.config.js not found"
fi
