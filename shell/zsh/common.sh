set -o vi
set -o HIST_IGNORE_DUPS
. /opt/homebrew/Cellar/asdf/0.11.3/libexec/asdf.sh

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
    local command
    command='git commit --signoff -m "'$prefix' '$message'"'
    print -s $command
    eval $command
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
    url="https://$match[1]/$match[2]/$match[3]/-/compare/$tag_from...$tag_to?straight=true"
    echo -n $url | pbcopy
    echo $url
  else
    echo "Can't parse remote: $remote"
  fi
}

function mr() {
  
}

function for-each() {
  local items
  items=$(pbpaste)
  for num (${(f)items}) echo $num
}





# do nothing if fzf is not installed
(( ! $+commands[fzf] )) && return

# Bind for fzf history search
(( ! ${+ZSH_FZF_HISTORY_SEARCH_BIND} )) &&
typeset -g ZSH_FZF_HISTORY_SEARCH_BIND='^r'

# Args for fzf
(( ! ${+ZSH_FZF_HISTORY_SEARCH_FZF_ARGS} )) &&
typeset -g ZSH_FZF_HISTORY_SEARCH_FZF_ARGS='+s +m -x -e --preview-window=hidden'

# Extra args for fzf
(( ! ${+ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS} )) &&
typeset -g ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS=''

# Cursor to end-of-line
(( ! ${+ZSH_FZF_HISTORY_SEARCH_END_OF_LINE} )) &&
typeset -g ZSH_FZF_HISTORY_SEARCH_END_OF_LINE=''

# Include event numbers
(( ! ${+ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS} )) &&
typeset -g ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=1

# Include full date timestamps in ISO8601 `yyyy-mm-dd hh:mm' format
(( ! ${+ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH} )) &&
typeset -g ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=1

# Remove duplicate entries in history
(( ! ${+ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES} )) &&
typeset -g ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=''

fzf_history_search() {
  setopt extendedglob

  FC_ARGS="-l"
  CANDIDATE_LEADING_FIELDS=2

  if (( ! $ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS )); then
    FC_ARGS+=" -n"
    ((CANDIDATE_LEADING_FIELDS--))
  fi

  if (( $ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH )); then
    FC_ARGS+=" -i"
    ((CANDIDATE_LEADING_FIELDS+=2))
  fi

  history_cmd="fc ${=FC_ARGS} -1 0"

  if [ -n "${ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES}" ];then
    if (( $+commands[awk] )); then
      history_cmd="$history_cmd | awk '!seen[\$0]++'"
    else
      # In case awk is not installed fallback to uniq. It will only remove commands that are repeated consecutively.
      history_cmd="$history_cmd | uniq"
    fi
  fi

  candidates=(${(f)"$(eval $history_cmd | fzf ${=ZSH_FZF_HISTORY_SEARCH_FZF_ARGS} ${=ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS} -q "$BUFFER")"})
  local ret=$?
  if [ -n "$candidates" ]; then
    if (( ! $CANDIDATE_LEADING_FIELDS == 1 )); then
      BUFFER="${candidates[@]/(#m)[0-9 \-\:]##/${${(As: :)MATCH}[${CANDIDATE_LEADING_FIELDS},-1]}}"
    else
      BUFFER="${candidates[@]}"
    fi
    BUFFER=$(printf "${BUFFER[@]//\\\\n/\\\\\\n}")
    zle vi-fetch-history -n $BUFFER
    if [ -n "${ZSH_FZF_HISTORY_SEARCH_END_OF_LINE}" ]; then
      zle end-of-line
    fi
  fi
  zle reset-prompt
  return $ret
}

autoload fzf_history_search
zle -N fzf_history_search

bindkey $ZSH_FZF_HISTORY_SEARCH_BIND fzf_history_search
