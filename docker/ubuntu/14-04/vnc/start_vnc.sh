#!/bin/bash

Xvfb :1 -screen 0 1920x1080x24 &
/usr/bin/x11vnc -display :1.0 -usepw &
DISPLAY=:1.0
export DISPLAY
/bin/bash
