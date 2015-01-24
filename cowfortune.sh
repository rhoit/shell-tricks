#!/bin/bash

#
# cowfortune
# cowsay with fortune

# for {zsh,bash} compatibility
# case implementation coz zsh-array index starts from 1

case $(($RANDOM%2)) in
	0) dialogue="say";;
	1) dialogue="think";;
esac

case $(($RANDOM%5)) in
	0) mascot="default";;
	1) mascot="elephant";;
	2) mascot="koala";;
	3) mascot="moose";;
	4) mascot="tux";;
esac

case $(($RANDOM%10)) in
	0) eye='oo';;
	1) eye='$$';;
	2) eye='zz';;
	3) eye='--';;
	4) eye='++';;
	5) eye='@@';;
	6) eye='uu';;
	7) eye='~~';;
	8) eye='..';;
	9) eye='xx';;

	10)eye='eə';;
	11)eye='••';;
	12)eye='☆☆';;
	13)eye='♥♥';;
	14)eye='»«';;
	15)eye='øø';;
esac

cow$dialogue -f $mascot -e $eye "$(fortune -s)"
