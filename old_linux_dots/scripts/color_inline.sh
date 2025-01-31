#!/usr/bin/env bash

# set colors

colors=($(xrdb -query | sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2))

f=3 b=4
for j in f b; do
    for i in {0..7}; do
		printf -v $j$i %b "\e[${!j}${i}m"
    done
done
t=$'\e[0m'


# output
tput cup 15 43;
cat << EOF
$f0▀▀▀▀▀▀▀$t   $f1▀▀▀▀▀▀▀$t   $f2▀▀▀▀▀▀▀$t   $f3▀▀▀▀▀▀▀$t
EOF
tput cup 18 43;
cat << EOF
$f4▀▀▀▀▀▀▀$t   $f5▀▀▀▀▀▀▀$t   $f6▀▀▀▀▀▀▀$t   $f7▀▀▀▀▀▀▀$t
EOF

tput cup 16 43;
for i in {0..3}; do 
	echo -en "\e[$((30+$i))m${colors[i]} \e[0m  "; 
done
tput cup 19 43;
for i in {4..7}; do 
	echo -en "\e[$((30+$i))m${colors[i]} \e[0m  "; 
done
echo
echo
