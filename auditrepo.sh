#!/bin/bash

# Ask for the GitHub repository URL if it's not provided
if [ -z "$1" ]; then
  echo "Enter the GitHub repository URL:"
  read repo_url
else
  repo_url=$1
fi

# Determine the GitHub profile/organization from the URL
profile=$(echo "$repo_url" | awk -F[/:] '{print $(NF-1)}')

# Set the base directory where you want to clone the repos
BASE_DIR=~/projects

# Determine the target directory based on the profile
case "$profile" in
  Cyfrin)
    TARGET_DIR="$BASE_DIR/codehawks"
    ;;
  code-423n4)
    TARGET_DIR="$BASE_DIR/codearena"
    ;;
  sherlock-audit)
    TARGET_DIR="$BASE_DIR/sherlock"
    ;;
  *)
    # Default directory if the profile doesn't match
    TARGET_DIR="$BASE_DIR/others"
    ;;
esac

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Change to the target directory
cd "$TARGET_DIR" || { echo "Directory not found!"; exit 1; }

# Clone the GitHub repo
git clone "$repo_url"

# Extract repo name from URL
REPO_NAME=$(basename "$repo_url" .git)

# Open the cloned repo in Cursor
/mnt/c/Users/<Your-Username>/AppData/Local/Programs/Cursor/Cursor.exe "$TARGET_DIR/$REPO_NAME"

echo "Repository cloned into $TARGET_DIR and opened in Cursor."
