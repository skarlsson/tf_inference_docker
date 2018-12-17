#!/bin/bash
pushd ..
docker build -f Dockerfile.build3rdparty -ttf_serving_client-build3rdparty-ubuntu .
popd


