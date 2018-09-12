FROM grycap/jenkins:ubuntu14.04-python
LABEL description="Container with the dependencies needed to test tosca templates"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    python-pbr \
    python-yaml \
    python-dateutil \
    python-fixtures \
    python-testscenarios \
    python-dev \
    python-stevedore \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Clone the tosca-parser project
RUN git clone https://github.com/indigo-dc/tosca-parser /opt/tosca-parser

# Prepare the test environment (Remove unnecesary tests)
RUN cd /opt/tosca-parser \
 && mv toscaparser/tests/test_indigo.py . \
 && rm toscaparser/tests/test_* \
 && mv test_indigo.py toscaparser/tests/ \
 && rm toscaparser/extensions/nfv/tests/test_tosca_nfv_tpl.py
 
# Create the folder where the tests will be executed
RUN mkdir -p /opt/tosca-parser/toscaparser/tests/data/indigo/examples

# Give ownership to the jenkins user
RUN chown -R jenkins:jenkins /opt/tosca-parser
