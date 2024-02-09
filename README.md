# Nvim Lua configs

## Requirements
- True color terminal ([Alacritty](Alacritty), ixterm2, etc )
- [neovim](Neovim ) >=v0.9
- Nerd Font 
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- build-essential 

## Setup
Clone repository in `.config` directory

### Keybindings
If some keybindings do not work, it may be that they are OS predefined shortcuts.

In macos, remove the shortcut `Ctrl+Space` from the keyboard settings menu.
Additionally, if Alacritty terminal emulator is used, add these lines to the configuration file:
```yaml
# alacritty.yaml
key_bindings:
  - { key: Space,   mods: Control, chars: "\x00"}
```

## Resources
- https://github.com/LunarVim/Neovim-from-scratch/
- https://github.com/josean-dev/dev-environment-files/

## Todo

- Telescope +
https://github.com/nvim-telescope/telescope.nvim
- ripgrep + 

- LSP
    - Mason     + 
    - lspconfig + 
    - lspsaga +
    - lspkind
    - snippet engine + 
    - servers 
        - python + 
        - golang + 
        - lua +
        - terraform
        - powershell (windows)
        - azure-pipelines (windows)

- Treesitter
    - markdown                  +
    - markdown inline parser    +

- gitsigns + 
- diffview +

- openbrowser +
