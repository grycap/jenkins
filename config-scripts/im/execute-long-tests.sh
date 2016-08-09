# Execute tests
WORKSPACE=$1

cd $WORKSPACE
nosetests -v test/unit/connectors/*.py test/unit/*.py test/functional/*.py test/integration/TestIM.py test/integration/TestREST.py test/integration/TestREST_JSON.py --stop --with-timer --timer-no-color --with-xunit --with-coverage --cover-erase --cover-html --cover-xml --cover-package=IM
