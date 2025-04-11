# 1Password CLI Configuration

# Enable shell completion
if [ -f /opt/homebrew/share/zsh/site-functions/_op ]; then
  source /opt/homebrew/share/zsh/site-functions/_op
fi

# Enable SSH Agent integration
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Shell functions for 1Password
function oplogin() {
  eval $(op signin)
}

# Get item from 1Password and copy to clipboard
function opget() {
  op item get "$1" --fields password --copy
}

# Get environment variables from 1Password and export them
function openv() {
  if [ -z "$1" ]; then
    echo "Usage: openv <item-name>"
    return 1
  fi
  
  eval $(op item get "$1" --format=json | jq -r '.fields[] | select(.purpose=="CONCEALED") | "export " + .label + "=\"" + .value + "\""')
}

# Aliases
alias opl="oplogin"
alias opg="opget"
alias ope="openv"
alias opls="op item list" 