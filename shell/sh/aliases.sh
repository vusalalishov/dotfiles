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
fi

alias l='ls -latGhFi'

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias grep="grep -i"

alias kgc='kubectl config get-contexts'
alias kuc='kubectl config use-context'
alias kcc='kubectl config current-context'

alias gp='cd $(find  ~/projects -maxdepth 2 -type d | fzf)'
alias gl='git log --graph --oneline --decorate --all'
alias gb='git branch --list -a | sed "s/*\s//gi" | fzf'
alias gtl='git tag --sort=v:refname'
alias gco='git checkout $(git branch -l | fzf)'
alias g='git'
alias gcb='g checkout -b'
alias gss='g status -s'
alias ga='g add'
alias gd='g diff'
alias gdca='g diff --cached'
alias gpush='git push --set-upstream origin $(git branch --show-current)'
alias gpull='git pull origin $(git branch --show-current)'
alias gcomm='g commit --signoff -m'
