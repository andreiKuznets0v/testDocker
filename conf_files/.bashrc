# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#------------------------------------------////
# Some original crunchbang .bashrc contents:
#------------------------------------------////

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#------------------------------------------////
# Aliases:
#------------------------------------------////

## Sudo fixes
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
alias t='tmux attach || tmux new'

# This file was made to clean up .CBBash
     
#---------------------------------------------#
#             [ Simple Aliases ]              #
#---------------------------------------------#
alias l='ls -CF'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
#alias rm='mv -t ~/.local/share/Trash/files'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -h -c'
alias reload='source ~/.bashrc'
alias c="clear"
alias trash="rm -fr ~/.Trash"
alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'
     
#---------------------------------------------#
#           [ Directory Aliaes ]              #
#---------------------------------------------#
alias back='cd $OLDPWD'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias disk="cd /"
alias documents='cd ~/Documents'
alias downloads='cd ~/Téléchargements'
alias images='cd ~/Images'

alias localhost='cd /var/www'
    
#---------------------------------------------#
#                 [ App Aliases ]             #
#---------------------------------------------#
alias nano='nano -W -m'
alias music='ncmpcpp'
alias ftp='ncftp Personal'
alias wget='wget -c'
alias scrot='scrot -c -d 7'
   
#---------------------------------------------#
#               [ Script Aliases ]            #
#---------------------------------------------#
alias show-info='~/.bin/info.pl'
alias show-colors='~/.bin/colors.sh'
   
#---------------------------------------------#
#                 [ SUDO Aliases ]            #
#---------------------------------------------#
    
#---------------------------------------------#
#                 [ Dev Aliases ]             #
#---------------------------------------------#
alias restart-httpd='sudo service restart httpd'
alias apache='sudo service apache2 restart'    
#---------------------------------------------#
#                 [ Misc ]                    #
#---------------------------------------------#
alias edit='vim'


#------------------------------------------////
# Proxy:
#------------------------------------------////
#Setting Proxy Environment Variable  
#export http_proxy="http://username:password@my.proxy.address:8080/" 

#------------------------------------------////
# Custom Vars:
#------------------------------------------////
export PRODUCTION="$HOME/myChefFirst/ansible/inventories/production/rainvest-all.yaml"
export STAGING="$HOME/myChefFirst/ansible/inventories/staging/rainvest-dev-all.yaml"
export ANSIBLE_LOG_PATH=/tmp/ansible_out_`date +%Y%m%d%H%M%S`.log

#------------------------------------------////
# Go Variables:
#------------------------------------------////
export GOPATH=$HOME/.golanghome
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
#------------------------------------------////
# Colors:
#------------------------------------------////
black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

#------------------------------------------////
# Functions and Scripts:
#------------------------------------------////
upinfo ()
{
echo -ne "\t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

# This file was made to clean up .CBBash

# [Functions]

# [ About ]
function about()
{
clear
echo -ne "		[*] Ubuntu Bash Script v.1.0"
echo -e ""
echo -ne "		[*] Author : Alexis DUQUE"
echo -e ""
echo -ne "		[*] EMail : alexisd61@gmail.com"
echo -e ""
echo -e ""
}

# [ Encryption/Decryption ]
function encrypt()
{
gpg -ac -no-options "$1"
}
    
function decrypt()
{
gpg -no-options "$1"
}
     
# [ Extraction ]
function extract()
{
if [ -f $1 ] ; then
case $1 in
*tar.bz2)   tar xvjf $1     ;;
*.tar.gz)    tar xvzf $1     ;;
*.bz2)       bunzip2 $1      ;;
*.rar)       unrar x $1      ;;
*.gz)        gunzip $1       ;;
*.tar)       tar xvf $1      ;;
*.tbz2)      tar xvjf $1     ;;
*.tgz)       tar xvzf $1     ;;
*.zip)       unzip $1        ;;
*.Z)         uncompress $1   ;;
*.7z)        7z x $1         ;;
*)           echo "'$1' cannot be extracted via >extract<" ;;
esac
else
echo "'$1' is not a valid file!"
fi
}
     
# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
     
# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }
     
# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}
     
function mydf()         # Pretty-print of 'df' output.
{                       # Inspired by 'dfc' utility.
for fs ; do     
if [ ! -d $fs ]
then
echo -e $fs" :No such file or directory" ; continue
fi
     
local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
local free=( $(command df -Pkh $fs | awk 'END{ print $4 }') )
local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
local out="["
for ((j=0;j<20;j++)); do
if [ ${j} -lt ${nbstars} ]; then
out=$out"*"
else
out=$out"-"
fi
done
out=${info[2]}" "$out"] ("$free" free on "$fs")"
echo -e $out
done
}
     
function my_ip() # Get IP adress on ethernet.
{
MY_IP=$(/sbin/ifconfig wlan0 | awk '/inet/ { print $2 } ' |
sed -e s/addr://)
echo ${MY_IP:-"Not connected"}
}
     
function ii()   # Get current host related info.
{
echo -e "\nYou are logged on ${BRed}$HOST"
echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
echo -e "\n${BRed}Users logged on:$NC " ; w -hs | cut -d " " -f1 | sort | uniq
echo -e "\n${BRed}Current date :$NC " ; date
echo -e "\n${BRed}Machine stats :$NC " ; uptime
echo -e "\n${BRed}Memory stats :$NC " ; free
echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
echo -e "\n${BRed}Local IP Address :$NC" ; my_ip
echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
echo
}    

export MARKPATH=$HOME/.marks

function jump()
{ 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function mark()
{ 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}

function unmark() 
{ 
    rm -i "$MARKPATH/$1"
}

function marks()
{
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function completemarks() 
{
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

#------------------------------------------////
# Prompt:
#------------------------------------------////
PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\](\[\033[01;34m\]\w\[\033[00;34m\])\[\033[01;32m\]:\[\033[00m\]'

#------------------------------------------////
# System Information:
#------------------------------------------////
clear
echo -e "${LIGHTGRAY}";figlet "Hi $USER !";
echo -ne "${red}Today is:\t\t${cyan}" `date`; echo ""
echo -e "${red}Kernel Information: \t${cyan}" `uname -smr`
echo -ne "${red}Uptime is: \t${cyan}";upinfo;echo ""
#echo -e "${cyan}"; cal -3
