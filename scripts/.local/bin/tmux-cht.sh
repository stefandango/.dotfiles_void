#!/usr/bin/env bash
selected=`cat ${HOME}/.local/bin/tmux-cht-languages ${HOME}/.local/bin/tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if [ "$selected" == "-" ]; then
    query=`echo $query | tr ' ' '+'`
    tmux neww zsh -c "echo \"curl cht.sh/$query/\" & curl cht.sh/$query & while [ : ]; do sleep 1; done"
elif  grep -qs "$selected" ~/Scripts/tmux-cht/tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww zsh -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww zsh -c "echo \"curl cht.sh/$selected~$query/\" & curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
