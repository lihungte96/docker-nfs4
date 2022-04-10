# NFS v4 Server Container

[![Docker Build](https://github.com/lihungte96/docker-nfs4/actions/workflows/docker-hub-publish.yml/badge.svg)](https://github.com/lihungte96/docker-nfs4/actions/workflows/docker-hub-publish.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/lihungte96/docker-nfs4.svg)](https://hub.docker.com/r/lihungte96/docker-nfs4/)
[![Docker Stars](https://img.shields.io/docker/stars/lihungte96/docker-nfs4.svg)](https://hub.docker.com/r/lihungte96/docker-nfs4/)
[![Docker Build](https://img.shields.io/docker/automated/lihungte96/docker-nfs4.svg)](https://hub.docker.com/r/lihungte96/docker-nfs4/)

This is a fork form: [Joe Bieillik nfs4 repo](https://github.com/jcbiellikltd/docker-nfs4)
Modified to run on a Raspberry Pi and to auto load the exports configuration.
The multi platform feature has been inspired by [Greg White](https://github.com/grewhit25/docker-nfs4-server)

[NFS v4](http://nfs.sourceforge.net/) server running under [s6 overlay](https://github.com/just-containers/s6-overlay) on [Alpine Linux](https://hub.docker.com/_/alpine/).

## Multi-platform Image

Docker image for both amd64, armhf and arm64. The arm64 version tested on OCI Ampere A1 and Raspberry Pi 4


## Configuration

See [example directory](https://github.com/lihungte96/docker-nfs4/tree/master/example) for sample config file.

## Quickstart

```yml
nfs4:
  image: lihungte96/docker-nfs4

  # Required to load kernel NFS module
  privileged: true

  volumes:
    # You must provide an exports config file
    - ./exports:/etc/exports

    # Shares
    - /mnt:/mnt

  ports:
    - "2049:2049/tcp"
    - "2049:2049/udp"
```

### Testing & Mounting

For some reason, the NFS service can't be debugged by showmount command. To test the NFS service you have to mount it directly.

```shell
mount -t nfs4 localhost:/ ./nfs
```
