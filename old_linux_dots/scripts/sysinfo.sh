#!/bin/sh

#  ______  __                       __          __    __                  __   __
# /\__  _\/\ \                     /\ \        /\ \  /\ \                /\ \ /\ \
# \/_/\ \/\ \ \___      __      ___\ \ \/'\    \ `\`\\/'/ ___   __  __   \ `\`\/'/'     __   _ __   ___
#    \ \ \ \ \  _ `\  /'__`\  /' _ `\ \ , <     `\ `\ /' / __`\/\ \/\ \   `\/ > <     /'__`\/\`'__\/ __`\
#     \ \ \ \ \ \ \ \/\ \L\.\_/\ \/\ \ \ \\`\     `\ \ \/\ \L\ \ \ \_\ \     \/'/\`\ /\  __/\ \ \//\ \L\ \
#      \ \_\ \ \_\ \_\ \__/.\_\ \_\ \_\ \_\ \_\     \ \_\ \____/\ \____/     /\_\\ \_\ \____\\ \_\\ \____/
#       \/_/  \/_/\/_/\/__/\/_/\/_/\/_/\/_/\/_/      \/_/\/___/  \/___/      \/_/ \/_/\/____/ \/_/ \/___/
# 
# 
#    ######  ##    ##  ######  ######## ######## ##     ##    #### ##    ## ########  #######
#   ##    ##  ##  ##  ##    ##    ##    ##       ###   ###     ##  ###   ## ##       ##     ##
#   ##         ####   ##          ##    ##       #### ####     ##  ####  ## ##       ##     ##
#    ######     ##     ######     ##    ######   ## ### ##     ##  ## ## ## ######   ##     ##
#         ##    ##          ##    ##    ##       ##     ##     ##  ##  #### ##       ##     ##
#   ##    ##    ##    ##    ##    ##    ##       ##     ##     ##  ##   ### ##       ##     ##
#    ######     ##     ######     ##    ######## ##     ##    #### ##    ## ##        #######
# 
# 
#      Modified by:
#                ikigai 
#                https://github.com/yedhink
#
#   => This script is a modification of Xero's "sysinfo"
#   => Output the required system info, along with some other animations onto your terminal


#█▓▒░ vars
FULL=━
EMPTY=┄
((i=1))

name=$USER
host=`hostname`
distro="arch linux"
kernel=`uname -r`
wm=`wmctrl -m | grep -i name | awk '{print $2}'`
battery=/sys/class/power_supply/BAT0
pkgs=`pacman -Qqs | wc -l`

#█▓▒░ progress bar
draw()
{
  perc=$1
  size=$2
  inc=$(( perc * size / 100 ))
  out=
  if [ -z $3 ]
  then
    color="36"
  else
    color="$3"
  fi 
  for v in `seq 0 $(( size - 1 ))`; do
    test "$v" -le "$inc"   \
    && out="${out}\e[1;${color}m${FULL}" \
    || out="${out}\e[0;${color}m${EMPTY}"
  done
  tput cup $i 54;printf $out
}

clear;echo -e "\n";tput cup 2 0;cat ~/dotfiles_ikigai/scripts/indian_neo;

#█▓▒░ greets
#(( i=i+1 ));tput cup $i 51;printf " \e[0m  hello \e[36m$name\033[0m, i'm \e[34m$host\n"
(( i=i+1 ));tput cup $i 42;printf " With Great Scripts Comes Great Responsibility" | lolcat -a -d 30 
(( i=i+1 ));tput cup $i 40;printf " \e[0m\n"

#█▓▒░ environment
(( i=i+1 ));tput cup $i 36;printf " \e[1;33m      distro";tput cup $i 53;printf " \e[0m$distro\n";sleep 0.1
(( i=i+1 ));tput cup $i 36;printf " \e[1;33m      kernel";tput cup $i 53;printf " \e[0m$kernel\n";sleep 0.1
(( i=i+1 ));tput cup $i 38;printf " \e[1;33m    packages";tput cup $i 53;printf " \e[0m$pkgs\n";sleep 0.1
(( i=i+1 ));tput cup $i 32;printf " \e[1;33m          wm";tput cup $i 52;printf "  \e[0m$wm\n";sleep 0.1
#(( i=i+1 ));tput cup $i 50;printf " \e[1;33m        font \e[0m$font\n"
#(( i=i+1 ));tput cup $i 50;printf " \e[1;33m      colors \e[0m$colors\n"
(( i=i+1 ));tput cup $i 36;printf " \e[0m\n"

#█▓▒░ cpu
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
(( i=i+1 ));tput cup $i 39;
c_lvl=`printf "%.0f" $cpu`
tput cup $i 39;printf "   \e[0;36m%-4s \e[1;36m%-5s %-25s \n" " cpu" "$c_lvl%" `draw $c_lvl 15` ;sleep 0.2

#█▓▒░ ram
ram=`free | awk '/Mem:/ {print int($3/$2 * 100.0)}'`
(( i=i+1 ));tput cup $i 39;printf "   \e[0;36m%-4s \e[1;36m%-5s %-25s \n" " ram" "$ram%" `draw $ram 15` ;sleep 0.2



#█▓▒░ volume
vol=`amixer get Master | awk '/Front/ {print $5}' | tail -2 | cut -b 2-3 | paste -sd+ - | bc | (read volm;(( volm=volm/2 ));echo $volm)`
if amixer get Master | grep -q '\[off\]' 
then
  color='31'
else
  color='36'
fi
(( i=i+1 ));tput cup $i 39;printf "   \e[0;${color}m%-4s \e[1;${color}m%-5s %-25s \n" " vol" "$vol%" `draw $vol 15 $color` ;sleep 0.2

#█▓▒░ battery
b_full=$battery/energy_full
b_now=$battery/energy_now
bf=`cat $b_full`
bn=`cat $b_now`
(( i=i+1 ));tput cup $i 39;
charge=`printf $(( "100 * $bn / $bf" - 3 ))`;sleep 0.2

case 1 in
  $(($charge <= 15)))
    color='31'
    ;;
  *)
    color='32'
    ;;
esac
printf "   \e[0;${color}m%-4s \e[1;${color}m%-5s %-25s \n" " bat" "$charge%" `draw $charge 15 $color`;sleep 0.2


#█▓▒░ temperature
temp=`sensors | awk '/Core\ 0/ {gsub(/\+/,"",$3); gsub(/\..+/,"",$3)    ; print $3}'`
case 1 in
  $(($temp <= 50)))
    color='32'
    ;;
  $(($temp >= 75)))
    color='31'
    ;;
  *)
    color='36'
    ;;
esac
(( i=i+1 ));tput cup $i 40;printf "   \e[0;${color}m%-4s \e[1;${color}m%-5s %-25s \n\n" "temp" "$temp°c " `draw $temp 15 $color`;sleep 0.2

#█▓▒░ colors
printf "\n"
sleep 5;
bash ~/dotfiles/scripts/color_inline.sh
tput cup 22 0; # set cursor at required position
