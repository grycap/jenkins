#!/bin/bash
cd /tmp
git clone https://github.com/indigo-dc/clues-indigo.git
cd clues-indigo/
nosetests tests/mesos_test.py
