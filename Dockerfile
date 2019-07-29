FROM ruby:2.6.3

ENV BUNDLER_VERSION 2.0.2
ENV NODE_MAJOR_VERSION 10
ENV PG_VERSION 9.6
ENV WKHTMLTOPDF_VERSION 0.12.4

ADD pgdg.list /etc/apt/sources.list.d/

RUN curl --retry 5 --retry-connrefuse --retry-delay 4 -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y postgresql-client-$PG_VERSION --no-install-recommends && \
    apt-get install -y build-essential imagemagick libmagic-dev xvfb fontconfig xfonts-base xfonts-encodings xfonts-utils x11-common --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

ENV WKHTMLTOPDF_DOWNLOAD_SHA256 049b2cdec9a8254f0ef8ac273afaf54f7e25459a273e27189591edc7d7cf29db
RUN curl --retry 5 --retry-connrefuse --retry-delay 4 "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/${WKHTMLTOPDF_VERSION}/wkhtmltox-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz" -L -o "wkhtmltopdf.tar.xz" && \
    echo "$WKHTMLTOPDF_DOWNLOAD_SHA256 *wkhtmltopdf.tar.xz" | sha256sum -c - && \
    tar Jxvf wkhtmltopdf.tar.xz && \
    mv wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf && \
    rm -rf wkhtmltox && \
    rm wkhtmltopdf.tar.xz

RUN curl --retry 5 --retry-connrefuse --retry-delay 4 -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

RUN curl --retry 5 --retry-connrefuse --retry-delay 4 -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

ADD Gemfile* /app/
WORKDIR /app

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=3 \
  BUNDLE_RETRY=3
RUN gem update --system && gem install bundler:$BUNDLER_VERSION && bundle install --full-index && gem cleanup

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
