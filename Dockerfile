FROM ruby:3.0.2-alpine

RUN apk add --update \
  build-base \
  nodejs \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:1.17.2
RUN bundle install

COPY . .

ENTRYPOINT rails s -b 0.0.0.0 -p 80