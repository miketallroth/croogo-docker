#!/bin/bash

# change perms - prep for install
chmod -R a+w tmp/ ; chmod -R a+w logs/ ; chmod -R a+w config/

# automatic cli install
# using 'b' as short for 'blank', as these options are unneeded for sqlite
bin/cake croogo/install.install -d Sqlite -h b -u b -p b -t b -n /var/www/html/croogo4.db croogo croogo

# run individually to clean up the acl's
bin/cake acl_extras aco_update

# change perms - prep for use
chmod -R a+w tmp/ ; chmod -R a+w logs/ ; chmod -R a+w config/ ; chmod a+w croogo4.db
