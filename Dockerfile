FROM napnap75/rpi-alpine-base:latest

# Install dependencies
RUN apk add transmission-daemon

# Required volumes
VOLUME /home

# Define working directory
ENV HOME /home
WORKDIR /home

# Accessible ports
EXPOSE 9091 51413

# Define default command
CMD ["/usr/bin/transmission-daemon -f -g /home"]
