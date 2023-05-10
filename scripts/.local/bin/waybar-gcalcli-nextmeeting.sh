#!/usr/bin/env bash
#
# Show next calendar event for waybar
#

set -e 

if ! command -v gcalcli &>/dev/null; then
	echo "Please install gcalcli (https://github.com/insanum/gcalcli)"
	exit 1
fi

# TODO only use events that are not whole days
events=$(gcalcli agenda --military --nodeclined --details end --tsv $(date +%H:%M))


start_date=$(date +"%s" -d "$(echo -e "$events" | head -n 1 | cut -d$'\t' -f 1-2 | sed 's/\t/ /g')")
end_date=$(date +"%s" -d "$(echo -e "$events" | head -n 1 | cut -d$'\t' -f 3-4 | sed 's/\t/ /g')")
event=$(echo -e "$events" | head -n 1 | cut -d$'\t' -f 5)

current_date=$(date +"%s")
text=""

if [[ $((start_date - current_date)) -gt 0 ]]; then
	hours=$((($start_date - $current_date) / 60/ 60))
	minutes=$((($start_date - $current_date) / 60 - ($hours * 60)))
	if [[ $hours -eq 0 ]]; then
		#text="$event starter om $minutes min"
		text="Next event in $minutes min"
	else
		# text="$event starter om $hours timer og $minutes min"
		text="Next event in in $hours h and $minutes min"
	fi
else
	hours=$((($end_date - $current_date) / 60/ 60))
	minutes=$((($end_date - $current_date) / 60 - ($hours * 60)))
	if [[ $hours -eq 0 ]]; then
		# text="$event slutter om $minutes min"
		text="Current event ends in $minutes min"
	else
		# text="$event slutter om $hours timer og $minutes min"
		text="Current event ends in $hours timer og $minutes min"
	fi
fi


case $1 in
"open")
	default_browser=$(xdg-settings get default-web-browser | cut -d '.' -f1)
	xdg-open https://calendar.google.com/calendar/u/0/r/week
	swaymsg "[app_id=$default_browser] focus"
;;
"waybar")
	cat <<EOF 
	{"text": "$text", "tooltip": "$(echo $events | sed 's/\\n/\n/g')"}
EOF
;;
*)
	echo $text
;;
esac

# TODO return type https://man.archlinux.org/man/community/waybar/waybar-custom.5.en#RETURN-TYPE
# gcalcli agenda --military --nodeclined --details end 

