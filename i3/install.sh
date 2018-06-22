#!/bin/sh
set -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Remove directories if i3 has created them automatically
rm -r $HOME/.i3 $HOME/.config/i3 $HOME/.config/i3blocks $HOME/.config/i3status

mkdir -p $HOME/.i3 $HOME/.config

ln -s $DIR/i3status-functions $HOME/.i3
ln -s $DIR/i3blocks $HOME/.config/i3blocks
ln -s $DIR/i3status $HOME/.config/i3status
ln -s $DIR/i3 $HOME/.config/i3