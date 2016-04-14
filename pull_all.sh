#!/bin/bash


for m in $(find * -name "Makefile"); do
    (
    cd $(dirname $m)
    make pull || echo $(pwd)
    )
done
