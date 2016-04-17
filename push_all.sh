#!/bin/bash


for m in $(find upgrade dev -maxdepth 2 -name "Makefile"); do
    (
    cd $(dirname $m)
    make push || echo $(pwd)
    )
done
