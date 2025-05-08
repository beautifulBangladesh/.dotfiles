#!/bin/bash

GITPOD_YML=".gitpod.yml"

if [ ! -f "$GITPOD_YML" ]; then
  echo "Creating .gitpod.yml file..."

  cat > $GITPOD_YML <<EOL
# Gitpod Configuration File

image:
  file: .gitpod.Dockerfile

tasks:
  - init: |
      chmod +x .dotfiles/init.sh
      ./.dotfiles/init.sh
  - command: |
      npm install
      npm run dev
EOL

  echo ".gitpod.yml file created successfully!"
else
  echo ".gitpod.yml file already exists."
fi
