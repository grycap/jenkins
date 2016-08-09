#!/bin/bash
# $1 -> Job workspace
# $2 -> Container name
WORKSPACE=$1
NAME_ID=$2

cd $WORKSPACE/test

# Get running port
XMLRPC_PORT=$(docker port $NAME_ID 8899 | awk -F "[:]" '{print $2}')
# Set running port
sed -i "s/TEST_PORT = 8899/TEST_PORT = $XMLRPC_PORT/g" integration/QuickTestIM.py
sed -i "s/TEST_PORT = 8899/TEST_PORT = $XMLRPC_PORT/g" integration/TestIM.py

# Get running port
REST_PORT=$(docker port $NAME_ID 8800 | awk -F "[:]" '{print $2}')
# Set running port
sed -i "s/TEST_PORT = 8800/TEST_PORT = $REST_PORT/g" integration/TestREST.py
sed -i "s/TEST_PORT = 8800/TEST_PORT = $REST_PORT/g" integration/TestREST_JSON.py

cd $WORKSPACE
