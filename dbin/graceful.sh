#!/bin/bash
# shuts down apache gracefully via a docker run call
# not needed if entrypoint uses "exec" as final call to apache foreground

APACHE_PID=`ps -U root -o pid,comm | grep apache2 | { read pid _ ; echo $pid ; }`

kill -WINCH $APACHE_PID
