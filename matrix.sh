#!/bin/bash

#
# [mat!rix] (c) 2011 -- [ BruXy ]
# http://bruxy.regnet.cz/web/linux/EN/matrix-sh/

function strain_flow {
    x=$[RANDOM%COLUMNS] y=$[RANDOM%LINES]
    for ((i=1; i < $LINES; i++)); do
        c=$(printf '\\0%o' $[RANDOM%26+97])
        echo -e "\033[$[i-1];${x}H\033[32m$c\033[$i;${x}H\033[37m"$c
        sleep 0.1
        if (( $i > $y )); then
            echo -e "\033[$[i-y];${x}H "
        fi
    done

    for ((i=i-y; i < $LINES; i++)); do
        echo -ne "\033[$i;${x}f "
        sleep 0.1
    done
}

function neat_terminate {
	tput cnorm # show cursor
	stty echo # enable output
	tput cup $LINES 0
}

# echo -e "\e[1;40m"
echo -e "\033[2J\033[?25l"
LINES=$(tput lines)
COLUMNS=$(tput cols)

trap "neat_terminate 0; exit" INT #handle INT signal

while true; do
    strain_flow &
    sleep 0.05
done
