# set variables

# create aliases
alias ls='gls -lAFhN --color --group-directories-first'
alias emacs='emacs -nw'
alias vim='nvim'
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'


# customize prompt(s)
# prompt: directory, shell level, divider
PROMPT='%1~ %L %# '


# time of day
autoload -U colors && colors
RPROMPT='%(?..(%?%) )%*'


# add locations to the $PATH variable
export PATH="$PATH:$HOME/.local/bin"


# functions
function mkcd() {
    mkdir -p "$@" && cd "$_";
}

# ... other
eval "$(starship init zsh)"
neofetch
tmux-sessions
