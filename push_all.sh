#!/bin/bash


for m in $(find upgrade dev lamp -maxdepth 2 -name "Makefile"); do
    (
    cd $(dirname $m)
    make push-only || echo $(pwd)
    )
done
