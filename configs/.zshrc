export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Homebrew Path
export PATH=/usr/local/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/opt/homebrew/bin

# Go
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin

# Spaceship prompt
source "/opt/homebrew/opt/spaceship/spaceship.zsh"

# fnm
eval "$(fnm env --use-on-cd)"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# alias 
# naviagation
alias dev="cd ~/Developer"

# brew
alias brewUp="brew update; brew upgrade; brew cleanup"