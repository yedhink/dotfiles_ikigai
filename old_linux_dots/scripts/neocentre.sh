#!/bin/bash

# Thanks to Brian Caffey
# https://github.com/briancaffey

# neofetch centered on terminal window:
printf "\n"
offset=$(( $(( $(tput cols)  / 2  ))  - 38  ))
n=$(( $offset > 0 ? $offset : 0 ));
neofetch | sed "s/^/$(head -c $n < /dev/zero | tr '\0' '\ ';)/"
printf "\n"
