#!/bin/bash

docker run -v /var/lib/ruby -name my_project_gems busybox true
docker run -rm -volumes-from my_project_gems -volumes-from rubies -i ingoclaro/gem update --system
docker run -rm -volumes-from my_project_gems -volumes-from rubies -i ingoclaro/gem update -​-no-document
