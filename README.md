# rpi-transmission
My own Docker image for Transmission on the Rasperry Pi

# Status
[![Build Status](https://travis-ci.org/napnap75/rpi-transmission.svg?branch=master)](https://travis-ci.org/napnap75/rpi-transmission) [![Image size](https://images.microbadger.com/badges/image/napnap75/rpi-transmission.svg)](https://microbadger.com/images/napnap75/rpi-transmission "Get your own image badge on microbadger.com") [![Github link](https://assets-cdn.github.com/favicon.ico)](https://github.com/napnap75/rpi-transmission) [![Docker hub link](https://www.docker.com/favicon.ico)](https://hub.docker.com/r/napnap75/rpi-transmission/)

# Content
This image is based [my own Alpine Linux base image](https://hub.docker.com/r/napnap75/rpi-alpine-base/).

This image contains :

- [Transmission Bittorrent Client](https://transmissionbt.com/).

# Usage
1. Map one volume with the `/home` folder if you want the Transmission config directory (with the config file and database) to persist.
2. Map the volumes where you want you torrent downloaded to an unused folder in the image (for example `/data`).
3. Set the `RUN_AS` environment variable on startup (either with `docker run -e RUN_AS=1234:5678` or with the `environment` key in your compose file). In that case, the image is built with root privileges and only the main process is run as a non-priviledged user (for security reasons). The form of the `RUN_AS` variable must be `UID:GID` of the user.
4. After the first run, go and edit `settings.json` file in your `YOUR-TRANSMISSION-HOME-DIRECTORY`. List of all possible options you can find [here](https://github.com/transmission/transmission/wiki/Editing-Configuration-Files#options).
5. You should restart your docker container each time when you make changes in `settings.json` file.
6. After successful start you can access you transmission web gui via http://raspberry.local:9091

# Usage example
`docker run -v YOUR-TRANSMISSION-HOME-DIRECTORY:/home -v YOUR-TORRENT-FILES-DIRECTORY:/media napnap75/rpi-transmission:latest`

# Caveats
If you set the `RUN_AS` environment variable, the program will not be allowed to upgrade itself and you will have to manually upgrade it (either by rebuilding the image or by using the `docker exec` command (which do not use the entrypoint script and therefore is run as ROOT)).

You can start your container in detached mode, just provide `-d` option.

Add option `--net=host` if you can't access your container