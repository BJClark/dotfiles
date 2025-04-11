# Bun Configuration

# Add Bun to PATH
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bun completion
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Use Bun as the primary JavaScript runtime
export NODE_PREFER_BUN=true

# Bun aliases
alias b="bun"
alias br="bun run"
alias bi="bun install"
alias ba="bun add"
alias bad="bun add -d"
alias brm="bun remove"
alias bu="bun update"
alias bx="bunx"
alias bp="bun --bun pm"

# Use Bun for NPM commands when possible
alias npm="bun pm"
alias npx="bunx"

# Development shortcuts
alias bdev="bun run dev"
alias bbuild="bun run build"
alias btest="bun test"
alias blint="bun run lint"

# Prefer Bun for TypeScript
alias tsx="bunx --bun tsx"
alias tsc="bunx --bun tsc"

# Node/Bun switching when needed
bunmode() {
  export NODE_PREFER_BUN=true
  echo "Bun mode activated"
}

nodemode() {
  export NODE_PREFER_BUN=false
  echo "Node.js mode activated"
}

# Initialize to Bun by default
bunmode 