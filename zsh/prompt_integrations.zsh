# Spaceship Prompt Configuration

# Configure Spaceship prompt
SPACESHIP_PROMPT_ORDER=(
  time           # Time stamps section
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
  package        # Package version
  ruby           # Ruby section
  elixir         # Elixir section
  node           # Node.js section
  bun            # Bun section
  aws            # Amazon Web Services section
  terraform      # Terraform workspace section
  docker         # Docker section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  char           # Prompt character
)

# Spaceship char
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIXES_SHOW=true
SPACESHIP_PROMPT_DEFAULT_PREFIX="via "
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "

# Directory
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=true

# Git
SPACESHIP_GIT_SYMBOL=" "
SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_GIT_STATUS_PREFIX=" ["
SPACESHIP_GIT_STATUS_SUFFIX="]"
SPACESHIP_GIT_STATUS_UNTRACKED="?"
SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_RENAMED="»"
SPACESHIP_GIT_STATUS_DELETED="✘"
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="="
SPACESHIP_GIT_STATUS_AHEAD="⇡"
SPACESHIP_GIT_STATUS_BEHIND="⇣"
SPACESHIP_GIT_STATUS_DIVERGED="⇕"

# mise integration
SPACESHIP_MISE_SHOW=true
SPACESHIP_MISE_PREFIX="via "
SPACESHIP_MISE_SUFFIX=" "
SPACESHIP_MISE_SYMBOL="🔧 "
SPACESHIP_MISE_COLOR="208"

# AWS
SPACESHIP_AWS_SHOW=true
SPACESHIP_AWS_PREFIX="using "
SPACESHIP_AWS_SUFFIX=" "
SPACESHIP_AWS_SYMBOL="☁️ "
SPACESHIP_AWS_COLOR="208"

# Ruby
SPACESHIP_RUBY_SHOW=true
SPACESHIP_RUBY_PREFIX="using "
SPACESHIP_RUBY_SUFFIX=" "
SPACESHIP_RUBY_SYMBOL="💎 "
SPACESHIP_RUBY_COLOR="red"

# Elixir
SPACESHIP_ELIXIR_SHOW=true
SPACESHIP_ELIXIR_PREFIX="using "
SPACESHIP_ELIXIR_SUFFIX=" "
SPACESHIP_ELIXIR_SYMBOL="💧 "
SPACESHIP_ELIXIR_COLOR="magenta"

# Node.js
SPACESHIP_NODE_SHOW=true
SPACESHIP_NODE_PREFIX="using "
SPACESHIP_NODE_SUFFIX=" "
SPACESHIP_NODE_SYMBOL="⬢ "
SPACESHIP_NODE_COLOR="green"

# Bun
SPACESHIP_BUN_SHOW=true
SPACESHIP_BUN_PREFIX="using "
SPACESHIP_BUN_SUFFIX=" "
SPACESHIP_BUN_SYMBOL="🥟 "
SPACESHIP_BUN_COLOR="yellow"

# Execution time
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_PREFIX="took "
SPACESHIP_EXEC_TIME_SUFFIX=" "
SPACESHIP_EXEC_TIME_COLOR="yellow"
SPACESHIP_EXEC_TIME_ELAPSED=2

# Ghostty terminal integration
if [[ "$TERM_PROGRAM" == "Ghostty" ]]; then
  # Set terminal window title
  spaceship_title() {
    # Set window title to current directory
    echo -ne "\033]0;${PWD/#$HOME/~}\007"
  }
  
  # Add title section to spaceship prompt
  SPACESHIP_PROMPT_ORDER=(
    ${SPACESHIP_PROMPT_ORDER[@]/dir/}
    title
    dir
    ${SPACESHIP_PROMPT_ORDER[@]:$((${SPACESHIP_PROMPT_ORDER[(i)dir]}+1))}
  )
  
  # Register the title section
  spaceship::register title spaceship_title
fi 