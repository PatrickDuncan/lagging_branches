#!/bin/bash

# Args
[ -z ${1} ] && BRANCH='master' || BRANCH=${1}
[ -z ${2} ] && REMOTE='origin' || REMOTE=${2}
[ -z ${3} ] && FETCH='no' || FETCH=${3}
REMOTE_BRANCH="remotes/${REMOTE}/${BRANCH}"

# Colours
BLUE='\033[1;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CLEAR='\033[0m'

start_msg() {
  printf "${YELLOW}Branches lagging behind "
  printf "${BLUE}${BRANCH}"
  printf " ${YELLOW}on "
  printf "${BLUE}${REMOTE}${YELLOW}:${CLEAR}\n\n"
}

display_branch() {
  branch=${1##*remotes/origin/}
  difference=${2}
  printf "%-30s ${RED}%s${CLEAR}\n" ${branch} ${difference}
}

display_lagging_branches() {
  git branch -a | grep remotes/$REMOTE |
  while read branch ; do
    # Skip remotes/origin/HEAD -> origin/master
    [[ ${branch} = *' '* ]] && continue
    # Get the number of commits between the branches
    difference=$(git rev-list ${branch}..${REMOTE_BRANCH} | wc -l)
    [ ${difference} -gt 0 ] && display_branch ${branch} ${difference}
  done
}

main() {
  start_msg
  [ ${FETCH} != 'no' ] && $(git fetch -pq $REMOTE)
  display_lagging_branches
}

main
