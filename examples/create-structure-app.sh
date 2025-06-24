#!/bin/bash

# Define the base directory
BASE_DIR="/tmp/web-app"

# Create the directory structure
mkdir -p "$BASE_DIR/css"
mkdir -p "$BASE_DIR/js/vendor"
mkdir -p "$BASE_DIR/assets/fonts"
mkdir -p "$BASE_DIR/assets/img"
mkdir -p "$BASE_DIR/assets/icons"
mkdir -p "$BASE_DIR/lib"
mkdir -p "$BASE_DIR/tests/unit"
mkdir -p "$BASE_DIR/tests/integration"

# Create the files
touch "$BASE_DIR/index.html"
touch "$BASE_DIR/css/styles.css"
touch "$BASE_DIR/js/app.js"
touch "$BASE_DIR/js/config.js"
touch "$BASE_DIR/js/ui.js"
touch "$BASE_DIR/js/auth.js"
touch "$BASE_DIR/js/helpers.js"
touch "$BASE_DIR/js/vendor/jquery.min.js"
touch "$BASE_DIR/assets/fonts/.gitkeep"
touch "$BASE_DIR/assets/img/.gitkeep"
touch "$BASE_DIR/assets/icons/.gitkeep"
touch "$BASE_DIR/lib/utils.js"
touch "$BASE_DIR/tests/unit/.gitkeep"
touch "$BASE_DIR/tests/integration/.gitkeep"
touch "$BASE_DIR/.gitignore"
touch "$BASE_DIR/package.json"
touch "$BASE_DIR/README.md"

echo "Directory structure created in $BASE_DIR"

