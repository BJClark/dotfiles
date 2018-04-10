export PATH="/usr/local/opt/openssl/bin:$PATH"

# init according to man page
if (( $+commands[rbenv] ))
then
  eval "$(rbenv init -)"
fi
