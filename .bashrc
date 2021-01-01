# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

 alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

### Terminal startup ###
neofetch
eval "$(starship init bash)"

### ALIASES ###

# Writeable vim command
 alias vim='sudo -E nvim'

# bash config
 alias bashrc='vim ~/.bashrc'

# shortened cd .. command
 alias ..='cd ..'

# Confirmation before overwriting
 alias cp='cp -i'

# List all files in a list
 alias ll='ls -la'
 alias ls='ls -l'

# Start spotifyd
alias spt='sh ~/scripts/launchspt.sh'
