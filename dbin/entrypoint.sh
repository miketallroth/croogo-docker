#!/bin/bash
# runs when the container is started

# developer convenience
echo 'alias lsf="ls -F"' >> ~/.bashrc
echo 'set -o vi' >> ~/.bashrc

# run apache in foreground to keep container running
exec apache2-foreground "$@"
