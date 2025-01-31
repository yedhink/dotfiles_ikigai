#!/bin/bash

# well run it and look at the top-right corner :D
battery=/sys/class/power_supply/BAT0
b_full=$battery/energy_full
b_now=$battery/energy_now
bf=`cat $b_full`
bn=`cat $b_now`
charge=`printf $(( "100 * $bn / $bf" ))`

case 1 in
  $(($charge <= 15)))
    color='31'
    ;;
  *)
    color='32'
    ;;
esac
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-11));printf "   \e[0;${color}m%-4s \e[1;${color}m%-5s %-25s \n" " bat" "$charge%";tput rc;done &

