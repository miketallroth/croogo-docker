# start with official php image
FROM php:7.3.11-apache

# composer needs unzip and libicu-dev
# using sqlite for croogo install
# using vim for debugging
# croogo needs php intl extension
# cakephp needs apache mod rewrite
RUN	apt-get update && apt-get install -y \
		unzip \
		libicu-dev \
		sqlite \
		git \
		wget \
		vim && \
	docker-php-ext-install intl && \
	a2enmod rewrite && \
	apt-get clean

# install composer version 1.9.1
RUN	COMPOSER_HASH=32ab9260d00d792106f1e43a9ed332ec1c05d5d2 && \
	curl https://raw.githubusercontent.com/composer/getcomposer.org/$COMPOSER_HASH/web/installer -o - -s | php -- --quiet --install-dir=/usr/bin --filename=composer

# Set the working directory to docroot
WORKDIR /var/www

# create croogo project
RUN	composer create-project --prefer-source --no-interaction croogo/app html 4.0.4

# Copy the current directory contents into the container one up from docroot
COPY dbin /var/www/bin

# update working dir now that project is created
WORKDIR /var/www/html

# install croogo
RUN	../bin/install.sh

# Run entrypoint when the container launches
CMD ["../bin/entrypoint.sh"]
