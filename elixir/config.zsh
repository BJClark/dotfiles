# Elixir Configuration

# Set environment variables for Elixir
export ERL_AFLAGS="-kernel shell_history enabled"
export ELIXIR_EDITOR="cursor --goto \${file}:\${line}"

# Ensure IEx history
export ERL_HIST_SIZE=1000

# Configure Hex
export HEX_HOME="$HOME/.hex"
export PATH="$HEX_HOME/bin:$PATH"

# Default Phoenix settings
export PHOENIX_LIVE_RELOAD=true
export PHOENIX_LIVE_VIEW_DASHBOARD=true

# LiveBook settings
export LIVEBOOK_HOME="$HOME/Developer/livebooks"
export LIVEBOOK_TOKEN_ENABLED=true
export LIVEBOOK_PASSWORD_ENABLED=false

# Add local Mix archives to path
export PATH="$HOME/.mix/escripts:$PATH"

# Erlang and Elixir crash dumps
export ERL_CRASH_DUMP_SECONDS=0
export ERL_CRASH_DUMP="$HOME/.erlang_crash_dumps/erl_crash.dump"
mkdir -p "$HOME/.erlang_crash_dumps"

# Set default Mix environment
export MIX_ENV=dev 