#!/bin/bash
NAME=callcentre
if ! [ -f $NAME ]
then
    g++ $NAME.cpp -o $NAME -Wall -std=c++11 -g
fi
chmod +x $NAME
./$NAME
rm -f $NAME
