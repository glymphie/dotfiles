# ~/.zprofile used for all zsh-login-shell
# Default programs
export EDITOR="nvim"
export READER="zathura"
export BROWSER="brave-browser-stable"
export TERMINAL="ghostty"

# XDG user directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# XDG system directories
export XDG_CONFIG_DIRS="/etc/xdg"

# XDG dir
export XDG_DATA_DIR="/usr/local/share:/usr/share"
export XDG_RUNTIME_DIR="/run/user/$UID"

# XDG home directories
export XDG_DOCUMENTS_DIR="$HOME/dox"
export XDG_DOWNLOAD_DIR="$HOME/dls"
export XDG_PICTURES_DIR="$HOME/media/pix"
export XDG_VIDEOS_DIR="$HOME/media/vidz"
export XDG_MUSIC_DIR="$HOME/media/audio/music"

# Regular paths
export DOCUMENTS="$HOME/dox"
export DOWNLOADS="$HOME/dls"
export CODE="$HOME/code"
export SCRIPTS="$HOME/scripts"
export MEDIA="$HOME/media"
export PICTURES="$MEDIA/pix"
export VIDEOS="$MEDIA/vidz"
export AUDIO="$MEDIA/audio"
export MUSIC="$AUDIO/music"

# Cleaning up configs
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export BASHDOTDIR="$XDG_CONFIG_HOME/bash"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export XAUTHORITY="$XDG_CONFIG_HOME/Xauthority"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYTHONHISTFILE="/dev/null"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# Cleaning up data
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"

# Cleaning up cache
export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

# Grimoire PATHs
export GRIMOIRE="$CODE/mine/grimoire"
export NOTES="$GRIMOIRE/notes"
export TODO="$GRIMOIRE/todo"
export BLOGPOSTS="$GRIMOIRE/blogposts"

# Plugins
export ZSHPLUGINS="$CODE/external/zsh_plugins"

# Curl Ca cert
export CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"

# PATH
# Add $HOME/.local/bin once to PATH
case "$PATH" in
    *"$HOME/.local/bin"*) ;;
    *) export PATH="$PATH:$HOME/.local/bin";;
esac

# Add $GOPATH/bin once to PATH
case "$PATH" in
    *"$GOPATH/bin"*) ;;
    *) export PATH="$PATH:$GOPATH/bin";;
esac

# Add $CARGO_HOME/bin once to PATH
case "$PATH" in
    *"$CARGO_HOME/bin"*) ;;
    *) export PATH="$PATH:$CARGO_HOME/bin";;
esac

# Load aliases if existent
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
