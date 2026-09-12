# Keymaps

## tmux

**Prefix = Ctrl+Space.** Press the prefix, release it, then press the next key.

| After prefix | Action |
| --- | --- |
| `d` | Detach session |
| `Ctrl+S` / `Ctrl+R` | Save / restore session (Resurrect) |
| `Shift+I` | Install plugins (TPM) |
| `c` | New window in the current directory |
| `n` / `p` | Next / previous window |
| `1–9` | Select window |
| `\|` / `-` | Split left/right / top/bottom |
| `h/j/k/l` | Focus pane left/down/up/right |
| `H/J/K/L` | Resize pane |
| `z` | Zoom/unzoom pane |
| `x` / `X` | Kill pane / window immediately |
| `r` | Reload config |
| `[` | Enter copy mode |

In copy mode, use Vim navigation, `v` to select, `y` to copy to the macOS
clipboard, and Escape to cancel.

## Lazygit

| Key | Action |
| --- | --- |
| `j/k` or arrows | Navigate items |
| `1/2/3` | Jump between panel groups |
| `Tab` | Toggle panel |
| `Space` | Stage/unstage |
| `c` | Commit |
| `p` / `P` | Pull / push |
| `e` | Edit using the configured/default editor |
| `\|` | Cycle unified / side-by-side Delta diffs |
| `?` | Show keybindings |
| `q` | Quit |

## Ghostty

| Key | Action |
| --- | --- |
| `Cmd+,` | Open config |
| `Cmd+Shift+,` | Reload config |
| `Cmd+N` | New window |
| `Cmd+T` | New tab |
| `Cmd+1–8` / `Cmd+9` | Select tab / last tab |
| `Cmd+D` / `Cmd+Shift+D` | Split right / down |
| `Cmd+Enter` | Toggle fullscreen |
| `Cmd+Shift+Enter` | Zoom/unzoom split |
| `Cmd++` / `Cmd+-` / `Cmd+0` | Increase / decrease / reset font size |
| `Shift+Enter` | Send newline |

## AeroSpace

| Key | Action |
| --- | --- |
| `Alt+h/j/k/l` | Focus window left/down/up/right |
| `Alt+Shift+h/j/k/l` | Move window |
| `Alt+/` | Cycle horizontal/vertical tiling |
| `Alt+-` / `Alt+=` | Shrink / grow window |
| `Alt+Q/W/E/R/T/Y/U/I/O/P` | Select workspace 1–10 |
| `Alt+Shift+Q/W/E/R/T/Y/U/I/O/P` | Move window to workspace 1–10 |
| `Alt+A/B/C/D/F/G/N/S/V/X/Z` | Select letter workspace |
| Add Shift to a letter-workspace shortcut | Move window to that workspace |
| `Alt+Tab` | Previous workspace |
| `Alt+,` / `Alt+.` | Focus previous / next monitor |
| `Alt+Shift+,` / `Alt+Shift+.` | Move window to previous / next monitor and follow |
| `Alt+Shift+Tab` | Move workspace to next monitor |
| `Alt+Escape` | Enter service mode |

In service mode:

| Key | Action |
| --- | --- |
| `Escape` | Reload config and return to main mode |
| `r` | Reset workspace layout and return |
| `f` | Toggle floating/tiling and return |
| `Backspace` | Close all windows except the current one and return |
| `Alt+Shift+h/j/k/l` | Join with adjacent container and return |
