#!/bin/bash
set -e
cd `dirname $0`
VENV_NAME=viam-venv
echo "Current Directory: $(pwd)"
echo "Checking for virtual environment folder..."

if [ -d "viam-env" ]
  then
    echo "Virtual environment found, activating..."
    source viam-env/bin/activate
    echo "Virtual environment activated: $VENV_NAME"
  else
    echo "Setting up virtual environment..."
    python3 -m venv --system-site-packages "$VENV_NAME"
    source "$VENV_NAME/bin/activate"
    echo "Virtual environment activated: $VENV_NAME"
    echo "Installing dependencies from requirements.txt..."

    while IFS= read -r requirement; do
      if [ -n "$requirement" ]; then
        echo "Installing $requirement..."
        pip install "$requirement" || echo "Failed to install $requirement"
      fi
    done < requirements.txt

    echo "Dependencies installation complete."

  fi
# Be sure to use `exec` so that termination signals reach the python process,
# or handle forwarding termination signals manually
echo "Starting Python module..."
exec python3 -m src $@
