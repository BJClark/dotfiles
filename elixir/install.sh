#!/bin/sh
#
# Elixir
#
# This sets up Elixir configuration and Oh-My-Zsh plugin.

# Get the directory where this script is located (works with both bash and sh)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]:-$0}" )" && pwd )"

# Ensure Oh-My-Zsh plugins directory exists
mkdir -p "$HOME/.oh-my-zsh/custom/plugins/elixir"

# Copy Elixir plugin if it doesn't exist or if it's different
if [ ! -f "$HOME/.oh-my-zsh/custom/plugins/elixir/elixir.plugin.zsh" ] || \
   ! cmp -s "$SCRIPT_DIR/elixir.plugin.zsh" "$HOME/.oh-my-zsh/custom/plugins/elixir/elixir.plugin.zsh"; then
  echo "  Setting up Elixir Oh-My-Zsh plugin"
  cp "$SCRIPT_DIR/elixir.plugin.zsh" "$HOME/.oh-my-zsh/custom/plugins/elixir/elixir.plugin.zsh"
fi

exit 0 