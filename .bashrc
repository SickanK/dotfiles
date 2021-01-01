# Writeable vim command
 alias vim='sudo -E nvim'

# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

 alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

### Tmux ###

## EsportWeb
 alias tmux-client='vim ~/bepity/client' 
 alias tmux-server='vim ~/bepity/server' 
 alias tmux-misc1='vim ~/bepity' 
 alias tmux-misc2='psql -d bepity -U postgres'

## Code challenges
# Code
# Result - run command in vim on start
# Notes - run command in vim on start

### Automatic commands ###
# neofetch

### ALIASES ###

# qtile config
 alias qtilerc='vim ~/.config/qtile/config.py'

# vim config, local and global
 alias vimrc='vim ~/.config/nvim/init.vim'

# Tmux
 alias tmuxrc='vim ~/.tmux.conf'

# bash config
 alias bashrc='vim ~/.bashrc'

# termite config
 alias termiterc='vim ~/.config/termite/config'

# spotify_tui
 alias sptrc='vim ~/.config/spotify_tui/config.yml'

# neofetch
 alias neofetchrc='vim ~/.config/neofetch/config.conf'

# castero
 alias casterorc='vim ~/.config/castero/castero.conf'

# xresources
 alias resourcesrc='vim ~/.Xresources'

# vifmrc
 alias vifmrc='vim ~/.config/vifm/vifmrc'

# Neovim
 alias nvimrc="vim ~/.config/nvim/init.vim"


# shortened cd .. command
 alias ..='cd ..'

# git bare
 alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 

#Spotify_tui shortcut
 alias spotify='spt'

# Confirmation before overwriting
 alias cp='cp -i'

# List all files in a list
 alias ll='ls -la'
 alias ls='ls -l'

# Volume
 alias vol='pulseaudio-ctl'
 alias up='pulseaudio-ctl up'
 alias down='pulseaudio-ctl down'
 alias mute='pulseaudio-ctl mute'
 alias volume='pulseaudio-ctl'
