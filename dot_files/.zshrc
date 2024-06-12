# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# defaults
export EDITOR="nvim"

# personal aliases/shortcuts
alias wipe="clear && printf '\e[3J'"
alias tainers="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}'"
alias vim="nvim"
alias lg="lazygit"
alias proj="cd ~/Documents/projects"

