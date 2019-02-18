FROM ubuntu:16.04

# install system deps
RUN apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y software-properties-common

# install locales
RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# install PHP 5.6
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update && \
        apt-get install -y  php5.6

# install PHP 5.6 deps
RUN apt-get install -y \
        apache2 \
        libapache2-mod-php5.6 \
        php5.6-mysql \
        php5.6-curl \
        php5.6-xml
        # sendmail

RUN rm -rf /var/www/html

CMD apachectl -D FOREGROUND
