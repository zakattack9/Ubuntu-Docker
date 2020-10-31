## [Ubuntu Development Environment](https://hub.docker.com/repository/docker/zakattack9/ubuntu-dev)
Docker image that can be used as an Ubuntu 20.04 pseudoterminal environment without the need for a VM

### Prerequisites
- [Docker Desktop](https://docs.docker.com/get-docker/)

### Packages included in this image
- `Ubuntu 20.04`
- `man-db` and `manpages-dev`
- `most` (set as default pager)
- `build-essential` (g++, gcc, make)
- `gdb`
- `vim` and `nano`
- `grep`
- `gzip`
- `openssh-server` (ssh)
- `curl`
- `whois`
- `nmap`
- `iproute2` (ip)
- `iputils-tracepath` (tracepath)
- `iputils-ping` (ping)
- `dnsutils` (dig, nslookup)
- `arping`
- `tcpdump`

### How to run
```bash
# pull down custom Ubuntu image
$ docker pull zakattack9/ubuntu-dev:latest

# re-tag pulled down image without zakattack9/ prefix
$ docker tag zakattack9/ubuntu-dev:latest ubuntu-dev

# ...navigate to directory to mount...

# bind mount current directory and create container with a bash shell
$ docker run --rm -it -v "`pwd`:/root/ubuntu" -w "/root/ubuntu" ubuntu-dev
```

Alternatively, if further customization of this Dockerfile is desired, fork and clone this repo then build the image locally with
```bash
# assuming this command is executed in same directory as Dockerfile
$ docker build -t ubuntu-dev .
```

### Additional Notes
- **For Windows** makes sure that your C drive is selected under *Resources > File Sharing* in the Docker Desktop settings
- All files and folders in the `docker run` execution directory are copied under a `/ubuntu` folder in the Docker container; the `-w` option will automatically navigate to this directory during the container's startup
- The `docker run` command above creates a container that will bind mount the current directory that it's executed in; this means any file changes in the current directory or in the Docker container's `/ubuntu` directory will be directly reflected on both ends allowing for a live compilation and testing environment
- With the `--rm` option, typing `exit` will exit the container's bash shell and automatically delete the container
