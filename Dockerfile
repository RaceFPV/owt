FROM ruby:2.6-alpine

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  sqlite \
  sqlite-dev \
  sqlite-libs \
  postgresql-dev \
  && rm -rf /var/cache/apk/*

# Use libxml2, libxslt a packages from alpine for building nokogiri
RUN bundle config build.nokogiri --use-system-libraries

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENTRYPOINT rails s -b 0.0.0.0 -p 80
