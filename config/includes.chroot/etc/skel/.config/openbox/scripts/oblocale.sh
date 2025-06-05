#!/bin/sh

cd ~/.config/openbox

display_item()
{
	printf '<item label="%s"><action name="Execute"><command>sh ~/.config/openbox/scripts/oblocale.sh %s</command></action></item>\n' $1 $2
}

list()
{
	echo '<openbox_pipe_menu xmlns="http://openbox.org/"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  xsi:schemaLocation="http://openbox.org/  file:///usr/share/openbox/menu.xsd">'

	for i in `ls lang/rc*`; do
		lang=`echo "$i" | cut -f 2 -d "-"`
		case $lang in
			"en")
				display_item "English" $lang
				;;
			"fr")
				display_item "Français" $lang 
				;;
			"de")
				display_item "Deutch" $lang 
				;;
		esac
	done
	echo "</openbox_pipe_menu>"
}

link() {
	echo lang/autostart-$1 autostart
	ln -fs lang/autostart-$1 autostart
	ln -fs lang/menu.xml-$1  menu.xml
	ln -fs lang/rc.xml-$1    rc.xml

	openbox --reconfigure
}

if [ "$1" = "list" ]; then
	list;
elif [ ! "z$1" = "z" ]; then
	link $1
fi
