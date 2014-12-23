#!/bin/bash

#
# Based on: mandelbrot:fixed_point @ 2010 -- [BruXy]
# http://bruxy.regnet.cz/web/linux/EN/mandelbrot-set-in-bash/
#

COLUMNS=$(tput cols)
HLINES=$(($(tput lines)/2))
tmp=/tmp/m$$
I=-16384

for ((y=$HLINES; y >= 0; y--)); do
    R=-32768
    for ((x=$COLUMNS; x > 0; x--)); do
        B=0 i=0 j=0 r=0 s=0
        while (( B++ < 32 )) && (( s * j < 1073741824 )); do
            let j="i * i >> 14"
            let s="r * r >> 14"
            let t="s - j + R"
            let i="( (r * i) >> 13) - I"
            let r=t
        done
        if (( B > 32 )); then echo -n " "
        else echo -ne "\E[01;$(((B+4)%8+30))mX"; fi
        let R="R + 512"
    done
    echo -ne "\E[m\E(\r\n"
    let I="I + 1311"
done | tee $tmp

head -n $HLINES $tmp | tac
