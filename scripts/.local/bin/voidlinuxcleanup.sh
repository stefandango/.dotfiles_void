#!/bin/bash

spinner="/|\\-"

# Function to run a command with a spinner animation
run_with_spinner() {
    $@ &
    command_pid=$!

    while kill -0 $command_pid 2>/dev/null; do
        for i in $(seq 0 3); do
            echo -ne "\r[${spinner:$i:1}] Running $1..."
            sleep 0.1
        done
    done

    wait $command_pid
    command_status=$?

    if [ $command_status -eq 0 ]; then
        echo -e "\r\033[0;32m[✓] $1\033[0m               "  # Green color for success
    else
        echo -e "\r\033[0;31m[✗] $1 (Exit Status: $command_status)\033[0m               "  # Red color for failure
    fi
}

# Cleaning package cache
run_with_spinner "xbps-remove -yO"

# Removing orphaned packages
run_with_spinner "xbps-remove -yo"

# Purging old kernels
run_with_spinner "vkpurge rm all"

# Displaying a colorful completion message
echo -e "\n\033[0;36m[✔] Script completed successfully!\033[0m"  # Cyan color for completion message

