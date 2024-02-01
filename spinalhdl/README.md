Recommended way: An official spinalHDL OCI container is available at `ghcr.io/spinalhdl/docker:master`
```shell
podman run -v .:/workspace -it ghcr.io/spinalhdl/docker:master
```
Remainder: This image did not download any dependencies required for `sbt run`



You must run coursier setup with a internet access! Otherwise check [internet-free installation of sbt](https://spinalhdl.github.io/SpinalDoc-RTD/master/SpinalHDL/Getting%20Started/Install%20and%20setup.html#installing-sbt-in-an-internet-free-linux-environment). 
Note:
1. You must keep the same Username in the internet machine and internet-free machine
2. First copy the `~/.local/share/coursier/bin`. 
3. You should run `sbt run` inside an SpinalHDL project to download dependencies. 
