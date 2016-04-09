#!/bin/bash

echo "Projects pending rebuild:"
find * -name "Dockerfile.pending_rebuild"

for dockerfile in $(find * -name "Dockerfile.pending_rebuild"); do
    (
    cd $(dirname $dockerfile)
    echo "Running >make push< on $(pwd) . . ."
    make push && unlink Dockerfile.pending_rebuild
    echo " -- DONE -- "
    )
done
