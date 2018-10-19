FROM ruby:2.5-alpine
MAINTAINER PotHix <pothix@doist.com>

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app/
VOLUME /usr/src/app/
EXPOSE 4567

RUN apk --update --no-cache add g++ musl-dev make nodejs bash

COPY Gemfile Gemfile.lock ./
RUN bundle install && rm -f Gemfile*

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
