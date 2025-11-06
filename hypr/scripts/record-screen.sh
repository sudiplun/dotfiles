#!/bin/env bash

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -h string:wf-recorder:record -t 100 "Finished Recording" && exit 0


notify-send -h string:wf-recorder:record -t 100 "Recording start" 

sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
wf-recorder --bframes max_b_frames -f $HOME/Videos/$dateTime.mp4
