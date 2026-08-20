# Neovim configuration

Personal, modular Neovim configuration originally based on
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

## Requirements

- Neovim 0.12.0 or newer
- Git and a system clipboard provider
- A Nerd Font; the checked-in configuration enables Nerd Font glyphs
- Core tools: `rg` and `fd`
- Integrations: `yazi`, `ya`, `lazygit`, and `gh`
- Build and installation tools: `cc`, `make`, `curl`, `tar`, `unzip`, and
  `tree-sitter` 0.26.1 or newer

Mason installs the configured language servers and formatters, including
basedpyright, ESLint, rust-analyzer, Ruff, lua-language-server, Prettier, and
StyLua. Their underlying language runtimes and project toolchains, such as
Node.js or Cargo, must still be available when required by a project.

Run `:checkhealth kickstart` to check the system-owned tools used by this
configuration. Plugin-specific details are available through `:checkhealth`.

## Installation

Back up an existing Neovim configuration first, or use
[`NVIM_APPNAME`](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME) to
run this configuration alongside another one.

Linux and macOS:

```sh
git clone --branch main https://github.com/jmgarvey/kickstart.nvim.git \
  "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
```

Windows Command Prompt:

```bat
git clone --branch main https://github.com/jmgarvey/kickstart.nvim.git "%LOCALAPPDATA%\nvim"
```

Windows PowerShell:

```powershell
git clone --branch main https://github.com/jmgarvey/kickstart.nvim.git "$env:LOCALAPPDATA\nvim"
```

Start `nvim`. Lazy installs configured plugins at the revisions recorded in
`lazy-lock.json`, and Mason installs the configured development tools.

## Layout

- `init.lua`: options, core mappings, LSP, formatting, completion, and primary
  plugin specifications
- `lua/kickstart/plugins/`: feature-specific plugin modules
- `lua/custom/plugins/`: custom plugin specifications
- `lua/kickstart/health.lua`: `:checkhealth kickstart` provider
- `lazy-lock.json`: tracked plugin revisions

## Workflows

Use which-key or `<leader>sk` to discover mappings. Main entry points include:

| Keys | Workflow |
| --- | --- |
| `<leader>s` | Snacks search and Grug Far replacement |
| `\` or `<leader>y` | Yazi file management |
| `<leader>h` and `<Space>1` through `<Space>5` | Harpoon |
| `<leader>g` | Git, GitHub, LazyGit, and worktrees |
| `<leader>f` | Format the current buffer or selection |
| `,v` | Select a Python virtual environment |
| `<leader>i` | Treesitter incremental selection |
| `<leader>d` | Debugger controls and UI |

DAP UI and virtual text are installed, but no debugger adapter is currently
configured. Python DAP support is retained in the configuration but disabled.

## Maintenance

- `:Lazy`: inspect plugins
- `:Lazy update`: update plugins and the lockfile
- `:Mason`: inspect language tools
- `:TSUpdate`: update Treesitter parsers
- `:checkhealth`: run all health providers
- `:checkhealth kickstart`: check this configuration's system dependencies
