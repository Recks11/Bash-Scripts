#! /bin/sh
#######################################################
## Bash script to view services listening on a port  ##
#######################################################

if [ "$1" == "-h" ]; then
    echo "#######################################################"
    echo "## Bash script to view services listening on a port  ##"
    echo "#######################################################"
    echo ""
    echo "Usage: listening [port]"
    echo ""
fi

if [ $# -eq 0 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -nP
elif [ $# -eq 1 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -nP | grep -i --color :$1
else
    echo "Usage: listening [port]"
fi

## TODO add established 