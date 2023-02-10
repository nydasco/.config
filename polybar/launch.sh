#!/usr/bin/env bash

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybarleft.log /tmp/polybarright.log
polybar leftbar 2>&1 | tee -a /tmp/polybarleft.log & disown
polybar rightbar 2>&1 | tee -a /tmp/polybarright.log & disown
echo "Bars launched..."
