#!/bin/bash
WORKSPACE=$1

cd $WORKSPACE
TESTS=test/unit/connectors/*.py test/unit/*.py test/functional/*.py
BASIC_PARAM=-v --stop
XUNIT=--with-xunit
TIMER=--with-timer --timer-no-color
COVERAGE=--with-coverage --cover-erase --cover-html --cover-package=IM

nosetests $TESTS $BASIC_PARAM $XUNIT $TIMER $COVERAGE
