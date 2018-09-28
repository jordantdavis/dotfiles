# bash prompt
export PS1="\n\u @ \h [\W] [\d \t]\nλ \[$(tput sgr0)\]"

# tab completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# custom aliases
alias la="ls -ahl"
alias ll="ls -hl"
alias brew-updg="brew update && brew upgrade"

# NodeJS
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Go
export GOROOT="/Users/jordandavis/go"
export GOPATH="/Users/jordandavis/go/packages"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Python
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/Users/jordandavis/Library/Python/2.7/bin:$PATH"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
