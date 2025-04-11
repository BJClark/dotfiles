# Modern Dotfiles

These dotfiles help you personalize your system with a modern development experience. Based on Holman's topic-centric organization, but updated with modern tools and workflows.

## Features

- **Shell**: Zsh with Oh-My-Zsh and Spaceship prompt
- **Tool Management**: Mise for version management (Ruby, Node.js, Elixir, etc.)
- **Terminal**: Ghostty configuration with modern theme
- **Editor**: Cursor integration
- **Languages**: 
  - Ruby configuration
  - Elixir/Phoenix/LiveBook setup
  - Bun as primary JavaScript runtime
- **DevOps**: 
  - AWS CLI with profile management
  - Docker integration
- **Security**: 1Password CLI integration with SSH agent
- **Utilities**: MCP server management for AI development

## Organization

Everything's built around topic areas. Each topic has its own directory containing related configuration files:

- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your shell environment
- **topic/path.zsh**: Files named `path.zsh` are loaded first to set up `$PATH`
- **topic/completion.zsh**: Files named `completion.zsh` are loaded last for completions
- **topic/\*.symlink**: Files ending in `*.symlink` get symlinked into your home directory
- **bin/**: Scripts added to your `$PATH` and available everywhere

## Installation

```sh
git clone https://github.com/BJClark/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
brew bundle  # Installs dependencies via Homebrew
```

This will:
1. Symlink all `*.symlink` files to your home directory
2. Install Homebrew packages and applications
3. Set up tool versions with mise
4. Configure Ghostty terminal
5. Set up Oh-My-Zsh plugins for Elixir
6. Ensure proper directory structure for configs

The install process runs these key scripts:
- `script/bootstrap`: Sets up symlinks and runs the installation scripts (also makes install scripts executable)
- `script/install`: Installs all dependencies

## Key Tools

### Mise

Mise manages tool versions (formerly asdf). Configure global defaults in `~/.mise.toml` and project-specific versions in each project directory.

```sh
# List installed tools
mise list

# Install a tool
mise install ruby@latest

# Use a specific version in a project
mise use ruby@3.2.0
```

### Oh-My-Zsh with Spaceship

The shell is preconfigured with useful plugins and a modern Spaceship prompt. Customize the prompt in `zsh/prompt_integrations.zsh`.

### 1Password Integration

Use the 1Password CLI for secrets management:

```sh
# Login to 1Password
opl

# Get a password
opg item-name

# Load environment variables from a 1Password item
ope item-name
```

### MCP Server Management

Manage Model Control Protocol servers for AI development:

```sh
# Start an MCP server with default model
mcp-server start

# List running servers
mcp-server list

# Stop a server
mcp-server stop <pid>
```

### Ghostty Terminal

Ghostty terminal is configured with:
- JetBrains Mono Nerd Font
- Nord color theme
- Custom keybindings
- Performance optimizations

### Elixir Development

Full Elixir environment with:
- IEx configuration with custom helpers
- Phoenix shortcuts
- LiveBook integration
- Mix aliases

```sh
# Start Phoenix server
mps

# Start LiveBook
lbs
```

### Bun JavaScript Runtime

Bun is configured as the primary JavaScript runtime:

```sh
# Run scripts
br dev

# Install packages
bi

# Switch to Node.js mode if needed
nodemode
```

## Customization

- **Local customizations**: Create a `~/.zshrc.local` file for machine-specific settings
- **Git config**: Update `git/gitconfig.local.symlink` for your git credentials
- **Tool versions**: Update `.mise.toml` for default tool versions

## Maintenance

Run `script/bootstrap` when you add new symlinks to update your environment.

Run `brew bundle` periodically to ensure all packages are installed.

## Troubleshooting

### Common Issues

- **Yarn configuration error**: If you see `Error: ENOTDIR: not a directory, open '/Users/username/.config/yarn'`, run:
  ```sh
  # Fix Yarn configuration directory
  mv ~/.config ~/.config.bak && mkdir -p ~/.config/yarn
  ```

- **Missing Oh-My-Zsh plugins**: Custom plugins are in `~/.oh-my-zsh/custom/plugins/`. See the `zsh/oh-my-zsh.zsh` file for the list of enabled plugins.

- **Reload configuration**: Use `reload!` to refresh your shell configuration after making changes.

## Directory Structure

This dotfiles repository uses a topic-based organization:

- `aws/`: AWS CLI configurations and helpers
- `bin/`: Executable scripts
- `bun/`: Bun JavaScript runtime configuration
- `cursor/`: Cursor editor configuration
- `docker/`: Docker aliases and helpers (includes modern `docker compose` command)
- `elixir/`: Elixir and Phoenix development environment
- `functions/`: Utility functions for shell
- `ghostty/`: Ghostty terminal configuration
- `git/`: Git configuration and aliases
- `homebrew/`: Homebrew configuration with support for both Intel and Apple Silicon Macs
- `macos/`: macOS specific settings
- `mcp/`: Model Control Protocol server management
- `mise/`: Configuration for mise version manager
- `node/`: Node.js configuration (managed by mise)
- `ruby/`: Ruby configuration (managed by mise)
- `system/`: System-wide environment variables and aliases (uses Cursor as default editor)
- `xcode/`: Xcode-related helpers with support for iOS, watchOS, and visionOS simulators
- `yarn/`: Yarn package manager configuration (being replaced by Bun)
- `zsh/`: ZSH shell configuration with oh-my-zsh

## Recent Updates

- Replaced multiple version managers with mise (Ruby, Node.js, etc.)
- Added Bun as the primary JavaScript runtime
- Updated Docker aliases to support modern `docker compose` command
- Configured Homebrew paths to support both Intel and Apple Silicon Macs
- Set Cursor as the default editor
- Added support for visionOS simulator in Xcode aliases
- Optimized paths for better compatibility and security
- Added AWS, 1Password CLI, and Ghostty configurations
- Removed deprecated tools and cleaned up unused configurations

## Credits

Based on Holman's dotfiles organization with significant modernization.