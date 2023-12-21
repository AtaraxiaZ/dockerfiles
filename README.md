# Tips for writing Dockerfiles
Separate the wget and curl with different RUN to avoid redownload.
## Debug
[blog](https://www.docker.com/blog/how-to-fix-and-debug-docker-containers-like-a-superhero/)
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
* If you need to mount a volume in rootless podman, the directory you mount will be owned by root. Solution:
1. The shortcoming of this solution is it will change the original permission outside the container. Sad...
-Z flag allows the container to write to the volume, but doesn’t allow the volume to be shared with other containers.
```shell
# In you host
podman unshare id zhe
# Use the id number to change the owner of directory
podman unshare chown -R <zhe_id>:<zhe_id> /home/zhe/projects
# Open the container and mount, the directory no longer owned by root
podman run --rm -it -v ~/projects:/home/zhe/projects:Z container_name
```
2. Another solution is to `podman run -u root`, but not recommended, you should not run anything as root, even in containers.
3. use `podman run -it --rm --userns=keep-id -v ... container_name`. The difference is:
```shell
# Before --userns=keep-id
$ id -a
uid=1000(zhe) gid=1000(zhe) groups=1000(zhe)
# After --userns=keep-id
$ id -a
uid=1000(zhe) gid=1000(zhe) groups=1000(zhe), 1200200287(lizhe)
```
And you need to make sure the initial directory is the /home/zhe, otherwise it will treat the initial directory as home. 
keep-id的作用是将外部的UID:GID给映射到容器内部，所以上面会显示lizhe的id，用`cat /etc/passwd | grep lizhe`可以查看
4. Use root in container



