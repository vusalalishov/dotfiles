set -o vi
. /usr/local/opt/asdf/libexec/asdf.sh
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000000}]}' >/dev/null 2>&1

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in command history and execute selected command
fh() {
  local command
  command=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
  print -s "$command"
  eval "$command"
}

grr() {
  local remote_branch 
  remote_branch=$(git branch -r | fzf)
  if [[ -n "${remote_branch// }" ]]
  then
    local command
    command="git checkout -b $1 --track $remote_branch"
    echo $command
    eval "$command"
  else
    echo "The branch name is empty!"
  fi
}

gct() {
  local tag
  tag=$(git tag --list | fzf)
  if [[ -n "${tag// }" ]]
  then
    local command
    command="git checkout tags/$tag -b v$tag"
    print -s "$command"
    echo $command
    eval "$command"
  else
    echo "The tag name is empty!"
  fi
}

gcr() {
  local branch
  local new_name
  new_name=$1
  branch=$(git branch -r | fzf)
  branch="${branch// }"
  if [[ -n $branch ]]
  then
    local command
    command="git checkout -b $new_name --track $branch"
    print -s "$command"
    echo $command
    eval "$command"
  else
    echo "The branch name is empty!"
  fi
}

can-i-oncall() {
    for s in $(kubectl config get-contexts -o=name| grep oncall);
    do
        echo -n "$s ... ";
        if kubectl --context="$s" cluster-info > /dev/null 2>/dev/null; then
            echo "✅";
        else
            echo "🚫";
        fi
    done || exit 1
}


function gcm() {
  git_branch=$(git branch --show-current)
  if [[ $git_branch =~ '(feat|fix)/(OPEN)-([0-9]*).*' ]] then
    local message
    local prefix
    prefix="$match[1][$match[2]-$match[3]] -"
    echo -n "$prefix "
    read message
    git commit --signoff -m "$prefix $message"
  else
    echo "Unable to derive the commit prefix from $git_branch"
  fi
}

function dlink() {
  git fetch -t
  tag_from=$(git tag --list | fzf)
  tag_to=$(git tag --list | fzf)
  remote=$(git remote show origin | grep push)
  if [[ $remote =~ 'git@([a-zA-Z0-9.\-]*):([a-zA-Z0-9.\-]*)/([a-zA-Z0-9.\-]*).git' ]]; then
    local url
    url="https://$match[1]/$match[2]/$match[3]/-/compare/$tag_from...$tag_to"
    echo -n $url | pbcopy
    echo $url
  else
    echo "Can't parse remote: $remote"
  fi
}

function mr() {
  
}
