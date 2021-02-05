#!/bin/bash

# build the image
# this would normally be published to dockerhub and then specified ina ci script (e.g. image: toolset:latest)
docker build -t toolset:latest .


# run a tool from the image just built against a project (this is how CI systems work)
# 1. mount in the cloned project
# 2. set the workdir to the root of the mounted project
# 3. inject the CI environment variables into the container
# 4. set the entrypoint to the tool that needs to be run
# 5. specify the image that contains those tools
docker run -it \
	-v $(pwd)/some-cloned-git-project:/mnt/some-cloned-git-project \
        --workdir=/mnt/some-cloned-git-project \
	-e MYVAR=hello \
	--entrypoint=mytool \
	toolset:latest

 
