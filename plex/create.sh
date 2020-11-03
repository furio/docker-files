#!/bin/bash

IMAGENAME=furio/plex:latest


PUID=1000
PGID=1000

docker create \
--name=plex \
--net=host \
--restart=always \
--privileged \
--device /dev/dri/renderD128:/dev/dri/renderD128 \
-e VERSION=latest \
-e PUID=$PUID -e PGID=$PGID \
-e TZ=Europe/Rome \
-v $CONFIGPATH:/config \
-v $TRANSCODEPATH:/transcode \
-v $NASPATH:/data/media \
$IMAGENAME
