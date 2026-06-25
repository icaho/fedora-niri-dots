#!/bin/bash
# Get the number of available updates
updates=$(dnf list updates | grep 'v |' | wc -l)

if [ "$updates" -gt 0 ]; then
    echo "{\"text\": \"$updates \", \"tooltip\": \"$updates updates available\", \"class\": \"updates\"}"
else
    echo "{\"text\": \"0 \", \"tooltip\": \"System up to date\", \"class\": \"updated\"}"
fi
