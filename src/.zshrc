bindkey -v

export PATH="$HOME/bin:$HOME/.dotfiles/bin:${PATH}"

alias pc=pbcopy
alias pp=pbpaste
alias ll='ls -alh'

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
