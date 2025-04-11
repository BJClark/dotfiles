# Cursor Editor Configuration

# Set Cursor as the default editor
export EDITOR="cursor"
export VISUAL="cursor"

# Cursor CLI aliases
alias c="cursor"
alias ce="cursor ."
alias cg="cursor --goto"

# Open file at line and column
# Usage: copen file.txt:10:5
function copen() {
  if [[ "$1" =~ ^([^:]+):([0-9]+)(:([0-9]+))?$ ]]; then
    local file="${BASH_REMATCH[1]}"
    local line="${BASH_REMATCH[2]}"
    local column="${BASH_REMATCH[4]:-1}"
    cursor --goto "$file:$line:$column"
  else
    cursor "$1"
  fi
}

# Open current git repository
function crepo() {
  local git_root=$(git rev-parse --show-toplevel 2>/dev/null)
  if [[ -n "$git_root" ]]; then
    cursor "$git_root"
  else
    echo "Not in a git repository"
    return 1
  fi
}

# Quick edit common config files
alias cdot="cursor ~/Developer/dotfiles"
alias czsh="cursor ~/Developer/dotfiles/zsh/zshrc.symlink"
alias cmise="cursor ~/.mise.toml" 