#!/bin/bash

# change perms
chmod -R a+w tmp/ ; chmod -R a+w logs/ ; chmod -R a+w config/

# replace Mysql with Sqlite in config/app.php
sed -i "/    'driver'/c      'driver' => 'Cake\\\Database\\\Driver\\\Sqlite'," config/app.php
sed -i "/    'database'/c    'database' => '/var/www/html/croogo4.db'," config/app.php
sed -i "/    'port'/c        //'port' => 'not_used_with_sqlite'," config/app.php
sed -i "/    'username'/c    //'username' => 'not_used_with_sqlite'," config/app.php
sed -i "/    'password'/c    //'password' => 'not_used_with_sqlite'," config/app.php
