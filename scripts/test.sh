#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/dbdumb_wait.sh
sqlite3 /dbdumb/dbdumb.db < /dbdumb/internal/sqlite/schema.sql

dbdumb_wait oracle://fred:flintstone@oracle:1521/XE oracle
if [ $? -ne 0 ]; then
    exit 1
fi
dbdumb_wait mysql://user:password@mysql:3306/dbdumb mysql
if [ $? -ne 0 ]; then
    exit 1
fi
dbdumb_wait postgresql://postgres:pgpassword@postgres:5432/dbdumb postgresql
if [ $? -ne 0 ]; then
    exit 1
fi
dbdumb_wait sqlite:////dbdumb/dbdumb.db sqlite
if [ $? -ne 0 ]; then
    exit 1
fi