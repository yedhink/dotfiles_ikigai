#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

source ~/.fonts/*.sh

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi



# set the default terminal
TERM=rxvt-unicode-256color
export TERM
# set dafault TE
export VISUAL=vim
export EDITOR="$VISUAL"
# pip path
export PATH="${PATH}:${HOME}/.local/bin/"
# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend
# making alias global
export BASH_ENV="/home/${USER}/.bash_aliases"
# show our prompt
PROMPT_COMMAND="gitprompt"

# helpful when using more than one terminal 
function _update_ps1() {
	# X Terminal titles
	case "$TERM" in
		xterm*|rxvt*)
			PROMPT_COMMAND="gitprompt"
			;;
		st*)	
			PS1=$(powerline-shell $?)
			;;
		*)
			;;
	esac
}

# Function to move to windows partition for work
function movetoworkplace() {
	cd /mnt/work/lz/java_tests/
	cd "$1"
}

# Function to gradient wallpaper 
function gw() {
	col1=$(echo "#""$2")
	col2=$(echo "#""$3")
	if [ $# -eq 4 ]
	then
		col3=$(echo "#""$4")
		hsetroot -add "$col1" -add "$col2" -add "$col3" -gradient $1
	else
		hsetroot -add "$col1" -add "$col2" -gradient $1
	fi
}

# Function to copy pic(s) to wall 
function yp() {
	cp -r "$@" ~/Pictures/.wall
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

fi

PATH="/home/ikigai/${PATH:+:${PATH}}"; export PATH;
PATH="/home/ikigai/perl5/bin${PATH:+:${PATH}}"; export PATH;
PATH="/home/ikigai/.gem/ruby/2.5.0/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ikigai/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ikigai/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ikigai/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ikigai/perl5"; export PERL_MM_OPT;

# go back to previous dir
b() {
	str=""
	count=0
	while [ "$count" -lt "$1" ];
	do
		str=$str"../"
		let count=count+1
	done
	cd $str
}

# for color ls
source $(dirname $(gem which colorls))/tab_complete.sh

# # # # # # # # # # # #
# bashed-on-a-feeling #
# # # # # # # # # # # #

# git prompt will be shown only when you move to a git dir
gitprompt(){
	git status &> /dev/null
	if [ "$?" == 0 ];then
		declare -i cno=0
		source /home/${USER}/.bashed-gitprompt.sh
	else
		export PS1='\[\e[0;31m\]♥ \e[0;31m\]\W \[\e[1;33m\]\$\[\e[0m\] '
		gbranch=""
	fi
}

PROMPT_COMMAND="gitprompt"
