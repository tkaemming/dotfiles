bindkey -v

alias pc=pbcopy
alias pp=pbpaste

if [[ -x $(which hub) ]]; then
    alias git=hub
fi

setopt autocd
setopt autopushd
setopt noclobber

autoload -U compinit && compinit
setopt completealiases
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -U colors && colors
setopt prompt_subst
export CLICOLOR=true
PROMPT='%n@%m %# '
RPROMPT='%{$fg[yellow]%}$(git current-branch)%{$fg[green]%}%~% %{$reset_color%}'
