# Execute tests
WORKSPACE=$1

cd $WORKSPACE
nosetests-2.7 -v test/unit/connectors/*.py test/unit/*.py test/functional/*.py test/integration/QuickTestIM.py test/integration/TestREST.py --stop --with-timer --timer-no-color --with-xunit --with-coverage --cover-erase --cover-html --cover-package=IM
