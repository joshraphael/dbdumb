#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "test.sh"
source $DIR/dbdumb_wait.sh

dbdumb_wait oracle+cx_oracle://fred:flintstone@oracle:1521/dbdumb
dbdumb_wait mysql://user:password@mysql:3306/dbdumb
dbdumb_wait postgresql://postgres:pgpassword@postgres:5432/dbdumb