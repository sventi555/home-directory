# home-directory

One-stop-shop to set up a new machine for development

## Fonts

Drag all fonts into fontbook


## iTerm2

1) Download [iTerm2](https://iterm2.com/) and add to applications

2) Open iTerm and import the profile _Terminal.json_

3) Update the following settings:
- General
    - Closing
        - Disable 'Confirm closing multiple sessions'
        - Disable 'Confirm "Quit iTerm2"'
    - Selection
        - Enable 'Applications in terminal may access clipboard'
        - Disable 'Clicking on a command selects it to restrict Find and Filter'
- Appearance
    - General
        - Theme = Minimal
    - Dimming
        - Disable 'Dim inactive split panes'

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
