#1/bin/bash
#
# sillyCommand.sh
#
# I'm not quite sure what sillyCommand.sh is going to do yet,
# but when it's done it will be excellent!
#

if [[ $# -lt 1 ]]; then
    echo "Usage: sillyCommand"
    exit -1
fi

if [ "$1" == "hello" ]; then
    echo "You typed HELLO!"
elif [ "$1" == "goodbye" ]; then
	echo "You typed GOODBYE"
else
    echo "Silly Comamand parameter: $1"
fi

