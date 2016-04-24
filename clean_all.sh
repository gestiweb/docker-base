#!/bin/bash


for m in $(find upgrade dev -maxdepth 2 -name "Makefile"); do
    (
    cd $(dirname $m)
    make clean-container && make drop-volume || echo $(pwd)
    )
done
docker-autoclean
