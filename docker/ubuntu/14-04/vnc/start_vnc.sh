#!/bin/bash

vncserver :10 -localhost -nolisten tcp
DISPLAY=:10
export DISPLAY
/bin/bash
