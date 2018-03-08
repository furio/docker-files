FROM lsiobase/xenial

RUN echo "deb http://www.bchemnet.com/suldr/ debian extra" >> /etc/apt/sources.list

# Upgrade
RUN apt-get --quiet update && \
	apt-get install --quiet --assume-yes --allow-downgrades --allow-remove-essential --allow-change-held-packages --allow-unauthenticated \
	curl whois cups-browsed avahi-daemon avahi-utils dbus cups-client htop python python-cups \
	suld-driver2-1.00.36 suld-driver2-common-1 && \
	apt-get -qq -y autoclean && apt-get -qq -y autoremove && apt-get -qq -y clean


# Container
COPY container/ /

EXPOSE 631 5353/udp
