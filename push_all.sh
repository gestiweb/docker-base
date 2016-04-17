#!/bin/bash


for m in $(find * -name "Makefile"); do
    (
    cd $(dirname $m)
    make push || echo $(pwd)
    )
done
