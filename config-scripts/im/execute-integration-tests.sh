# Execute tests
WORKSPACE=$1

cd $WORKSPACE
nosetests-2.7 test/integration/TestREST_JSON.py test/integration/TestREST.py test/integration/TestIM.py -v --stop --with-xunit --with-timer --timer-no-color --with-coverage --cover-erase --cover-xml --cover-package=IM
