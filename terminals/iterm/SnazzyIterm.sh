#!/bin/bash

#  https://medium.com/airfrance-klm/beautify-your-iterm2-and-prompt-40f148761a49

brew install --cask iterm2

# Getting rid of the ugly title bar 
# iTerm2 Preferences: Appearance > General > Theme: Minimal

(curl -Ls https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors > /tmp/Snazzy.itermcolors && open /tmp/Snazzy.itermcolors)

# Configure iTerm2 color theme:

# iTerm2 Preferences: Profiles > Colors > Color Presets: Snazzy

# If you don’t like this theme, you can probably find your favourite theme here: https://iterm2colorschemes.com

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zplug
brew install zplug


#Configure ~.zshrc
# ~.zshrc
export ZSH=~/.oh-my-zsh
# disable oh-my-zsh themes for pure prompt
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug load
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi



source ~/.zshrc

# syntax highlighting
# Get syntax highlighting in zsh with fast-syntax-highlighting.

zplug "zdharma/fast-syntax-highlighting", as:plugin, defer:2


# auto suggestions
# Get suggestions and completion based on your history with zsh-autosuggestions.

# In the previous screenshot you can see zsh --version being suggested while typing.

zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2
