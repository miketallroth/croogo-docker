# single container docker build for demo deployment

# start with 7.4 apache image with extensions for cake dev
FROM goclearsky/php-dev:7.4-apache

WORKDIR /var/www

# composer create project and install
RUN composer1 create-project --no-dev --no-interaction croogo/app html 4.0.7 \
    && cd html \
    && composer1 install --no-interaction \
    && composer1 run-script post-install-cmd --no-interaction \
    && composer1 dump-autoload -o \
    && composer1 clear-cache

# update working dir now that project is created and installed
WORKDIR /var/www/html

# change perms - prep for install
RUN mkdir -p tmp/database \
    && chmod -R a+w tmp/ logs/ config/

# croogo cms install, then clean up acl's
# using 'b' as short for 'blank', as these options are unneeded for sqlite
# enclosing directory of the sqlite file AND the file itself must be writable by web server (and cli as necessary)
RUN bin/cake croogo/install.install -d Sqlite -h b -u b -p b -t b -n /var/www/html/tmp/database/croogo4.db croogo croogo \
    && bin/cake acl_extras aco_update

# copy in the config files
COPY config/routes.php config/routes.php
COPY config/admin-fix.sql config/admin-fix.sql

# fix the admin user's role_id
RUN sqlite3 tmp/database/croogo4.db < "config/admin-fix.sql"

# change perms - prep for use
RUN chmod -R a+w tmp/ logs/ config/ 
