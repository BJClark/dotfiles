# Add mise to path and enable shims
export PATH="$PATH:$HOME/.local/bin"

# Set up mise shell hooks
eval "$(mise activate zsh)"

# Configure mise to use default versions from .mise.toml
export MISE_USE_TOML=1 