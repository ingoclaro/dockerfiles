# Set of Dockerfiles and docker dev environment

## Dockerfiles

- ruby-install  
ruby-install script, so you can compile ruby
build: `docker build -t ruby-install ruby-install/`  
run:  
`docker run -i ruby-install`  
`docker run -i ruby-install ruby 2.0.0-p353 -- --disable-install-doc`  
binaries will be in /opt/rubies inside the docker container, but that is a mounted volume, so you can use it in other containers.

## initial set up

To boot up docker VM review Vagrantfile, then run:  
`vagrant up`

while booting it will complain that it's missing the Virtualbox guest additions.
Don't worry, it works just fine without that.

install docker client, for osx:

```
brew tap homebrew/binary
brew install docker
```

tell docker to connect to the VM:

```
export DOCKER_HOST=localhost
```

test that it can connect:

```
docker version
```

The output should be like:

```
Client version: 0.7.4
Go version (client): go1.2
Git commit (client): 010d74e
Server version: 0.7.5
Git commit (server): c348c04
Go version (server): go1.2
Last stable version: 0.7.5, please update docker
```

you are ready to roll!!
## Dockerfiles

- ruby-install
ruby-install script, so you can compile ruby
build with: `build with: docker build -t ruby-install ruby-install/`

