#!/bin/sh
#
# Ghostty
#
# This ensures Ghostty terminal configuration is properly set up.

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]:-$0}" )" && pwd )"

# Ensure the Ghostty config directory exists
mkdir -p "$HOME/.config/ghostty"

# Link Ghostty configuration if it doesn't exist
if [ ! -f "$HOME/.config/ghostty/config" ]; then
  echo "  Setting up Ghostty configuration"
  # Create symbolic link to our ghostty config
  ln -sf "$SCRIPT_DIR/config.symlink" "$HOME/.config/ghostty/config"
fi

exit 0 