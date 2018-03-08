#!/bin/bash

name="furio/cups"
docker run --name "cups" --detach --restart=always \
--cap-add=SYS_ADMIN \
--device /dev/bus/usb \
--device /dev/usb \
-e CUPS_USER_ADMIN=admin -e CUPS_USER_PASSWORD=123456 \
--net=host \
${name}

# --publish 631:631 --publish 5353:5353 \
# --privileged \
# --volume /dev/bus/usb:/dev/bus/usb \
# --cap-add=SYS_ADMIN --security-opt apparmor:unconfined
# --publish 631:631 \
