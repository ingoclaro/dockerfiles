# ruby
# ruby binary base image, use it as a base for your app

# build with: docker build -t ingoclaro/ruby ruby/

FROM tianon/centos
MAINTAINER Ingo Claro, miclaro@gmail.com

RUN yum -y update # 2014-01-19

VOLUME ["/opt/rubies", "/var/lib/ruby"]

ENV RUBY_ENGINE ruby
ENV RUBY_VERSION 2.0.0

# user gems are installed here
ENV GEM_HOME /var/lib/ruby/gems/2.0.0

# ruby version to use, following envs depend on this, you need to override all of them.
ENV MY_RUBY ruby-2.0.0-p353

ENV RUBY_ROOT /opt/rubies/ruby-2.0.0-p353

# put ruby binaries on the path
ENV PATH /opt/rubies/$MY_RUBY/bin:$PATH

# system gems are located here
ENV GEM_ROOT /opt/rubies/$MY_RUBY/lib/ruby/gems/2.0.0

# use user gems and system gems.
ENV GEM_PATH $GEM_HOME:$GEM_ROOT
