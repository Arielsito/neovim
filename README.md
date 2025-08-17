# 🫐 My Neovim Setup

> ✨ My configuration is inspired in [craftzdog dotfiles](https://github.com/craftzdog/dotfiles-public)

> [!WARNING]
> This configuration is built and tested only in Arch Linux. While most features should work on other Unix-like systems, the pwal integration may require addicional setup on macOS/other linux distributions.

### Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- [LazyVim](https://www.lazyvim.org/)
- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but needed to display some icons)_**
- [lazygit](https://github.com/jesseduffield/lazygit) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **_(optional)_**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)
- a terminal that support true color and *undercurl*:
  - [kitty](https://github.com/kovidgoyal/kitty) **_(Linux & Macos)_**
  - [wezterm](https://github.com/wez/wezterm) **_(Linux, Macos & Windows)_**
  - [alacritty](https://github.com/alacritty/alacritty) **_(Linux, Macos & Windows)_**
  - [iterm2](https://iterm2.com/) **_(Macos)_**
-[pywal](https://github.com/dylanaraps/pywal) - For dynamic coloscheme generation
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

**Clone this configuration**
```bash
git clone https://github.com/Arielsito/neovim ~/.config/nvim
```

**Install python-pywal (If not installed)**
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

> LazyVim will automatically install all plugins on first launch.


