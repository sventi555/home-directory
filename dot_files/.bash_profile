# personal aliases/shortcuts
alias wipe="clear && printf '\e[3J'"
alias tainers="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}'"
alias venv=". venv/bin/activate"

# nvm stuff
if [ -x "$(command -v nvm)" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
fi

# pyenv stuff
if [ -x "$(command -v pyenv)" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# pyenv currently fails to install if the following command is not run on mojave
# sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
