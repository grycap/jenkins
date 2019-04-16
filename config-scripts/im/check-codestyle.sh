#!/bin/bash
# $1 -> Job workspace
WORKSPACE=$1

cd $WORKSPACE

pep8 --max-line-length=120 --ignore=E402 . --exclude=doc -v
