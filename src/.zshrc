bindkey -v

if [[ -x $(which mvim) ]]; then
    export EDITOR="mvim -v"
else
    export EDITOR="vim"
fi

export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE
setopt extendedhistory
setopt sharehistory

export PATH="$HOME/bin:$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:${PATH}"

alias cdrepo='cd $(git root)'
alias e=$EDITOR
alias pc=pbcopy
alias pp=pbpaste
alias ll='ls -alh'
mkcd () { mkdir -p $1 && cd $1 }
alias rmswap="find . -name .\*.sw\? -delete"
alias mostused="cat ${HISTFILE} | colrm 1 15 | sort | uniq -c | sort"
git-archive-branch () { git branch -m {,archive/}$1 }
editpkg () { $EDITOR $(whichpkg $@) }
pyversion () { python -c "import pkg_resources; print pkg_resources.get_distribution('$1').version" }

alias pyclean='find . -name \*.pyc -delete'
alias pyf='find . -name \*.py -not -path \*migrations/\* -not -path \*vendor/\* -not -path \*settings/\* | xargs pyflakes'

alias be='bundle exec'
alias vg='bundle exec vagrant'
alias runningvms='VBoxManage list runningvms'

if [[ -x $(which hub) ]]; then
    alias git=hub
fi

export REPORTTIME=5
if [[ -x /usr/bin/time ]]; then
    alias time=/usr/bin/time
fi

setopt autocd
setopt autopushd
setopt noclobber

autoload -U compinit && compinit
setopt completealiases
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey '^r' history-incremental-search-backward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

autoload -U colors && colors
setopt prompt_subst
export CLICOLOR=true
PROMPT='%n@%m %# '
RPROMPT='%(?..%{$fg[red]%}[%?]%{$reset_color%} )%{$fg[yellow]%}$(git current-branch)%{$fg[green]%}%~% %{$reset_color%}'

[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

source ~/.dotfiles/vendor/.autoenv/activate.sh

if [[ -x /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

CREDENTIALS_DIR=~/.credentials
if [[ -d $CREDENTIALS_DIR ]]; then
    chmod -R 0500 $CREDENTIALS_DIR
    source $CREDENTIALS_DIR/*
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
