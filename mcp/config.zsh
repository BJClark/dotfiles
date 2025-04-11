# MCP Server Configuration

# Default directory for models
export MCP_MODELS_DIR="$HOME/.mcp/models"

# Default directory for MCP server configurations
export MCP_CONFIG_DIR="$HOME/.mcp/configs"

# Default MCP cache directory
export MCP_CACHE_DIR="$HOME/.mcp/cache"

# Create directories if they don't exist
mkdir -p "$MCP_MODELS_DIR" "$MCP_CONFIG_DIR" "$MCP_CACHE_DIR"

# Default model for Claude
export MCP_DEFAULT_CLAUDE_MODEL="claude-3-opus-20240229"

# Default model for local inference
export MCP_DEFAULT_LOCAL_MODEL="llama3"

# Default port for MCP server
export MCP_PORT=8000

# Default host for MCP server
export MCP_HOST="127.0.0.1"

# GPU configuration
export MCP_CUDA_VISIBLE_DEVICES="0"
export MCP_METAL_DEVICE="default"

# Memory settings
export MCP_RAM_LIMIT_GB=12

# Logging
export MCP_LOG_LEVEL="info"
export MCP_LOG_FILE="$HOME/.mcp/logs/mcp-server.log"
mkdir -p "$(dirname "$MCP_LOG_FILE")" 