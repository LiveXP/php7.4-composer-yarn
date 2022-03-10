FROM debian:bullseye
LABEL maintainer="LiveXP <dev@livexp.fr>"

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update -q && apt-get install -qy --no-install-recommends \
	curl=7.74.0-1.3+deb11u1 \
  php7.4 \
  php7.4-curl \
  php7.4-ldap \
  php7.4-apcu \
  php7.4-gd \
  php7.4-gmp \
  php7.4-intl \
  php7.4-yaml \
  php7.4-xdebug \
  php7.4-common \
  php7.4-json \
  php7.4-mbstring \
  php7.4-phar \
  php7.4-xml \
  php7.4-zip \
	nodejs=12.22.5~dfsg-2~11u1 \
	npm=7.5.2+ds-2 \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn@1.22.17

RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo "Europe/Paris" > /etc/timezone

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["bash"]
