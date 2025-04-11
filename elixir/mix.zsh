# Mix and Elixir Aliases

# Basic Elixir shortcuts
alias i="iex"
alias ips="iex -S mix phx.server"
alias im="iex -S mix"
alias ism="iex -S mix"

# Mix shortcuts
alias m="mix"
alias mps="mix phx.server"
alias mpn="mix phx.new"
alias mdg="mix deps.get"
alias mdu="mix deps.update --all"
alias mdc="mix deps.clean --all"
alias mcr="mix do clean, deps.clean --all, deps.get"
alias mct="mix compile --force --warnings-as-errors"

# Phoenix specific
alias mpr="mix phx.routes"
alias mpg="mix phx.gen"
alias mpgc="mix phx.gen.context"
alias mpgs="mix phx.gen.schema"
alias mpgl="mix phx.gen.live"
alias mpgh="mix phx.gen.html"
alias mpgj="mix phx.gen.json"

# Ecto shortcuts
alias mec="mix ecto"
alias mecr="mix ecto.reset"
alias mecc="mix ecto.create"
alias mecd="mix ecto.drop"
alias mecm="mix ecto.migrate"
alias mecg="mix ecto.gen.migration"
alias mecrup="mix ecto.rollback && mix ecto.migrate"

# LiveBook shortcuts
alias lb="mix livebook.server"
alias lbs="mix livebook.server --open"

# Test shortcuts
alias mt="mix test"
alias mtw="mix test.watch"
alias mtc="mix test --cover"
alias mts="mix test --stale"
alias mth="mix test --help"

# Hex package management
alias mh="mix hex"
alias mhi="mix hex.info"
alias mhs="mix hex.search"
alias mhd="mix hex.docs"
alias mho="mix hex.outdated"

# Helper functions
function mixnew() {
  if [ -z "$1" ]; then
    echo "Usage: mixnew <project_name> [--sup] [--app <app_name>]"
    return 1
  fi
  mix new "$@"
  cd "$(basename "$1")"
  git init
  mix deps.get
}

function phnew() {
  if [ -z "$1" ]; then
    echo "Usage: phnew <project_name> [--live] [--database mysql|postgres]"
    return 1
  fi
  mix phx.new "$@"
  cd "$(basename "$1")"
  git init
  mix deps.get
  npm --prefix assets install
}

# Format Elixir code in current directory
function exfmt() {
  mix format "$@"
} 