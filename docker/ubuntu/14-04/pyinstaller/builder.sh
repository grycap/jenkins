#!/bin/bash

wget https://raw.githubusercontent.com/grycap/oscar/master/src/providers/onpremises/openfaas/function/supervisor.py
pyinstaller --onefile supervisor.py
cat dist/supervisor

