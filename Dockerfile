FROM ruby:2.3.1

ADD pgdg.list /etc/apt/sources.list.d/

RUN wget -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y postgresql-client-9.5 nodejs mysql-client sqlite3 --no-install-recommends && \
    wget https://cnpmjs.org/mirrors/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -rf phantomjs-2.1.1-linux-x86_64* && \
    rm -rf /var/lib/apt/lists/*

ADD Gemfile* /app/
WORKDIR /app
RUN gem install bundler && bundle install

ONBUILD COPY . /app
ONBUILD RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
