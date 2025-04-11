# Dotfiles Modernization Plan

## Current State Analysis

This dotfiles repo is based on Holman's dotfiles structure with topic-based organization. Currently includes:

- Shell: zsh with oh-my-zsh and spaceship prompt
- Ruby: Multiple managers (rbenv, chruby)
- Node: Using NVM
- Package management: Homebrew (with Brewfile)
- No AWS configurations despite being used
- Unused Vim configurations
- No Elixir configurations
- No configuration for Ghostty terminal
- No 1Password CLI integration

## Modernization Goals

1. Switch to mise as the primary tool version manager
2. Keep and update spaceship prompt for modern workflows
3. Replace Node.js with Bun where possible
4. Remove duplicate ways of managing languages (rbenv vs chruby)
5. Remove unused tooling (Vim)
6. Add AWS configuration and tooling
7. Add Elixir tooling and configurations
8. Configure Ghostty for a modern terminal experience
9. Add 1Password CLI integration
10. Clean up any cruft/unused configurations

## Action Plan

### 1. Shell Configuration Cleanup

- Keep zsh with oh-my-zsh as the primary shell framework
- Upgrade oh-my-zsh to latest version
- Update plugin selection for better functionality
- Remove redundant/unused aliases and functions
- Update spaceship prompt configuration for newer versions
- Consider mise integration with spaceship
- Optimize oh-my-zsh loading time

### 2. Tool Version Management with mise

- Install mise via Homebrew
- Configure `.mise.toml` in home directory
- Migrate from:
  - rbenv/chruby → mise for Ruby
  - nvm → mise for Node.js (when needed)
  - Add mise configs for other languages/tools

### 3. Package Management

- Update Brewfile with current tools
- Add mise, AWS CLI, and other missing tools
- Remove unused packages

### 4. Node.js & Bun

- Configure Bun as primary JS runtime
- Keep minimal Node.js support for compatibility
- Add Bun configurations and aliases

### 5. AWS Configuration

- Add AWS CLI configuration
- Set up AWS profile management
- Add helpful AWS aliases and functions

### 6. Elixir Configuration

- Configure mise for Erlang and Elixir version management
- Add IEx configuration with custom helpers
- Set up Phoenix-related aliases and helpers
- Configure Mix environment variables and defaults
- Add LiveBook shortcuts and configurations

### 7. MCP Server Management

- Create a system-wide configuration for Model Control Protocol servers
- Add start/stop scripts and aliases for common MCP server operations
- Include environment variable management for model paths and configurations
- Add service management for running MCP servers in background

### 8. Ghostty Configuration

- Create a dedicated Ghostty configuration file
- Set up modern color schemes and themes
- Configure font settings (Nerd Font with ligatures)
- Optimize terminal rendering and performance settings
- Add custom keybindings for improved productivity
- Configure integration with spaceship prompt
- Add custom shell indicators and styling

### 9. 1Password CLI Integration

- Set up 1Password CLI configuration
- Enable SSH Agent integration
- Create helper functions for secrets management
- Configure shell completion
- Add environment variable fetching from vault

### 10. Cleanup

- Remove unused directories (vim)
- Add Cursor editor configurations
- Consolidate duplicate configurations
- Update README to reflect new structure

## Implementation Order

1. Basic cleanup (remove unused configs)
2. Install and configure mise
3. Update Brewfile
4. Update shell configurations and oh-my-zsh
5. Add AWS tooling
6. Configure Bun
7. Configure Elixir environment
8. Configure Ghostty
9. Test and finalize

## Files to Create/Modify

- `.mise.toml` - Main mise configuration
- `mise/path.zsh` - Path configuration for mise
- `aws/config.zsh` - AWS configuration
- `bun/config.zsh` - Bun configuration
- `zsh/zshrc.symlink` - Update with new configurations
- `zsh/oh-my-zsh.zsh` - Oh-my-zsh specific configurations
- `Brewfile` - Update with current tools
- `cursor/config.zsh` - Cursor editor configurations
- `mcp/config.zsh` - MCP server configuration and environment variables
- `mcp/functions.zsh` - Helper functions for managing MCP servers
- `bin/mcp-server` - CLI tool for MCP server management
- `elixir/iex.exs.symlink` - IEx configuration with helpers
- `elixir/config.zsh` - Elixir environment configuration
- `elixir/mix.zsh` - Mix aliases and functions
- `ghostty/config.symlink` - Ghostty terminal configuration
- `ghostty/themes/` - Custom themes for Ghostty
- `zsh/prompt_integrations.zsh` - Terminal-specific prompt configurations
- `1password/config.zsh` - 1Password CLI integration and SSH agent setup 