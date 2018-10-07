#!/bin/bash
#import utility functions
. lib/util.sh

## declare list of software to be installed
declare -a software=(
#"powertop" 
"curl"
"git"
"nvim" #neovim
"i3"
"i3blocks"
"firefox"
)

## now loop through the above array
for i in "${software[@]}"
do
	if ! isInstalled $i; then
		echo "$i is not installed"
	fi
done

# check if laptop-mode-tools is installed
if ! [[ $(cat /proc/sys/vm/laptop_mode) -gt 0 ]]; then
	echo "laptop-mode-tools is not installed"
fi
