FROM debian:stable-slim

LABEL maintainer="FoRTu" \
maintainer.ebail="me@fortu.io" \
maintainer.website="https://github.com/FoRTu/docker-tor-relay"

# Install Updates + tor + tor-arm + obfs4proxy + curl:
RUN apt update && \
apt upgrade -y && \
apt -y install tor tor-arm obfs4proxy curl && \
apt-get -y autoclean && \
apt-get -y autoremove && \
apt-get -y purge --auto-remove && \
rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/* \
        /var/cache/debconf/*-old \
        /var/lib/apt/lists/* \
        /usr/share/doc/*

EXPOSE 9001 9030 9050 8024

# Add launcher.sh
ADD launcher.sh /launcher.sh
RUN ["chmod", "+x", "/launcher.sh"]

# Command to run on container startup
CMD ["/launcher.sh"]
