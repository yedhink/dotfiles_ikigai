#!/bin/bash
if [ -z $(pidof ncmpcpp) ]; then
	lyr=`ls -t ~/.lyrics/ | head -n 1`
	urxvt -e bash -ci vim -c Limelight -c Goyo "$lyr"
fi
