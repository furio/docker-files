FROM furio/artful-base

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="stian larsen,sparklyballs"

# global environment settings
ENV DEBIAN_FRONTEND="noninteractive" \
PLEX_DOWNLOAD="https://downloads.plex.tv/plex-media-server" \
PLEX_INSTALL="https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu" \
PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/config/Library/Application Support" \
PLEX_MEDIA_SERVER_HOME="/usr/lib/plexmediaserver" \
PLEX_MEDIA_SERVER_INFO_DEVICE=docker \
PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS="6" \
PLEX_MEDIA_SERVER_USER=abc

RUN \
 echo "**** sed repo ****" && \
 sed -i 's/security\.ubuntu\.com/old\-releases\.ubuntu\.com/g' /etc/apt/sources.list && \ 
 sed -i 's/archive\.ubuntu\.com/old\-releases\.ubuntu\.com/g' /etc/apt/sources.list && \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y \
	avahi-daemon \
	dbus \
        va-driver-all i965-va-driver intel-gpu-tools vainfo libva1 libva-* \
	unrar \
	wget && \
 echo "**** install plex ****" && \
 curl -o \
	/tmp/plexmediaserver.deb -L \
	"${PLEX_INSTALL}" && \
 dpkg -i /tmp/plexmediaserver.deb && \
 echo "**** change abc home folder to fix plex hanging at runtime with usermod ****" && \
 usermod -d /app abc && \
 usermod -a -G video abc && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/etc/default/plexmediaserver \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# usermod -a -G video plex && \

# add local files
COPY root/ /

# ports and volumes
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp
VOLUME /config /transcode
