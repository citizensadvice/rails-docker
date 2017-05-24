FROM citizensadvice/ruby-slim:2.3.4

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential nodejs-legacy curl wget git && \
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
RUN gem update --system --no-doc && gem install bundler && bundle install --full-index -j3

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
