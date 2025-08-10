#!/bin/bash
killall -q polybar

echo "---" | tee -a /tmp/bar1.log
polybar bar1 | tee -a /tmp/bar1.log & disown

echo "done"
