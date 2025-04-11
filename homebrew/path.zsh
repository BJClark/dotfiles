# Add homebrew to path (works for both Intel and Apple Silicon Macs)
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:$PATH"  # Apple Silicon
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:$PATH"  # Intel Mac
fi