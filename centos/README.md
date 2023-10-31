You need to use
```shell
docker run -it --volume=/tmp/python/:/tmp/python/ image_name
```
to mount the volume

WARNING: If the yum can't find openssl11-devel package. The pip3 won't be able to download package.
