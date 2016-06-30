# Execute tests
nosetests -v test/unit/connectors/*.py test/unit/*.py test/functional/*.py test/integration/QuickTestIM.py test/integration/TestREST.py --with-timer --timer-no-color --with-xunit --with-coverage --cover-erase --cover-html --cover-package=IM
