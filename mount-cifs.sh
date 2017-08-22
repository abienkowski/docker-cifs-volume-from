#!/bin/ash
REMOTE_HOST=devselenium01.toronto.ethoca.com
REMOTE_PATH=jenkinsshare
LOCAL_PATH=/mnt/cifs
# -- check for secrets shared from Rancher server
# -- -- secret name is the CIFS username
CIFS_USERNAME=jenkinsshare
# -- -- create a credentials file from secret
SECRET=$(cat /run/secret/$CIFS_USERNAME)
echo -e "USER=$CIFS_USERNAME\nPASS=$SECRET" > /root/.credentials
# -- workaround for current Ubuntu host from template
# -- -- load cifs and fscache modules
modprobe fscache
modprobe cifs
# -- mount cifs filesystem
MOUNT_OPTS=credentials=/root/.credentials,dom=toronto.ethoca.com,uid=1000,gid=1000,rw
mount -t cifs -o $MOUNT_OPTS //$REMOTE_HOST/$REMOTE_PATH $LOCAL_PATH
