FROM nextcloud:stable-apache

COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get -y install \
    p7zip \
    p7zip-full \
    p7zip-rar\
    rar \
    unrar \
    inotify-tools \
    imagemagick \
    aria2 \
    youtube-dl \
    ffmpeg
#RUN pecl install imagick-3.7.0

ENV PHP_MEMORY_LIMIT 512M
ENV PHP_UPLOAD_LIMIT 10G
ENV PHP_MAX_TIME 3600

#ENV NEXTCLOUD_UPDATE=1
#CMD ["/usr/bin/supervisord"]
