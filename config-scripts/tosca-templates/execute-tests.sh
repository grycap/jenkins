#!/bin/bash

mv *.yaml /opt/tosca-parser/toscaparser/tests/data/indigo/examples/

# Check syntax
cd /opt/tosca-parser/
tox -e pep8

# Execute tests and create Junit output
nosetests toscaparser/tests/test_indigo.py --with-xunit --xunit-file junit.xml

# Save tests output
mv junit.xml /home/jenkins/workspace/tosca-templates/
