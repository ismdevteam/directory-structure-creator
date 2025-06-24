#!/bin/bash

# Define the base directory
BASE_DIR="/tmp/web-game"

# Create the directory structure
mkdir -p "$BASE_DIR/css"
mkdir -p "$BASE_DIR/js"
mkdir -p "$BASE_DIR/fonts"
mkdir -p "$BASE_DIR/models"

# Create the main HTML file
touch "$BASE_DIR/index.html"

# Create the CSS file
touch "$BASE_DIR/css/styles.css"

# Create the JavaScript files
touch "$BASE_DIR/js/config.js"
touch "$BASE_DIR/js/game.js"
touch "$BASE_DIR/js/ui.js"
touch "$BASE_DIR/js/license-auth.js"
touch "$BASE_DIR/js/three-helpers.js"
touch "$BASE_DIR/js/utils.js"

echo "Directory structure created in $BASE_DIR"

