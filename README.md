# home-directory

One-stop-shop to set up a new machine for development

## Fonts

Drag all fonts into fontbook


## iTerm2

1) Download [iTerm2](https://iterm2.com/) and add to applications

2) Open iTerm and import the profile _Terminal.json_

3) Update the following settings:
- General -> Closing
    - Disable 'Confirm closing multiple sessions'
    - Disable 'Confirm "Quit iTerm2"'
- General -> Selection
    - Enable 'Applications in terminal may access clipboard'
- Appearance -> General
    - Theme = Minimal

4) Go to Mac System Preferences -> Privacy & Security -> Developer Tools and add iTerm


## Oh My Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./dot_files/.zshrc ~/
```

Restart the terminal


## Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
```


## tmux

```
brew install tmux
cp ./dot_files/.tmux.conf ~/
tmux source-file ~/.tmux.conf
```


## Neovim

```
brew install neovim ripgrep fd
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config
cp -r ./nvim ~/.config/
vim +'PlugInstall --sync' +qa
```


## lazygit

```
brew install lazygit git-delta
cp ./lazy_git/config.yml "~/Library/Application Support/lazygit/"
cp ./dot_files/.gitconfig ~/
```


## ssh

Put existing id_rsa in .ssh/ directory, or generate a new one:

```
mkdir -p ~/.ssh
ssh-keygen -f ~/.ssh/id_rsa
```


## node

```
brew install nvm
source ~/.zshrc
nvm install node
corepack enable pnpm
```

