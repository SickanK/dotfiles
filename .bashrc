# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

 alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

### Terminal startup ###
#neofetch
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

# Tmux shared
alias tmuxs='tmux new-session -s main'
alias tmuxa='tmux attach-session -t main'

export BROWSER="/usr/bin/firefox"
export PATH="$PATH:/home/dev/.cargo/bin"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source "$HOME/.cargo/env"
. "$HOME/.cargo/env"
source /usr/share/nvm/init-nvm.sh

# env

REDDIS_ADDR="redis://127.0.0.1:45374"
AMQP_ADDR="amqp://127.0.0.1:35672/%2f"
ACCOUNT_GRPC_ADDR="http://localhost:39123"
HOST_ADDR="0.0.0.0:50000"

export PNPM_HOME="/home/dev/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
