#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/dbdumb_wait.sh
sqlite3 /dbdumb/dbdumb.db < /dbdumb/internal/sqlite/schema.sql

dbdumb_wait oracle+cx_oracle://fred:flintstone@oracle:1521/XE
dbdumb_wait mysql://user:password@mysql:3306/dbdumb
dbdumb_wait postgresql://postgres:pgpassword@postgres:5432/dbdumb
dbdumb_wait sqlite:////dbdumb/dbdumb.db