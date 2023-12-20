# Tips for writing Dockerfiles
Separate the wget and curl with different RUN to avoid redownload.
## Debug
* If a step produced an image or matched a cached image, then launch a shell container from that image directly:
```shell
docker run -ti --rm <IMAGE ID> sh
```
* If a step didn't produce an image (e.g. it failed), then commit that step's container to an image and launch a shell container from that temporary image:
```shell
docker commit <CONTAINER ID> tempimagename
docker run -ti --rm tempimagename sh
```
## ARG
* The `ARG` won't expand another `ARG`.
* You mustn't use () to include `ARG`, just $YOURARG is valid.
## Volume
* If any build steps change the data within the volume after it has been declared, those changes will be discarded. So put volume in the bottom.



