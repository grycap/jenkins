FROM grycap/jenkins:ubuntu14.04-python
LABEL description="Container with the python libraries needed to test tosca templates"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    python-pbr \
    python-yaml \
    python-dateutil \
    python-fixtures \
    python-testscenarios \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Clone the tosca-parser project
RUN git clone https://github.com/indigo-dc/tosca-parser

# Prepare the test environment (Remove unnecesary tests)
RUN cd tosca-parser \
 && mv toscaparser/tests/test_indigo.py . \
 && rm toscaparser/tests/test_* \
 && mv test_indigo.py toscaparser/tests/ \
 && rm toscaparser/extensions/nfv/tests/test_tosca_nfv_tpl.py




