# Nvim Lua configs

## Requirements
- True color terminal (Terminal)
- [neovim](Neovim ) >=v0.9
- Nerd Font 
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- build-essential 

## Setup
Clone repository in `.config` directory

### Keybindings
Some keybindings may not work in macOS due to predefined shortcuts.

In macos, remove the shortcut `Ctrl+Space` from the keyboard settings menu.
If Alacritty terminal emulator is used, add these lines to the configuration file:
```yaml
# alacritty.yaml
key_bindings:
  - { key: Space,   mods: Control, chars: "\x00"}
```

## Resources
- https://github.com/LunarVim/Neovim-from-scratch/
- https://github.com/josean-dev/dev-environment-files/

## Todo
- copilot

