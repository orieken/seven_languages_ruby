FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -qy curl build-essential libssl-dev libcurl4-openssl-dev git-core

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN echo "export rvm_max_time_flag=20" >> ~/.rvmrc
RUN curl -sSL https://get.rvm.io | bash -s stable

RUN /bin/bash -l -c "rvm install ruby"
RUN /bin/bash -l -c "rvm use ruby --default"

ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#ADD config/start-server.sh /usr/bin/start-server
#RUN chmod +x /usr/bin/start-server

RUN mkdir /seven_languages_ruby
WORKDIR /seven_languages_ruby
ADD Gemfile /seven_languages_ruby/Gemfile
RUN /bin/bash -l -c "bundle install"


# RUN git clone git@github.com:group/project.git /project
