FROM ubuntu:artful

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt -y update --fix-missing && \
    apt -y upgrade && \
    apt install -y transmission-remote-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && rm -rf /var/tmp/*

VOLUME /watchdir
COPY start.sh /start.sh
RUN chmod +x start.sh
CMD /start.sh
