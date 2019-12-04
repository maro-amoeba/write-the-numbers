# Dockerfile
FROM ruby:2.6.5-alpine
 
ENV PROJECT neptune
 
RUN mkdir -p $PROJECT
WORKDIR $PROJECT
 
RUN apk add git
RUN apk add --update bash perl
RUN apk add libxslt-dev libxml2-dev build-base
RUN apk add mysql-client mysql-dev
RUN apk add --no-cache file
RUN apk add yarn --no-cache
 
 
COPY . ./

# bundlerのバージョンと、Gemfile.lockで指定されているバージョンを一致させる
RUN gem install bundler:2.0.2
RUN bundle update --bundler
 
RUN bundle install
RUN yarn install
VOLUME /$PROJECT
 
# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
 
RUN mkdir -p /tmp/public && \
    cp -rf /neptune/public/* /tmp/public
