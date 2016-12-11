FROM napnap75/rpi-alpine-base:latest

# Install dependencies
RUN apk update \
	&& apk add transmission-daemon \
	&& rm -rf /var/cache/apk/*

# Required volumes
VOLUME /home

# Define working directory
ENV HOME /home
WORKDIR /home

# Accessible ports
EXPOSE 9091 51413

# Define default command
CMD ["/usr/bin/transmission-daemon -f -g /home"]
