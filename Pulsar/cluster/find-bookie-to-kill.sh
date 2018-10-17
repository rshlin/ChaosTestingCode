#!/bin/bash

if $(docker ps | grep -q bookie1); then
    bookie1=$(echo $(bash get-node-ip.sh bookie1 | grep 172))
fi 

if $(docker ps | grep -q bookie2); then
    bookie2=$(echo $(bash get-node-ip.sh bookie2 | grep 172))
fi 

if $(docker ps | grep -q bookie3); then
    bookie3=$(echo $(bash get-node-ip.sh bookie3 | grep 172))
fi 

if $(docker ps | grep -q bookie4); then
    bookie4=$(echo $(bash get-node-ip.sh bookie4 | grep 172))
fi 

if $(docker ps | grep -q bookie5); then
    bookie5=$(echo $(bash get-node-ip.sh bookie5 | grep 172))
fi 

if $(docker ps | grep -q bookie6); then
    bookie6=$(echo $(bash get-node-ip.sh bookie6 | grep 172))
fi

bash find-ensemble.sh pulsar1 $1 | while read line;
    do
        if $(echo "$line" | grep -q "$bookie1"); then
            echo bookie1;
            exit 0;
        elif $(echo "$line" | grep -q "$bookie2"); then
            echo bookie2;
            exit 0;
        elif $(echo "$line" | grep -q "$bookie3"); then
            echo bookie3;
            exit 0;
        elif $(echo "$line" | grep -q "$bookie4"); then
            echo bookie4;
            exit 0;
        elif $(echo "$line" | grep -q "$bookie5"); then
            echo bookie5;
            exit 0;
        elif $(echo "$line" | grep -q "$bookie6"); then
            echo bookie6;
            exit 0;
        fi

        echo "$line"
    done
