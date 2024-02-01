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

NOTE:
1. You need to install Metals open a .scala file with `:MetalsInstall`
2. You need to manually run `sbt` to download jar, so that nvim-metals have more completions
3. You need to make sure clangd is installed 


Exit the container
```shell
docker commit neovim neovim:latest
```

Package the new container and load it in another machine
```shell
docker save -o neovim.tar neovim:latest
docker load -i neovim.tar
```

You could load the neovim with the following command
```shell
podman run --rm -it --name neovim --userns=keep-id -v /nfs-home/lizhe/projects:/home/zhe/projects neovim nvim
```

You may change the ~/.config/containers.conf and add:
```toml
[engine]
detach_keys="ctrl-q"
```
so that you could use ctrl-p and ctrl-n
