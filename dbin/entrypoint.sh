#!/bin/bash
# runs when the container is started

# developer convenience
echo 'alias lsf="ls -F"' >> ~/.bashrc
echo 'set -o vi' >> ~/.bashrc

# finish croogo install via wget - need apache running
service apache2 start 
../bin/install.sh
service apache2 stop 

# run apache in foreground to keep container running
exec apache2-foreground "$@"
