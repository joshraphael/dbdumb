#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJ="dbdumb"
ENV=$DIR/env
ENV_BIN=$ENV/bin
REQUIREMENTS=$DIR/requirements.txt

func_env() {
    cd $DIR
    rm -rf $ENV
    virtualenv env
    cd $ENV_BIN
    . activate
    cd $DIR
    pip3 install -r $REQUIREMENTS
    deactivate
}

func_usage() {
    echo "Usage:"
    echo -e "\t$ $0 [options...]\n"
    echo "Options:"
    echo -e "\t--env\t\tClean and install environment"
}

for var in "$@"; do
    if [[ "$var" = "--env" ]]; then
        func_env
    elif [[ "$var" = "--clean" ]]; then
        rm -rf $ENV_BIN
    fi
done

if [[ ! -d "$ENV_BIN" ]]; then
    echo "ERROR: Environment not installed"
    func_usage
else
    cd $ENV_BIN
    . activate
    python3 $DIR/main.py -f json mysql://user:password@127.0.0.1:3306/dbdumb
fi
