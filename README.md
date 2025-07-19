# 🫐 My Neovim Setup

> ✨ My configuration is inspired in [craftzdog dotfiles](https://github.com/craftzdog/dotfiles-public)

### Requirements

- Neovim >= 0.9.0 (needs to be built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- a Nerd Font(v3.0 or greater) (optional, but needed to display some icons)
- lazygit (optional)
- a C compiler for nvim-treesitter. See here
- curl for blink.cmp (completion engine)
- for fzf-lua (optional)
  - fzf: fzf (v0.25.1 or greater)
  - live grep: ripgrep
  - find files: fd
- a terminal that support true color and undercurl:
  - kitty (Linux & Macos)
  - wezterm (Linux, Macos & Windows)
  - alacritty (Linux, Macos & Windows)
  - iterm2 (Macos)
- [pywal](https://github.com/dylanaraps/pywal) - For dynamic coloscheme generation
- [AlphaTechnolog/pywal.nvim](https://github.com/AlphaTechnolog/pywal.nvim)

### Installation

**Backup your existing configurations**

```bash
mv ~/.config/nvim{,.bak}

# Optional
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```
```
```

**Clone this configuration**

**Install pywalfox (If not installed)**
```bash

# Arch linux
sudo pacman -S python-pywal

# macOS
brew install pywal

# Other Linux distributions
pip install pywal
```

**Start neovim**
```bash
nvim
```
```
```

> LazyVim will automatically install all plugins on first launch.


