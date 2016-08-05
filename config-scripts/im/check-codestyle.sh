#!/bin/bash
# $1 -> Job workspace

cd $1

pep8 --max-line-length=120 --ignore=E402 . --exclude=doc
