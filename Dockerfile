FROM alpine:latest

# -- add cifs tools
RUN apk add --update --no-cache cifs-utils

# -- add entrypoint script
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# -- set entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]

# -- expose the mounted volume
VOLUME /mnt/cifs
