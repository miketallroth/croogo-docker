#!/bin/bash

# automatic http install using wget
#   get url that would appear as "proceed with valid database config"
token=`wget localhost/install/install/data --keep-session-cookies --save-cookies cookies.txt -O - | grep -e _csrfToken | sed 's/^.*\(autocomplete\).*value=\"\([0-9a-f]*\)\".*$/\2/'`
echo ${token}

#   post a form for the admin user, user/pass=croogo/croogo
#   _method=PUT
#   _csrfToken='from sed'
#   username=croogo
#   password=croogo
#   verify_password=croogo
wget localhost/install/install/admin-user --load-cookies cookies.txt -O /dev/null --post-data="_method=PUT&username=croogo&password=croogo&verify_password=croogo&_csrfToken=${token}"


rm cookies.txt
