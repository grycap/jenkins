# Execute tests
WORKSPACE=$1

cd $WORKSPACE
nosetests test/integration/TestIM.py test/integration/TestREST.py test/integration/TestREST_JSON.py -v --stop --with-xunit --with-timer --timer-no-color --with-coverage --cover-erase --cover-xml --cover-package=IM
