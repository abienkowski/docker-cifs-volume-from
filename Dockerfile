FROM alpine:latest

# -- add cifs tools
RUN apk add --update --no-cache cifs-tools

# -- TODO: set permissions on the mounted volume

# -- add entrypoint script
RUN mkdir /docker-entrypoint-init.d
ONBUILD ADD ./mount-cifs.sh /docker-entrypoint-init.d

# -- set entrypoint script
ENTRYPOINT ["mount-cifs.sh"]

VOLUME /mnt/cifs
