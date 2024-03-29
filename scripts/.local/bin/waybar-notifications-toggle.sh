#!/bin/bash
#
NOTICATIONMODE="$(makoctl mode | grep 'do-not-disturb')"

if [[ $NOTICATIONMODE == *"do-not-disturb"* ]]; then
    makoctl mode -r do-not-disturb  >/dev/null
else
    makoctl mode -a do-not-disturb  >/dev/null
fi
