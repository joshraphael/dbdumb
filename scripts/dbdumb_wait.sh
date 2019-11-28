#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dbdumb_wait() {
    until python3 $DIR/../main.py -p -f $2 $1; do
      >&2 echo "Program is unavailable - sleeping"
      sleep 10
    done
    if [ ! -d "$DIR/../.test" ]; then
        mkdir -p $DIR/../.test
    fi
    >&2 echo "Program is up - executing command"
    python3 $DIR/../main.py -f $2 $1 > $DIR/../.test/$3_$2.out
    diff $DIR/../tests/$3_$2.txt $DIR/../.test/$3_$2.out
    return $?
}
