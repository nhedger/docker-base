# Base Docker Image

![build](https://github.com/nhedger/docker/actions/workflows/build.yaml/badge.svg?branch=main)

This repository contains a base docker image that I use for creating other
docker images.

- 🧱 Based on [Debian (slim)](https://hub.docker.com/_/debian)
- 👮 Sets up [S6 overlay](https://github.com/just-containers/s6-overlay) as the
  process supervisor
- 🎨 Sets default environment variables to match my preferences

## Usage

To create a custom image that builds on top of this base image, extend from `hedger/base`.

```dockerfile
FROM hedger/base
```

Refer to the official [documentation of s6-overlay](https://github.com/just-containers/s6-overlay#usage) for instructions about creating services.

## Building

This base image is automatically built and released using GitHub Actions.

To build the image locally, run the following script.

```bash
docker build -t hedger/base .
```

## License

This project is licensed under the [GNU General Public License v3.0](./LICENSE).

```
Docker Base Image

Copyright (C) 2022  Nicolas Hedger <nicolas@hedger.ch>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
