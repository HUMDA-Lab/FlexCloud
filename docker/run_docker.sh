#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/data"
    exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

xhost +
docker run -it --rm \
    --network=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --privileged \
    -v /dev/shm:/dev/shm \
    -v $1/:/dev_ws/datasets/ \
    -v $HOME/FlexCloud:/dev_ws/src/flexcloud \
    -v $HOME/flexcloud_build:/dev_ws/build \
    ghcr.io/tumftm/flexcloud:latest
xhost -