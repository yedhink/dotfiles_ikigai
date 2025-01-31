#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

# Prompt for the legends
PS1='\[\e[0;32m\]mighty \[\e[0;36m\]ϟϟϟ \[\e[0;32m\]root ⟶ \[\e[0;37m\]'

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac
if (( $UID == 0 )); then
	if [[ $TERM == rxvt* ]]; then
		clear;
		cat /home/${USER}/dotfiles_ikigai/scripts/suTXT | figlet -f ~/dotfiles_ikigai/3d.flf -w 180 -p -W | nms | lolcat 
		echo
	else
		clear;
		cat /home/${USER}/dotfiles_ikigai/scripts/suTXT | figlet -f ~/dotfiles_ikigai/3d.flf -w 200 -p -W | nms | lolcat 
		echo
	fi	
fi
[
