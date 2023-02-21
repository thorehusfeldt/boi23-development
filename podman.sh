#!/bin/sh
podman run --rm -it --name=boi -v $(pwd):/boidev:Z -w /boidev hamerly/problemtools-icpc
