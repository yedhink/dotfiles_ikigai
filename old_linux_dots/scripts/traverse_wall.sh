#!/bin/bash

# Change desktop wallpaper automatically without repetition
# randomizing with feh resulted in repetition. Thus this script! (o_o)
filename_array=( $( ls ~/Pictures/.wall/ | sort --random-sort ) ) 
for file in "${filename_array[@]}";do
	feh --bg-fill ~/Pictures/.wall/"$file"
	sleep 5m
done
