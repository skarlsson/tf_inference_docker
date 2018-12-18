#!/bin/bash
set -ef

export BUILD_CONTAINER_NAME=tfs-build
export EXTRACT_CONTAINER=tfs-extract

export TAG_NAME=lb.bitbouncer.com:5000/tfs-example-master

if [ "$#" -eq 1 ]; then
    export TAG_NAME=$1
fi

rm -rf ./extract
mkdir -p ./extract/bin
mkdir -p ./extract/lib
mkdir -p ./extract/lib64
docker rm $EXTRACT_CONTAINER | true

docker build -f Dockerfile.build  --no-cache -t$BUILD_CONTAINER_NAME .
docker create --name $EXTRACT_CONTAINER $BUILD_CONTAINER_NAME
docker cp $EXTRACT_CONTAINER:/usr/local/lib                                ./extract
echo $PWD
find ./extract -name "*.a" -exec rm -rf {} \;

docker cp $EXTRACT_CONTAINER:/usr/local/bin/tf_inception_client            ./extract/bin
docker cp $EXTRACT_CONTAINER:/src/runDeps                                  ./extract/runDeps
docker rm -f $EXTRACT_CONTAINER

docker build -f Dockerfile --no-cache -t$TAG_NAME .

rm -rf ./extract


