#!/bin/bash
set -e

UNAME=$(uname -s)

VENV_NAME=".venv"
echo "Current Directory: $(pwd)"
echo "Checking for virtual environment folder..."

if [ -d "$VENV_NAME" ]
  then
    echo "Virtual environment found, activating..."
    source "$VENV_NAME/bin/activate"
    echo "Virtual environment activated: $VENV_NAME"
  else
    echo "Setting up virtual environment..."
    if [ "$UNAME" = "Linux" ]
    then
      echo "Installing uv on Linux"
      pip install uv
    fi
    if [ "$UNAME" = "Darwin" ]
    then
      echo "Installing uv on Darwin"
      brew install uv
    fi

    uv venv --python=3.10
    source .venv/bin/activate
    echo "Virtual environment activated: $VENV_NAME"
    echo "Installing dependencies from requirements.txt..."
    uv pip install -r requirements.txt
    echo "Dependencies installation complete."

  fi

# Be sure to use `exec` so that termination signals reach the python process,
# or handle forwarding termination signals manually
PYTHON_LIB_PATH=$(find .venv/lib -type d -name "python3.*" -print -quit)
CV2_UTILS_PATH="$PYTHON_LIB_PATH/site-packages/cv2"
python3 -m PyInstaller --onefile --hidden-import="googleapiclient" --add-data "$CV2_UTILS_PATH:cv2" src/main.py
tar -czvf dist/archive.tar.gz dist/main
