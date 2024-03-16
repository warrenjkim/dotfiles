# Luke's config for the Zoomer Shell

export COLORTERM=truecolor
# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

bindkey -e

fzf_cd() {
  local selected=$(find . | fzf)

  [[ -z "$selected" ]] && return

  local dir=$(dirname "$selected")
  cd "$dir" || return

  zle accept-line
}
zle -N fzf_cd

fzf_vim() {
  local selected=$(find . | fzf)

  [[ -z "$selected" ]] && return

  BUFFER="vim '$selected'"
  zle accept-line
}
zle -N fzf_vim

bindkey '^u' fzf_cd
bindkey '^o' fzf_vim


# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

eval "$(starship init zsh)"
eval "echo && neofetch"
