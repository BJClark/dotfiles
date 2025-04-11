#!/bin/sh
#
# mise
#
# This installs mise, a unified version manager for various languages and tools.

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]:-$0}" )" && pwd )"
DOTFILES_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# Check for mise
if test ! $(which mise)
then
  echo "  Installing mise via Homebrew."
  brew install mise
fi

# Set up ~/.config directory if it doesn't exist as a directory
if [ ! -d "$HOME/.config" ]; then
  if [ -e "$HOME/.config" ]; then
    echo "  ~/.config exists but is not a directory, backing it up."
    mv "$HOME/.config" "$HOME/.config.bak"
  fi
  mkdir -p "$HOME/.config"
fi

# Ensure yarn config directory exists
mkdir -p "$HOME/.config/yarn"

# Create .mise.toml if it doesn't exist
if [ ! -f "$HOME/.mise.toml" ]; then
  echo "  Creating ~/.mise.toml"
  ln -s "$DOTFILES_ROOT/.mise.toml" "$HOME/.mise.toml"
fi

exit 0 