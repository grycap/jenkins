#!/bin/bash
# Move all the files from the tosca-templates repo (current directory) to the examples folder
mv * /opt/tosca-parser/toscaparser/tests/data/indigo/examples/

# Check codestyle
cd /opt/tosca-parser/
tox -e pep8

# Execute tests and create Junit output
nosetests-2.7 toscaparser/tests/test_indigo.py --with-xunit --xunit-file junit.xml

# Save tests output
mv junit.xml /home/jenkins/workspace/indigo/tosca-templates/
