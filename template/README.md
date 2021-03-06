# Docker imagename
description

Dockerhub: [stangenberg/imagename][dockerhub]

## Features
- Feature A
- Feature B
- Feature C

## Exposed volumes
None.

## Exposed ports
- 22 / SSH

## Environment Variables
None.

## Usage
This is a template for new docker images See [https://github.com/stangenberg/docker-baseimage](https://github.com/stangenberg/docker-baseimage) for usage

Write here what to do with it and how - example run commands

## Build
Make is used as build system.
- `make` / starts normal docker build.
- `make run` / build and run the container. This uses `imagename` as container name and automatically stops a running container with an equal name beforehand.
- `make bash` /  build, run the container and start a prompt.
- `make ncbuild` / normal build without using the docker cache ( --no-cache ).

[Docker Build Reference https://docs.docker.com/reference/builder/](https://docs.docker.com/reference/builder/)

## License
[Published under the MIT License][LICENSE]

[dockerhub]: https://hub.docker.com/u/stangenberg/imagename
[license]: https://github.com/stangenberg/docker-imagename/blob/master/LICENSE.md
