# Oh My Zsh Configuration

# Path to your oh-my-zsh installation
export ZSH="$DOTS/zsh/oh-my-zsh"

# Path to your custom directory
export ZSH_CUSTOM="$DOTS/zsh/custom"

# Set theme
ZSH_THEME="spaceship"

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
if [ -f "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh" ]; then
  # Set Spaceship as the prompt theme
  SPACESHIP_PROMPT_ORDER=(
    time          # Time stamps section
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    elixir        # Elixir section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    kubecontext   # Kubectl context section
    terraform     # Terraform workspace section
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )
  SPACESHIP_PROMPT_ADD_NEWLINE=true
  SPACESHIP_PROMPT_SEPARATE_LINE=true
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_PREFIXES_SHOW=true
  SPACESHIP_PROMPT_SUFFIXES_SHOW=true
  SPACESHIP_PROMPT_DEFAULT_PREFIX="via "
  SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "
fi
