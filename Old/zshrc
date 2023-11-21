export PATH="/usr/local/bin:$PATH:$HOME/bin:$GOPATH/bin:$GOROOT/bin"
export ZSH="/Users/hjertnes/.oh-my-zsh"
ZSH_THEME="dracula-pro"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git z fzf wakatime)
source $ZSH/oh-my-zsh.sh

export GOPATH="$HOME/.go"
export GOROOT="/usr/local/opt/go/libexec"
export EDITOR="emacsclient"

alias emacs="emacsclient -n"
alias upgrade="brew update; brew upgrade; brew cask upgrade"
alias git-update="git add . && git commit -m update && git pull && git push"
alias toot="toot-latest.sh"
alias timeline="tw.txt timeline"
alias tweet="tw.txt tweet"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/hjertnes/.go/bin/bitcomplete bit
