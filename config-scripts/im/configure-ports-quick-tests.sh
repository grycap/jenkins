#!/bin/bash
# $1 -> Job workspace
# $2 -> Container name
cd $1/test

# Get running port
XMLRPC_PORT=$(docker port $2 8899 | awk -F "[:]" '{print $2}')
# Set running port
sed -i "s/TEST_PORT = 8899/TEST_PORT = $XMLRPC_PORT/g" integration/QuickTestIM.py

# Get running port
REST_PORT=$(docker port $2 8800 | awk -F "[:]" '{print $2}')
# Set running port
sed -i "s/TEST_PORT = 8800/TEST_PORT = $REST_PORT/g" integration/TestREST.py

cd $1
