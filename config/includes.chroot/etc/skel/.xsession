#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# If the agent is not already running, start it
if [[ -z `pidof gpg-agent` ]]; then
		/usr/bin/gpg-agent --daemon --write-env-file "${HOME}/.gpg-agent-info" > /dev/null
	fi;

	#And then read info back
	eval $(cat $HOME/.gpg-agent-info)
	export GPG_AGENT_INFO
	echo UPDATESTARTUPTTY | gpg-connect-agent > /dev/null

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# if used with lxdm, slim, or nodm
# exec dbus-launch openbox-session &>~/.xsession-errors

# if used with lightdm
exec openbox-session &>~/.xsession-errors
