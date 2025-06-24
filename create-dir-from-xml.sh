#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 path/to/xml_file [path/where/create]"
    echo
    echo "This script creates a directory structure and files based on the provided XML file."
    echo
    echo "To create an XML file representing a directory structure, use the following command:"
    echo "tree -X path/to/folder/ > structure.xml"
    echo
    echo "Replace 'path/to/folder/' with the path of the directory you want to document."
    echo "The output will be saved in 'structure.xml'."
    echo
    echo "Example:"
    echo "tree -X /home/user/my_project/ > structure.xml"
    echo
    echo "Then run this script with the XML file as an argument."
    exit 1
}

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    display_help
fi

# Check if the tree command is installed
if ! command -v tree &> /dev/null; then
    echo "Error: The 'tree' command is not installed. Please install it and try again."
    exit 1
fi

# Set the base directory
BASE_DIR="/tmp/workspace"
XML_FILE="$1"

# Check if a second argument is provided for the output directory
if [ "$#" -eq 2 ]; then
    BASE_DIR="$2"
fi

# Check if the base directory already exists
if [ -d "$BASE_DIR" ]; then
    read -p "The directory '$BASE_DIR' already exists. Do you want to delete it and all its contents? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        rm -rf "$BASE_DIR"
    else
        echo "Exiting without making changes."
        exit 1
    fi
fi

# Create the base directory
mkdir -p "$BASE_DIR"

# Function to create directories and files from XML
create_structure() {
    local xml_file="$1"
    local current_path="$BASE_DIR"

    # Use xmllint to parse the XML file
    while IFS= read -r line; do
        # Check for directory entries
        if [[ $line =~ \<directory\ name=\"(.*)\" ]]; then
            dir_name="${BASH_REMATCH[1]}"
            current_path="$current_path/$dir_name"
            mkdir -p "$current_path"
        fi

        # Check for file entries
        if [[ $line =~ \<file\ name=\"(.*)\"\>\<\/file\> ]]; then
            file_name="${BASH_REMATCH[1]}"
            touch "$current_path/$file_name"
        fi

        # Check for closing directory tag
        if [[ $line =~ \<\/directory\> ]]; then
            current_path=$(dirname "$current_path")
        fi
    done < "$xml_file"
}

# Call the function with the XML file
create_structure "$XML_FILE"

# Print the generated directory structure
echo "Generated directory structure:"
tree "$BASE_DIR"

echo "Directory structure created in $BASE_DIR"

