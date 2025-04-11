# mise configuration

# Aliases
alias mx="mise exec --"
alias mi="mise install"
alias mu="mise use"
alias mls="mise list"
alias mup="mise upgrade"

# Auto-install missing tools as needed
export MISE_AUTO_INSTALL=true

# For tools that don't support mise directly
export MISE_RUBY_DEFAULT_PACKAGES_FILE="$HOME/.default-gems"
export MISE_NODEJS_DEFAULT_PACKAGES_FILE="$HOME/.default-npm-packages"
export MISE_PYTHON_DEFAULT_PACKAGES_FILE="$HOME/.default-python-packages"

# Use current directory's .mise.toml if exists
export MISE_USE_CURRENT_DIR=true 