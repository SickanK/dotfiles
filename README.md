# macOS dotfiles

Portable configuration for **tmux, Lazygit, Ghostty, and AeroSpace**.

## Install on another Mac

Install [Homebrew](https://brew.sh), then clone this repository and run:

```sh
git clone https://github.com/SickanK/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
brew bundle --file=Brewfile
bash install.sh
```

The Brewfile installs the four apps, **Delta** for Lazygit diffs, and
**JetBrainsMono Nerd Font** for Ghostty and Lazygit's icons.

The installer works from any checkout location. It creates symlinks to the
configs and installs TPM (Tmux Plugin Manager). Existing configs are moved to
`.backup`, `.backup.1`, etc.; running it again skips links already in place.

## Config locations

| App | Source in this directory | Installed location |
| --- | --- | --- |
| tmux | `tmux/` | `~/.config/tmux` |
| tmux entry point | `tmux/tmux.conf` | `~/.tmux.conf` |
| Lazygit | `lazygit/` | `~/.config/lazygit` |
| Lazygit macOS entry point | `lazygit/config.yml` | `~/Library/Application Support/lazygit/config.yml` |
| Ghostty | `ghostty/` | `~/.config/ghostty` |
| Ghostty macOS settings | `ghostty/macos.conf` | `~/Library/Application Support/com.mitchellh.ghostty/config` |
| AeroSpace | `aerospace/aerospace.toml` | `~/.aerospace.toml` |

If `XDG_CONFIG_HOME` is set, the installer uses it in place of `~/.config`.
Edit the source files to update your setup; the installed paths point to them.

## First launch and reloading

### tmux

- Start `tmux`, then press **Ctrl+Space**, followed by **Shift+I**, to install plugins.
- Reload an existing server with `tmux source-file ~/.tmux.conf`.
- Prefix is **Ctrl+Space**. Reload from inside tmux with **prefix, r**.
- TPM installs plugins in `~/.tmux/plugins/`.
- Resurrect/Continuum save sessions every 15 minutes. Restore manually with
  **prefix, Ctrl+R**; automatic restore is disabled.

### Lazygit

- Run `lazygit` inside a Git repository.
- Uses the Latte theme, Nerd Font icons, and Delta diff renderers.
- Press `|` to cycle unified and side-by-side diffs.
- File editing uses Lazygit's standard editor detection. Configure your preferred
  editor through Git's `core.editor`, `VISUAL`, or `EDITOR` as needed.

### Ghostty

- Open or restart Ghostty after installing.
- Reload with **Cmd+Shift+,**; some settings need a new window or restart.
- `ghostty/config` sets the font, padding, explicit Latte colors, and Shift+Enter.
- `ghostty/macos.conf` supplies the macOS overrides: tabbed title bar, saved window
  state, display settings, and adaptive Frappe/Xcode Light theme selection.
- Explicit colors in `config` take precedence over the theme's colors, matching
  the original setup. Use `ghostty +show-config` to inspect the effective values.

### AeroSpace

- Open AeroSpace and grant macOS Accessibility access when prompted.
- Reload with `aerospace reload-config`.
- Starts at login, with tiled windows and zero gaps.
- **Alt+Q/W/E/R/T/Y/U/I/O/P** selects workspaces **1–10**. Add Shift to move a window.
- Odd-numbered workspaces are assigned to the main monitor and even-numbered
  workspaces to the secondary monitor. Adjust `[workspace-to-monitor-force-assignment]`
  for a different monitor layout.

See [KEYMAPS.md](KEYMAPS.md) for the keyboard cheatsheet.
