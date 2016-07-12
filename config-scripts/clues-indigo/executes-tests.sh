#!/bin/bash

nosetests -v tests/indigo_orchestrator_test.py tests/mesos_test.py tests/condor_test.py --with-xunit --with-coverage --cover-erase --cover-html --cover-xml --cover-package=mesos,indigo_orchestrator,condor
