#!/bin/bash

echo "▶ Dotfiles install script running..."

# Add Gitpod hostname to vite.config.js (if it exists)
if [ -f vite.config.js ]; then
  echo "✔ Found vite.config.js"
  GITPOD_HOST=$(echo "$GITPOD_WORKSPACE_URL" | sed 's|https://||' | sed 's|/||g')

  if ! grep -q "$GITPOD_HOST" vite.config.js; then
    sed -i "/server: {/a \ \ \ \ host: true,\n\ \ \ \ hmr: { host: '$GITPOD_HOST' }," vite.config.js
    echo "✅ vite.config.js updated for Gitpod HMR"
  else
    echo "ℹ️ vite.config.js already configured"
  fi
else
  echo "⚠️ vite.config.js not found"
fi
