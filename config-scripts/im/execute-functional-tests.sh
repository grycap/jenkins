# Execute tests
nosetests -v test/functional/*.py --with-timer --timer-no-color --with-xunit --with-coverage --cover-erase --cover-html --cover-package=IM
