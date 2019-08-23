#/usr/bin/env sh

SCRIPT_DIR=$(dirname $0)

# setup vim

# copy in the vimrc
cp $SCRIPT_DIR/dot_files/.vimrc ~/

# create .vim folder if it does not exist
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi


# copy over the colors
cp -r $SCRIPT_DIR/dot_files/.vim/colors ~/.vim

# create bundle folder if it does not exist
if [ ! -d ~/.vim/bundle ]; then
    mkdir ~/.vim/bundle
fi

# clone vundle into bundle folder
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# initialize vim plugins
vim -c PluginInstall -c qa


# profile setup

# copy over zshrc
cp $SCRIPT_DIR/dot_files/.zshrc ~/

# install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
