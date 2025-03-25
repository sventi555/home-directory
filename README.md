# home-directory

One-stop-shop to set up a new machine for development

## Fonts

Drag all fonts into fontbook


## Ghostty

1) Download [Ghostty](https://iterm2.com/) and add to applications

2) Open Ghostty and copy the contents of _ghostty.config_ to config


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


## Neovim

```
brew install neovim ripgrep fd
mkdir -p ~/.config
cp -r ./nvim ~/.config/
```


## git

```
brew install lazygit
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
