FROM ruby:2.3.0

RUN apt-get update && \
  apt-get install -y nodejs --no-install-recommends && \
  apt=get install -f mysql-client postgresql-client sqlite3 --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

ADD Gemfile* /app/
WORKDIR /app
RUN bundle install

ONBUILD COPY . /app
ONBUILD RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
