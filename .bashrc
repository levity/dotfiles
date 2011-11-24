[[ -s "/Users/lawrence/.rvm/scripts/rvm" ]] && source "/Users/lawrence/.rvm/scripts/rvm"

# render color codes correctly
export LESS=-R

shopt -s histverify
shopt -s histappend
export PROMPT_COMMAND='history -a'

# remove trivial stuff from history
export HISTIGNORE="&:ls:[bf]g:exit"

# use textmate as default editor
export EDITOR="mate -w"

alias c="bc -ql"
alias s="sudo"
alias li="ssh levityisland.com"

# simple echo mail server
alias debug_smtpd="sudo /usr/lib/python2.5/smtpd.py -n -c DebuggingServer localhost:25"

alias whatismyip="echo \`curl -s www.levityisland.com/whatismyip.php\`"
alias biggest="find . -type f -print0|xargs -0 du -k|sort -n|tail"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function makeprompt {
  local black_green="\[\033[30m\]\[\033[42m\]"
  local black_white="\[\033[30m\]\[\033[47m\]"
  local black_yellow="\[\033[30m\]\[\033[43m\]"
  local black_skyblue="\[\033[30m\]\[\033[46m\]"
  local white_blue="\[\033[37m\]\[\033[44m\]"
  local red_black="\[\033[31m\]\[\033[40m\]"
  local white_black="\[\033[37m\]\[\033[40m\]"
  local whitebold_black="\[\033[1;37m\]\[\033[40m\]"

  local skyblue="\[\033[36m\]"
  local red="\[\033[31m\]"
  local blackbold="\[\033[1;32m\]"
  local green="\[\033[32m\]"
  local normal="\[\033[0m\]"

  PS1="$red_black\t$normal \w\$(parse_git_branch) $normal\$ "
}

makeprompt 

function tmuxcolors {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

