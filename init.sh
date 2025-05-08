#!/bin/bash

echo "Dotfiles init.sh running..."


GITPOD_HOST=$(echo $GITPOD_WORKSPACE_URL | sed 's|https://||' | sed 's|/||g')


CONFIG_PATH="vite.config.js"


if [ -f "$CONFIG_PATH" ]; then
  echo "🔧 Injecting Gitpod host: $GITPOD_HOST into vite.config.js..."

  if ! grep -q "$GITPOD_HOST" "$CONFIG_PATH"; then
    sed -i "/server: {/a \ \ \ \ allowedHosts: ['$GITPOD_HOST']," "$CONFIG_PATH"
    echo "✅ Injection done!"
  else
    echo "ℹ️ Host already exists in vite.config.js"
  fi
else
  echo "❌ vite.config.js not found"
fi
