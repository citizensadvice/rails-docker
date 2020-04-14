FROM ruby:2.6.6

ENV BUNDLER_VERSION 2.0.2
ENV NODE_MAJOR_VERSION 12
ENV PG_VERSION 9.6
ENV WKHTMLTOPDF_VERSION_MAJOR 0.12
ENV WKHTMLTOPDF_VERSION_MINOR 0.12.5
ENV WKHTMLTOPDF_VERSION_FULL 0.12.5-1
ENV WKHTMLTOPDF_PACKAGE wkhtmltox_${WKHTMLTOPDF_VERSION_FULL}.stretch_amd64.deb

ADD pgdg.list /etc/apt/sources.list.d/

RUN curl --retry 5 --retry-connrefuse --retry-delay 4 -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libreoffice && \
    apt-get install -y postgresql-client-$PG_VERSION --no-install-recommends && \
    apt-get install -y build-essential imagemagick libmagic-dev xvfb fontconfig xfonts-base xfonts-75dpi xfonts-encodings xfonts-utils x11-common time --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

ENV WKHTMLTOPDF_DOWNLOAD_SHA256 1140b0ab02aa6e17346af2f14ed0de807376de475ba90e1db3975f112fbd20bb
RUN curl --retry 5 --retry-connrefuse --retry-delay 4 "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/${WKHTMLTOPDF_VERSION_MINOR}/${WKHTMLTOPDF_PACKAGE}" -L -O && \
    echo "$WKHTMLTOPDF_DOWNLOAD_SHA256 *${WKHTMLTOPDF_PACKAGE}" | sha256sum -c - && \
    dpkg -i ${WKHTMLTOPDF_PACKAGE} && \
    rm ${WKHTMLTOPDF_PACKAGE} && \
    rm -rf /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

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
