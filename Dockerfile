FROM ruby:2.4.0

ADD pgdg.list /etc/apt/sources.list.d/

RUN wget -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y postgresql-client-9.5 mysql-client sqlite3 --no-install-recommends && \
    apt-get install -y build-essential imagemagick nodejs-legacy && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Medium/phantomjs/releases/download/v2.1.1/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -rf phantomjs-2.1.1-linux-x86_64*

ADD Gemfile* /app/
WORKDIR /app
RUN gem install bundler && bundle install


ONBUILD ADD Gemfile* /app/
ONBUILD RUN bundle install
ONBUILD ADD package.json /app/
ONBUILD RUN bundle exec npm install
ONBUILD COPY . /app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
