FROM alpine:latest

# -- add cifs tools
RUN apk add --update --no-cache cifs-utils

# -- TODO: set permissions on the mounted volume

# -- add entrypoint script
RUN mkdir /docker-entrypoint-init.d
ADD ./mount-cifs.sh /docker-entrypoint-init.d/

# -- set entrypoint script
ENTRYPOINT ["/docker-entrypoint-init.d/mount-cifs.sh"]

VOLUME /mnt/cifs
