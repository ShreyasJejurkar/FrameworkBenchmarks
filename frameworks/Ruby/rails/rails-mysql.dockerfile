FROM ruby:3.3-rc

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends redis-server

EXPOSE 8080
WORKDIR /rails

COPY ./Gemfile* /rails/

ENV BUNDLE_FORCE_RUBY_PLATFORM=true
ENV BUNDLE_WITHOUT=postgresql
RUN bundle install --jobs=8

COPY . /rails/

ENV RUBY_YJIT_ENABLE=1
ENV RAILS_ENV=production_mysql
ENV PORT=8080
ENV REDIS_URL=redis://localhost:6379/0
CMD ./run-with-redis.sh
