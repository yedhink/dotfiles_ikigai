#!/bin/bash
if [ $@ -eq 0 ];then
	wal -n -f ~/dotfiles_ikigai/i3_hooked_on_a_feeling/.colors/walschemes/molokaiDark.json	
	pidof tmux > /dev/null
	if [ $? == 1 ]; then
		bash ~/dotfiles_ikigai/scripts/blah/scripts/bar & 
	fi
	xdo above -t 0x400063 "$(xdo id -a bar | head -n 1)"
	echo "dark" > ~/curtheme
	bash ~/dotfiles_ikigai/scripts/blah/tmco.sh
else
	wal -n -f ~/dotfiles_ikigai/i3_hooked_on_a_feeling/.colors/walschemes/pureWhite.json	
	pidof tmux > /dev/null
	if [ $? == 1 ]; then
		bash ~/dotfiles_ikigai/scripts/blah/scripts/bar & 
	fi
	xdo above -t 0x400063 "$(xdo id -a bar | tail -n 1)"
	echo "light" > ~/curtheme
	bash ~/dotfiles_ikigai/scripts/blah/tmco.sh
fi
sleep 1
xdo lower -a bar
