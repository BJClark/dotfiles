# MCP Server Management Functions

# Start a local MCP server
function mcp-start() {
  local model_name=${1:-$MCP_DEFAULT_LOCAL_MODEL}
  local port=${2:-$MCP_PORT}
  
  echo "Starting MCP server with model '$model_name' on port $port..."
  
  nohup python -m mcp.server \
    --model $model_name \
    --host $MCP_HOST \
    --port $port \
    --log-level $MCP_LOG_LEVEL \
    --cache-dir $MCP_CACHE_DIR > "$MCP_LOG_FILE" 2>&1 &
  
  echo "MCP server started with PID $! (Log: $MCP_LOG_FILE)"
  
  # Add PID to running servers file
  echo "$! $model_name $port" >> "$MCP_CONFIG_DIR/running_servers.txt"
}

# Stop a running MCP server
function mcp-stop() {
  local pid=$1
  
  if [[ -z "$pid" ]]; then
    echo "Usage: mcp-stop <pid>"
    mcp-list
    return 1
  fi
  
  if kill -0 $pid 2>/dev/null; then
    echo "Stopping MCP server with PID $pid..."
    kill $pid
    sed -i'' -e "/^$pid /d" "$MCP_CONFIG_DIR/running_servers.txt"
    echo "Server stopped."
  else
    echo "No running MCP server with PID $pid."
    sed -i'' -e "/^$pid /d" "$MCP_CONFIG_DIR/running_servers.txt"
  fi
}

# Stop all running MCP servers
function mcp-stop-all() {
  if [[ -f "$MCP_CONFIG_DIR/running_servers.txt" ]]; then
    while read -r pid model port; do
      if kill -0 $pid 2>/dev/null; then
        echo "Stopping MCP server ($model:$port) with PID $pid..."
        kill $pid
      fi
    done < "$MCP_CONFIG_DIR/running_servers.txt"
    rm "$MCP_CONFIG_DIR/running_servers.txt"
    echo "All MCP servers stopped."
  else
    echo "No running MCP servers found."
  fi
}

# List running MCP servers
function mcp-list() {
  echo "Running MCP servers:"
  if [[ -f "$MCP_CONFIG_DIR/running_servers.txt" ]]; then
    echo "PID | Model | Port"
    echo "----------------"
    while read -r pid model port; do
      if kill -0 $pid 2>/dev/null; then
        echo "$pid | $model | $port"
      else
        sed -i'' -e "/^$pid /d" "$MCP_CONFIG_DIR/running_servers.txt"
      fi
    done < "$MCP_CONFIG_DIR/running_servers.txt"
  else
    echo "No running MCP servers found."
  fi
}

# Test a running MCP server
function mcp-test() {
  local port=${1:-$MCP_PORT}
  
  echo "Testing MCP server at http://$MCP_HOST:$port..."
  curl -s "http://$MCP_HOST:$port/v1/health" | jq .
}

# Show MCP server logs
function mcp-logs() {
  tail -f "$MCP_LOG_FILE"
}

# MCP server aliases
alias mcps="mcp-start"
alias mcpl="mcp-list"
alias mcpk="mcp-stop"
alias mcpka="mcp-stop-all"
alias mcpt="mcp-test"
alias mcplogs="mcp-logs" 