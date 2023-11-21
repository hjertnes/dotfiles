set -x GOPATH $HOME/.go
set -x GOROOT /usr/local/opt/go/libexec
set -x PATH /usr/local/bin $PATH ~/bin  $GOPATH/bin $GOROOT/bin $PATH
set -x EDITOR emacsclient
alias emacs "emacsclient -n" 
