#!/bin/bash
# $1 -> Job workspace
WORKSPACE=$1

cd $WORKSPACE

pycodestyle --max-line-length=120 --ignore=E402,W504,W605,E722 . --exclude=doc
