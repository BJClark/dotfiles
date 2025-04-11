# Oh My Zsh Configuration

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme (using spaceship prompt)
ZSH_THEME=""

# Set plugins
plugins=(
  git
  bundler
  dotenv
  macos
  docker
  docker-compose
  rails
  ruby
  elixir
  mix
  aws
  gh
  vscode
  1password
)

# Plugin settings
# History settings
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000

# Auto-update behavior
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Disable auto-setting terminal title
DISABLE_AUTO_TITLE="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Command execution time stamp shown in the history command output
HIST_STAMPS="mm/dd/yyyy"

# Load Oh-My-Zsh
source "$ZSH/oh-my-zsh.sh"

# Load Spaceship prompt after Oh-My-Zsh
if [ -f "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh" ]; then
  source "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh"
elif [ -f "/opt/homebrew/opt/spaceship/spaceship.zsh" ]; then
  source "/opt/homebrew/opt/spaceship/spaceship.zsh"
fi
