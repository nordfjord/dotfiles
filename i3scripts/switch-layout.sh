#!/bin/bash

CURRENTKB="$(setxkbmap -query | awk '/layout/{print $2}')"

if test "$CURRENTKB" = "is"
then
    setxkbmap us -option caps:escape
else
    setxkbmap is -option caps:escape
fi

echo "$(setxkbmap -query | awk '/layout/{print $2}')" >> ~/.keyboardswitcher
