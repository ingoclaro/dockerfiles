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
docker run -v /opt/rubies -name rubies busybox true
docker run -rm -volumes-from rubies -i ingoclaro/ruby-install ruby 2.0.0-p353 -- --disable-install-doc
docker run -volumes-from rubies image cmd
```

Once [this pull request](https://github.com/dotcloud/docker/issues/1992) is merged in, you will be able to copy the binaries from inside a volumne, like: `docker cp {container_id}:/opt/rubies/2.0.0-p353 .`

### gem
gem binary container
install and build required gems with this container into a project specific gem volume (/var/lib/ruby).
The rationale is to avoid having build tools on production containers.

build: `docker build -t ingoclaro/gem gem/`  
run:

```
docker run -v /var/lib/ruby -name my_project_gems busybox true
docker run -rm -volumes-from my_project_gems -volumes-from rubies -i ingoclaro/gem update --system
docker run -rm -volumes-from my_project_gems -volumes-from rubies -i ingoclaro/gem update
```

### ruby
ruby base image, use it as a base for your apps

build: `docker build -t ingoclaro/ruby ruby/`  
check:

```
docker run -rm -volumes-from my_project_gems -volumes-from rubies -i -t ingoclaro/ruby /bin/bash
```

the idea is to use this as a base image for your app. Note that the ruby version used is configured in environment variables. Check `ruby/Dockerfile` to see which env variables to override. You'll also need to update the gem container to use the desired ruby version.

Note: I guess at some point it makes more sense to copy the ruby and gems to the container instead of using volumes, I'll explore that at some point.

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
