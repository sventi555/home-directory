# personal aliases/shortcuts
alias wipe="clear && printf '\e[3J'"
alias tainers="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}'"
alias venv=". venv/bin/activate"

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# openssl stuff
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/openssl/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"

# thefuck
eval $(thefuck --alias)

# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

