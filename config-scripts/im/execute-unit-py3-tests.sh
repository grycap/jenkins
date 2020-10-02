#!/bin/bash
WORKSPACE=$1

cd $WORKSPACE
if [ -f "/usr/bin/nosetests3" ]; then
  nosetests3 test/unit/connectors/*.py test/unit/*.py test/functional/*.py -v --stop --with-xunit --with-coverage --cover-erase --cover-xml --cover-package=IM,contextualization
 else
  nosetests test/unit/connectors/*.py test/unit/*.py test/functional/*.py -v --stop --with-xunit --with-coverage --cover-erase --cover-xml --cover-package=IM,contextualization
 fi
