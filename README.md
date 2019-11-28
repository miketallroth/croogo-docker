# Croogo
**Croogo** is a free, open source, content management system for PHP, released under [MIT License](http://github.com/croogo/croogo/blob/master/LICENSE.txt).
This docker image will deploy the Croogo CMS using a Sqlite database fully encapsulated within a single Docker container. It should be used for experimentation and demo purposes only. It has not been tested for production deployment.

# How to use this image

## Run the image
Select an unused port to publish Croogo. This example uses 7080.
If you will access the shell, naming the container is a good idea. This example uses "croogo".
```
docker run -p 7080:80 --name croogo miketallroth/croogo
```

## Try out Croogo CMS!
Access Croogo at,
```
http://localhost:7080/
```

## Access the admin section
Login to the admin section at,
```
http://localhost:7080/admin/
```
using croogo/croogo as the username/password.

## Access a shell
To access the Croogo root directory via shell,
```
docker exec -it croogo /bin/bash
```
Substitute croogo if you named your container something else.

## Contribute
Pull Requests are welcome at (Github)[https://github.com/miketallroth/croogo-docker]
