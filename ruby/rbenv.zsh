# DEPRECATED: Ruby version management is now handled by mise
# See ~/.mise.toml for Ruby configuration

# The rbenv commands below are retained for reference only
# eval "$(rbenv init - --no-rehash)"
# (rbenv rehash &) 2> /dev/null

export PATH="/usr/local/opt/openssl/bin:$PATH"

# init according to man page
if (( $+commands[rbenv] ))
then
  eval "$(rbenv init -)"
fi
