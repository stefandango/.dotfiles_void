#XDG environment variables
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CURRENT_DESKTOP=Unity
export XDG_SESSION_DESKTIP=Unity
export XDG_SESSION_TYPE=wayland


export ZSH="$XDG_DATA_HOME/.oh-my-zsh"
export PATH="$HOME/Scripts:$HOME/.local/bin:$PATH"
export HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

# Waylan global variables
export BMENU_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_FORCE_DPI=physicail
export KITTY_ENABLE_WAYLAND=1

#My global variables
export PROJECTS="~/Dev"

# NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

# Python
export PYTHONSTARTUP="/etc/python/pythonrc"

# Readline
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# GOLang
export GOPATH="$XDG_DATA_HOME"/go

# DOTNET
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

# OmniSharp
export OMNISHARPHOME="$XDG_CONFIG_HOME"/omnisharp

export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
