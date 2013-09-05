#!/usr/bin/env bash
CURRENT_VOLUME_HEX=`pacmd dump |grep set-sink-volume | sed 's/.* //g'`;
CURRENT_VOLUME_DEC=`printf "%d\n" $CURRENT_VOLUME_HEX`;

CURRENT_MUTE=`pacmd dump |grep set-sink-mute | sed 's/.* //g'`;

# 5% volume change = 3276
FULL=65536
VALUE=3276
SINK=0

VOLUME_UP=`expr $CURRENT_VOLUME_DEC + $VALUE`
VOLUME_DOWN=`expr $CURRENT_VOLUME_DEC + $VALUE \* -1`

# No more than 100%
if [ "$1" == "up" ]; then
    if (( $VOLUME_UP <= $FULL )); then
        pactl set-sink-volume $SINK $VOLUME_UP
        pactl set-sink-mute $SINK 0
    else
        pactl set-sink-volume $SINK $FULL
    fi
elif [ "$1" == "down" ]; then
    if (( $VOLUME_DOWN >= 0 )); then
        pactl set-sink-volume $SINK $VOLUME_DOWN
        pactl set-sink-mute $SINK 0
    else
        pactl set-sink-volume $SINK 0
    fi
elif [ "$1" == "mute" ]; then
    if [ "$CURRENT_MUTE" == "yes" ]; then
        pactl set-sink-mute $SINK 0
    else
        pactl set-sink-mute $SINK 1
    fi
fi
