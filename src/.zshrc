bindkey -v

if [[ -x $(which mvim) ]]; then
    export EDITOR="mvim -v"
else
    export EDITOR="vim"
fi

export PATH="$HOME/bin:$HOME/.dotfiles/bin:${PATH}"

alias cdrepo="cd $(git root)"
alias e=$EDITOR
alias pc=pbcopy
alias pp=pbpaste
alias ll='ls -alh'
alias pyclean='find . -name \*.pyc -delete'

alias be='bundle exec'
alias vg='bundle exec vagrant'
alias runningvms='VBoxManage list runningvms'

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

[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

source ~/.dotfiles/vendor/.autoenv/activate.sh
