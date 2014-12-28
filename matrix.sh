#!/bin/bash

#
# Based on: [mat!rix] (c) 2011 -- [ BruXy ]
# http://bruxy.regnet.cz/web/linux/EN/matrix-sh/

function strain_flow {
    x=$[RANDOM%COLUMNS] y=$[RANDOM%LINES]
    for ((i=1; i < $LINES; i++)); do
        char=$(printf '\\0%o' $[RANDOM%26+97])
        echo -e "\e[$[i-1];${x}H\e[0;32m$char\e[$i;${x}H\e[1;37m"$c
        sleep 0.1
        if (( $i > $y )); then
            echo -e "\e[$[i-y];${x}H "
        fi
    done

    for ((i=i-y; i < $LINES; i++)); do
        echo -ne "\e[$i;${x}f "
        sleep 0.1
    done
}

function neat_terminate {
    tput cnorm # show cursor
    stty echo # enable output
    tput cup $LINES 0
    exit
}

tput civis # hide cursor
stty -echo # disable output
clear

LINES=$(tput lines)
COLUMNS=$(tput cols)

trap "neat_terminate 0; exit" INT #handle INT signal

while true; do
    strain_flow &
    sleep 0.05
done
