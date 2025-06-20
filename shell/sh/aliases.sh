# Handy function to determine if a command is installed
_has() {
  command -v $1>/dev/null 2>&1
}

# Kubernetes cli
# https://github.com/kubernetes/kubernetes
#
# brew install kubernetes-cli
if _has kubectl; then
  alias k='kubectl'
  alias kg='kubectl get'
  alias kgp='kubectl get pods'
  alias kgs='kubectl get svc'
  alias kl='kubectl logs'
  alias kv='kubectl describe'
  alias kpf='kubectl port-forward'
  alias kgc='kubectl config get-contexts'
  alias kuc='kubectl config use-context $(kubectl config get-contexts -o name | fzf)'
  alias kcc='kubectl config current-context'
  alias ks='k9s --readonly'
  alias ks-admin='k9s'
fi

alias l='ls -latGhFiT'

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias grep="grep -i"

alias gp='cd $(find  ~/projects -maxdepth 3 -type d | fzf)'
alias gl='git log --graph --oneline --decorate --all'
alias gb='git branch --list -a | sed "s/*\s//gi" | fzf'
alias gtl='git tag --list -n1 --sort=-v:refname | fzf'
alias gco='git checkout $(git branch -l | fzf)'
alias g='git'
alias gcb='g checkout -b'
alias gss='g status -s'
alias ga='g add'
alias gd='g diff'
alias gdca='g diff --cached'
alias gpush='git push --set-upstream origin $(git branch --show-current)'
alias gpull='git pull origin $(git branch --show-current)'
alias gc='g commit --signoff -m'
alias gignore='vim .git/info/exclude'

alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"

alias n='lima nerdctl'
alias mp='multipass'
alias db='devbox'

alias http-server='python -m http.server'

alias e='nvim'
alias r='nvim -R'
