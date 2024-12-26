wYou need to open a container, download all the plugins, and pack it as a new image.

First, you need to build with
```shell
docker build --platform linux/amd64 -t lazyvim .
```

And then, open a container
```shell
docker run --platform linux/amd64 -it --name lazyvim --volume=$HOME/work/:/home/zhe/work/ lazyvim
```
