FROM ruby:2.4.2
RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update && apt-get -y install curl git nano

RUN mkdir /app
RUN mkdir /app/ma
WORKDIR /app/ma

ADD Gemfile /app/ma/
ADD Gemfile.lock /app/ma/

RUN cd /app/ma && bundle install

RUN apt-get -y install nodejs

ADD . /app/ma/
