#!/usr/bin/env python
import requests
import tarfile
import sys
import time

def print_spinner(message):
    spin_chars = "|/-\\"
    for _ in range(10):  # Adjust the number of iterations as needed
        for char in spin_chars:
            sys.stdout.write(f"\r{message}... {char}")
            sys.stdout.flush()
            time.sleep(0.1)

def print_colored_message(message, color):
    colors = {
        "reset": "\033[0m",
        "green": "\033[92m",
    }
    colored_message = f"{colors[color]}{message}{colors['reset']}"
    print(colored_message)

url = "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"

response = requests.get(url, stream=True)

if response.status_code == 200:
    print_spinner("Downloading")
    sys.stdout.write("\rDownloading... Done!\n")
    sys.stdout.flush()
    
    file = tarfile.open(fileobj=response.raw)
    
    print_spinner("Extracting")
    file.extractall(path="/home/stefan/Scripts/")
    file.close()
    
    sys.stdout.write("\rExtracting... Done!\n")
    sys.stdout.flush()
   
    print_colored_message("Script completed successfully!", "green")
else:
    print("Failed to download the file.")

# Cleanup if UI problematic..
# rm -rf ~/.config/Code/GPUCache

