#!/bin/bash

NOTICATIONMODE="$(makoctl mode | grep 'do-not-disturb')"

if [[ $NOTICATIONMODE != *"do-not-disturb"* ]]; then
    printf '{"text": ""}\n' 
else
    printf '{"text": ""}\n'
fi
