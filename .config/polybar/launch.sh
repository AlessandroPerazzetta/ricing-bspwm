#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
#polybar -q main -c "$DIR"/config.ini &

#ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom



screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

echo "Connected monitor/s: " $screens

if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
  echo "Single monitor polybar starting ..."
  MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar -q main -c "$DIR"/config.ini &
else
  echo "Dual monitor polybar starting ..."
  primary=$(xrandr --query | grep primary | cut -d" " -f1)

  for m in $screens; do
    if [[ $primary == $m ]]; then
        MONITOR_MAIN=$m TRAY_POS=right polybar -q main -c "$DIR"/config.ini &
    else
        MONITOR_SECONDARY=$m TRAY_POS=left polybar -q secondary -c "$DIR"/config.ini &
    fi
  done
fi
