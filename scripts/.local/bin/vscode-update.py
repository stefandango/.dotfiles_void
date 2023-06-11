#!/bin/env python
import requests
import tarfile

url = "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"

response = requests.get(url, stream=True)
file = tarfile.open(fileobj=response.raw, mode="r|gz")
file.extractall(path="/home/stefan/Scripts/")
file.close()

