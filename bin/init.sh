#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ENV=$DIR/../.env


if [ ! -e "$ENV" ]
then
    touch $ENV
    echo "PROJECT_NAME=$1" > $ENV
fi