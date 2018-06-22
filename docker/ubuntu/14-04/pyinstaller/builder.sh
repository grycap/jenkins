#!/bin/bash

wget $1 -O to_build.py
pyinstaller --onefile to_build.py
cat dist/to_build

