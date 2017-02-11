# Script that takes all dolphin windows,
# puts them into the current workspace
# and activates them
# Note: Change the shortcut on line 30
# to your default terminal keybinding
# (usually ctrl+alt+t)

while getopts a: option
do
        case "${option}"
        in
                a) APPNAME=$OPTARG;;
        esac
done

# Get all pidgen windows
WIDs=$(xdotool search --class $APPNAME)
# Get current desktop
DN=$(xdotool get_desktop)
# Get id of active window
ACT=$(xdotool getactivewindow)

# flag that indicates that any dolphin is
# an active window
ANYACTIVE=0

# first loop to determine whether any
# terminal is active
for WID in $WIDs:
do
	# Strip WID from ":" symbol at the end of the string
	WID="${WID//[:]}"
	# Check whether the output is empty
	# if it's empty that means there're no terminal windows opened
	if [ -z "$WID" ]; then
		# echo stuff
		# So open terminal
		# xdotool key super+t
		/home/ishovkun/apps/Franz/Franz
		ANYACTIVE=1
		break
	fi
	# found an active window
	if [ $ACT -eq $WID ]; then
		ANYACTIVE=1
	fi
done


# Second loop through to gather and raise/minimize
# all terminal windows
for WID in $WIDs:
do
	# Strip WID from ":" symbol at the end of the string
	WID="${WID//[:]}"
	if [ $ANYACTIVE -ne 1 ]; then
		xdotool set_desktop_for_window $WID $DN
		xdotool windowactivate $WID
		xdotool set_desktop $DN
	else
		echo "minimizing " $WID
		xdotool windowminimize $WID
	fi
done
