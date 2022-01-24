thefuck --alias | source 
fish_vi_key_bindings

set fish_greeting

### PROMPT ###
starship init fish | source

### FUNCTIONS ###

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end


function mkcd
  mkdir $argv
  and cd $argv
end

### END OF FUNCTIONS ###


### ALIASES ###

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Emacs
alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"

# Changing "ls" to "exa"
alias la='exa -al --color=always --group-directories-first' # my preferred listing
alias ls='exa -a --icons --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# pacman and paru
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages
alias pacfind="pacman -Slq | fzf --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias pacdelete="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns" # fzf delete package
alias parufind="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"


# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# youtube-dl
alias yta="youtube-dl --extract-audio -o '~/Syncthing/Music/%(title)s.%(ext)s' --audio-format mp3 " 
alias ytb="youtube-dl -f bestvideo+bestaudio -o '~/Videos/%(title)s.%(ext)s' "

# git bare
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ssh="kitty +kitten ssh"

# Extraction
function extract -d "extract files from archives"
    # no arguments, write usage
    if test (count $argv) -eq 0
        echo "Usage: extract [-option] [file ...]\n Options:\n -r, --remove    Remove archive after unpacking." >&2
        exit 1
    end

    # If -r, remove file after extraction     
    set remove_file 0
    if test $argv[1] = "-r"; or test $argv[1] = "--remove"
        set remove_file 1
        set --erase argv[1]
    end

    for i in $argv[1..-1]

        # Check if file is valid
        if test ! -f $i
            echo "extract: '$i' is not a valid file" >&2
            continue
        end

        set success 0
        set extension (string match -r ".*(\.[^\.]*)\$" $i)[2]

        switch $extension
            case '*.tar.gz' '*.tgz'
                tar xv; or tar zxvf "$i"
            case '*.tar.bz2' '*.tbz' '*.tbz2'
                tar xvjf "$i"
            case '*.tar.xz' '*.txz'
                tar --xz -xvf "$i"; or xzcat "$i" | tar xvf -
            case '*.tar.zma' '*.tlz'
                tar --lzma -xvf "$i"; or lzcat "$i" | tar xvf -
            case '*.tar'
                tar xvf "$i"
            case '*.gz'
                gunzip -k "$i"
            case '*.bz2'
                bunzip2 "$i"
            case '*.xz'
                unxz "$i"
            case '*.lzma'
                unlzma "$i"
            case '*.z'
                uncompress "$i"
            case '*.zip' '*.war' '*.jar' '*.sublime-package' '*.ipsw' '*.xpi' '*.apk' '*.aar' '*.whl'
                set extract_dir (string match -r "(.*)\.[^\.]*\$" $i)[2]
                unzip "$i" -d $extract_dir
            case '*.rar'
                unrar x -ad "$i"
            case '*.7z'
                7za x "$i"
            case '*'
                echo "extract: '$i' cannot be extracted" >&2
                set success 1
        end

        if test $success -eq 0; and test $remove_file -eq 1
            rm $i
        end
    end
end
