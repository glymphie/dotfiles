#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#

# Completions
fpath=(
    "$XDG_CONFIG_HOME/zsh/completions/"
    $fpath
)

# Make sure CACHE and STATE location are created
mkdir -p \
    "$XDG_CACHE_HOME/zsh" \
    "$XDG_STATE_HOME/zsh"

# Enable Portage completions and Gentoo prompt for zsh
autoload -Uz compinit promptinit
compinit -d "$XDG_CACHE_HOME/zsh/compdump"
promptinit; prompt gentoo

# Load version control information
autoload -Uz vcs_info
precmd() {
    vcs_info
}
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# Prompt and colors
autoload -U colors && colors


function prompt-length() {
  emulate -L zsh
  local -i COLUMNS=${2:-COLUMNS}
  local -i x y=${#1} m
  if (( y )); then
    while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
      x=y
      (( y *= 2 ))
    done
    while (( y > x + 1 )); do
      (( m = x + (y - x) / 2 ))
      (( ${${(%):-$1%$m(l.x.y)}[-1]} = m ))
    done
  fi
  typeset -g REPLY=$x
}

# Sets PROMPT
function set-prompt() {
  emulate -L zsh

  local top_left="%F{green}%n%f"
  top_left+="%F{magenta}@%f"
  top_left+="%F{cyan}%m %f"
  top_left+="%B%F{red}%\[%f"

  if [[ -n "$VIRTUAL_ENV" ]]
  then
    top_left+="🐍%f" # Python Virtual environment  $(basename $VIRTUAL_ENV)"
  fi

  if [[ -n "$VIRTUAL_ENV" ]] && [[ -n "${vcs_info_msg_0_}" ]]
  then
    top_left+="%B%F{red}|%f"
  fi

  if [[ -n "${vcs_info_msg_0_}" ]]
  then
    top_left+="%F{yellow}${vcs_info_msg_0_}%f" # Git
  fi

  top_left+="%B%F{red}%\] %f"
  top_left+="%B%F{blue}%/%f"

  local bottom_left="%b%F{red} ► %f"

  PROMPT=$top_left$'\n'$bottom_left
}

setopt no_prompt_{bang,subst} prompt_{cr,percent,sp}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt


# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"

# Autocomplete tab
zstyle '*:completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Vim keys in tab menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^R' history-incremental-search-backward



# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 = 'block' ]]; then
      echo -ne '\e[2 q'
    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]] ||
         [[ ${KEYMAP} = '' ]] ||
         [[ $1 = 'beam' ]]; then
      echo -ne '\e[6 q'
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() {
  echo -ne '\e[6 q'       # beam cursor
  print -Pn "\e]2;$1\a"   # title = command
}

# Edit line in vim with ctrl-e
#autoload edit-command-line; zle -N edit-command-line
#bindkey '^e' edit-command-line

# Allow autocomplete for inside
_inside() {
    _command_names
}

compdef _inside inside

# Disable default venv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Load aliases if existent
[ -f "$XDG_CONFIG_HOME/aliasrc" ] && source "$XDG_CONFIG_HOME/aliasrc"

# Plugins
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[arg0]="fg=magenta,bold"
