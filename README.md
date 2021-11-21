# Docker Tor-Relay

Docker image based on the latest stable-slim Debian image to run Tor as a `relay` and `bridge`.

You can build the image by the [Dockerfile](https://github.com/FoRTu/docker-tor-relay/blob/master/Dockerfile) or just download it from Docker Hub:

* [https://hub.docker.com/r/fortu/tor-relay](https://hub.docker.com/r/fortu/tor-relay)

In this repository you will find a template of the requested [`torrc`](https://github.com/FoRTu/docker-tor-relay/blob/master/torrc) configuration file to run `tor`. You can use it as a template or just use as it is. Because is totally functional, but I recommend to customize to make it unique and yours.

## How to create a container from this image

Easy, just run the command below by changing the `torrc` configuration file path and the folder where all tor generated files will be save. This folder is very important because the `fingerprint`, the ID of your relay, will be stored there. This is files are needed to restore your relay after a tor software update or if you want to move the relay to another computer.

```bash
docker run --name='tor-relay' \
-p '9001:9001/tcp' \
-p '9030:9030/tcp' \
-p '9050:9050/tcp' \
-p '8024:8024/tcp' \
-v '[PATH OF torrc FILE]':'/etc/tor/':'rw' \
-v '[DATA DIRECTORY]':'/var/lib/tor':'rw' \
'fortu/tor-relay'
```

The launcher inside the container will check if the required `torrc` file exist. This file is necessary to run `tor`. If it doesn't, a template will be download from this git repository. The template itself is totally functional, so in case of run the container for the first time or the `torrc` file doesn't exist because has been deleted, it will be downloaded automatically.

I highly recommend to customize the `torrc` file with you info to make it unique.

Be aware that if you are behind a NAT or Firewall you have to open this  TCP ports:

* 9091/TCP
* 9030/TCP
* 8024/TCP

Let's make Internet more anonymous!
