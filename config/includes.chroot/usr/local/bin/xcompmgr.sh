#!/bin/bash

XCP_CONFIG="$HOME/.config/xcompmgr"

run() {
	killall xcompmgr 2>/dev/null
	echo "$1" > "$XCP_CONFIG"
	xcompmgr "$1" &
}

case "$1" in
	"unset")
		killall xcompmgr
		rm "$XCP_CONFIG"
		;;
	"set")
		killall xsnow
		run
		pcmanfm --desktop
				;;
	"setshaded")
		killall xsnow
		run "-CfF"
		pcmanfm --desktop
		;;
	"setshadowshade")
		killall xsnow
		run "-CcfF"
		pcmanfm --desktop
		;;
	"restore")
		if [ -f "$XCP_CONFIG" ]; then
			XCP_ARG=$(cat "$XCP_CONFIG")
			killall xcompmgr 2>/dev/null
			xcompmgr "$XCP_ARG" &
		fi
		;;
	*)
		echo "This script accepts the following arguments: set, unset, setshaded, setshadowshade, restore"

esac

