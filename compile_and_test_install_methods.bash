#!/bin/bash

set -e

export LORIKEET_VERSION=$1
echo "Testing Lorikeet version $LORIKEET_VERSION"

# # Test conda install
# echo "Testing conda install .."
# sed "s/LORIKEET_VERSION/$LORIKEET_VERSION/g" Dockerfile.conda.in > Dockerfile.conda
# docker build --no-cache --progress=plain -f Dockerfile.conda . &> conda.build.log

# Test crates install
echo "Testing crates install .."
sed "s/LORIKEET_VERSION/$LORIKEET_VERSION/g" Dockerfile.crates.in > Dockerfile.crates
docker build --progress=plain -f Dockerfile.crates . &> crates.build.log
# docker build --no-cache --progress=plain -f Dockerfile.crates . &> crates.build.log

# # Test docker install. Easier here than within a Dockerfile
# echo "Testing docker install .."
# chmod g+rw . # Docker needs this to write to the mounted volume - diamond uses it as a temp directory
# bash -c "docker pull wwood/singlem:$LORIKEET_VERSION && docker run -v `pwd`:/data wwood/singlem:$LORIKEET_VERSION pipe --sequences /data/test.fna --otu-table /dev/stdout" &> docker.build.log

# # Test apptainer install. Too annoying to run this within a Dockerfile and simple enough here.
# echo "Testing apptainer install .."
# rm -f singlem_$LORIKEET_VERSION.sif
# bash -c 'apptainer pull docker://wwood/singlem:$LORIKEET_VERSION && apptainer run --cleanenv -B `pwd`:`pwd` singlem_$LORIKEET_VERSION.sif pipe --sequences `pwd`/test.fna --otu-table /dev/stdout' > apptainer.build.stdout.log 2> apptainer.build.stderr.log
