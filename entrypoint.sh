#!/usr/bin/env bash


# Create the user account
HashPass=`openssl passwd $SYSPASS`

groupadd --gid 1020 $SYSUSER
useradd --shell /bin/bash --uid 1020 --gid 1020 --password $HashPass --create-home --home-dir /home/ubuntu ubuntu

# Start xrdp sesman service
/usr/sbin/xrdp-sesman

# Run xrdp in foreground if no commands specified
if [ -z "$1" ]; then
    /usr/sbin/xrdp --nodaemon
else
    /usr/sbin/xrdp
    exec "$@"
fi
