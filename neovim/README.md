You need to open a container, download all the plugins, and pack it as a new image.

First, you need to build with
```shell
docker build -t neovim .
```

And then, open a container
```shell
docker run -it -name neovim neovim
```

Open neovim under folder /home/zhe/opt/nvim, and wait for the plugins complete downloading
You'd better check with
```shell
:checkhealth
# And run tldr git to refresh tldr cache
tldr git
```


Exit the container
```shell
docker commit neovim neovim:latest
```

Package the new container and load it in another machine
```shell
docker save -o neovim.tar neovim:latest
docker load -i neovim.tar
```
