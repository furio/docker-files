#!/bin/bash
# TR_OPTIONS="192.168.100.3 -n admn:psswrd --downlimit 500 --uplimit 50"

function intfunc
{
	echo "`basename $0`: Ouch! User Aborted."
	exit 1
}

trap intfunc 2 3 6 15

if [ -z "$TR_IP" ]
then
	exit 1
fi

if [ -z "$TR_SLEEP" ]
then
	TR_SLEEP=1m
fi

if [ -z "$TR_DIR" ]
then
	TR_DIR=/watchdir
fi

while true
do
	ls $TR_DIR/*.magnet &> /dev/null
	if [ $? -eq 0 ]
	then
		for MAGNET in $TR_DIR/*.magnet
		do
			echo "Parsing file $MAGNET"
			MGNLINK=$(<"$MAGNET")
			transmission-remote $TR_IP $TR_OPTIONS --add $MGNLINK
			if [ $? -eq 0 ]
			then
				mv "$MAGNET" "$MAGNET.added"
			fi
		done
	fi

	sleep $TR_SLEEP
done

exit 0


