#!/bin/sh

SNOW_MARKER="$HOME/.cache/xsnow"

letItSnow() {
	pcmanfm --desktop-off 
	xcompmgr.sh unset
	feh --bg-scale /usr/share/bento/background.jpg
	pidof xsnow || xsnow &
	touch "$SNOW_MARKER"
}

stopDaSnow() {
	killall xsnow
	killall feh
	pcmanfm --desktop &
	xcompmgr.sh set
	rm "$SNOW_MARKER"
}

checkDaSnow() {
	[ -f "$SNOW_MARKER" ] && letItSnow
}

toggleDaSnow() {
	if [ -f "$SNOW_MARKER" ]; then
		stopDaSnow;
	else
		letItSnow;
	fi	
}

on () { letItSnow; }
off () { stopDaSnow; }
restore () { checkDaSnow; }
toggle () { toggleDaSnow; }

"$@"

