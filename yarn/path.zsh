# DEPRECATED: Yarn is being replaced by Bun where possible
# Check bun/ directory for Bun configuration
# This is kept for projects that still require Yarn

# Add yarn to path
export PATH="$HOME/.yarn/bin:$PATH"

# sup yarn
# https://yarnpkg.com

if (( $+commands[yarn] ))
then
  export PATH="$PATH:`yarn global bin`"
fi
