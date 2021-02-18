#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### SET VI MODE IN BASH SHELL
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'


xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


### ALIASES ###

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'


# Changing "ls" to "exa"
alias la='exa -al --color=always --group-directories-first' # my preferred listing
alias ls='exa -a --icons --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# confirm before overwriting something
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# navigation
alias ..='cd ..'
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
alias vim="nvim"
alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"

# youtube-dl
alias yta="youtube-dl --extract-audio -o '~/Music/%(title)s.%(ext)s' --audio-format mp3 " 
alias ytb="youtube-dl -f bestvideo+bestaudio -o '~/Videos/%(title)s.%(ext)s' "

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"


### SHOPT
shopt -s autocd # Auto cd
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# mail
alias mail="neomutt"
alias mailsync="mw -Y"

# rss
alias rss="newsboat"

# git bare
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 



### OTHER STUFF ###

# Ignore repeated commands in history
export HISTCONTROL=ignoreboth

# Powerline
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi


## COMPLETION
set colored-stats on
set completion-ignore-case on
# Only need a single tab press to show results
set show-all-if-ambiguous on
# You ever do that thing where you put your cursorright in the middle of a word,
# like you're at the "e" in "Makefile", and hit tab, and bash oh-so-helpfully
# inserts the latter half of the word right in the middle of it -- so you've
# got "Makefilefile" sitting in your terminal?
# Yeah fuck that
set skip-completed-text on

eval "$(thefuck --alias)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
