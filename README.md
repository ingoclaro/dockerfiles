# Set of Dockerfiles and docker dev environment

## Dockerfiles

### ruby-install  
ruby-install script, so you can compile ruby
build: `docker build -t ruby-install ruby-install/`  
run:  
`docker run -i ingoclaro/ruby-install`  
`docker run -i ingoclaro/ruby-install ruby 2.0.0-p353 -- --disable-install-doc`  
binaries will be in /opt/rubies inside the docker container, that is a mounted volume, so you can use it in other containers like this:

```
docker run -v /opt/rubies -name=rubies busybox true
docker run -volumes-from rubies -i ingoclaro/ruby-install ruby 2.0.0-p353 -- --disable-install-doc
docker run -volumes-from rubies image cmd
```

Once [this pull request](https://github.com/dotcloud/docker/issues/1992) is merged in, you will be able to copy the binaries from inside a volumne, like: `docker cp {container_id}:/opt/rubies/2.0.0-p353 .`

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
