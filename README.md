## Dotfiles

This is a repository containing my dotfiles for both macos and linux.

### Linux
---
Fonts to install:
- siji
- otf-awesome-font

### MacOS
---
Make sure to install:
- [tmux plugin manager](https://github.com/tmux-plugins/tpm)
- [packer](https://github.com/wbthomason/packer.nvim)
- [ripgrep (brew)](https://github.com/BurntSushi/ripgrep)

Fonts to install:
- Jetbrains Mono Nerdfont

Instead of moving the folders create symlinks for neovim
`ln -s ~/dotfiles/macos/nvim ~/.config/`
and tmux
`ln -s ~/dotfiles/macos/tmux ~/.config/`

After installing dependencies run:
`tmux source ~/.config/tmux/`
and install by pressing:
`<prefix>+I` where prefix is `Ctrl+Space`
