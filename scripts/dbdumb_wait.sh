#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dbdumb_wait() {
    echo "here"
    until python3 $DIR/../main.py -p -f json $1; do
      >&2 echo "Program is unavailable - sleeping"
      sleep 10
    done

    >&2 echo "Program is up - executing command"
    python3 $DIR/../main.py -f json $1
}
