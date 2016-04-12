#!/bin/bash

echo "Projects pending rebuild:"
find * -name "Dockerfile.pending_rebuild"

for dockerfile in $(find * -name "Dockerfile.pending_rebuild"); do
    (
    cd $(dirname $dockerfile)
    echo "Running >make push< on $(pwd) . . ."
    make push && test -f Dockerfile.pending_rebuild && unlink Dockerfile.pending_rebuild
    echo " -- DONE -- "
    )
done
