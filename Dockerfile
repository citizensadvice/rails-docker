FROM ruby:2.6.6-alpine3.11

ARG SYSTEM="build-base git bash"
ENV LANG=C.UTF-8
ENV DEPENDENCIES \
    tzdata npm yarn \
    # POSTGRES
    postgresql-dev postgresql-client \
    # FILEMAGIC
    file-dev \
    # IMAGE CONVERSION JOB
    imagemagick tiff \
    # WORD TO PDF JOB
    libreoffice-writer \
    # HTML TO PDF JOB
    wkhtmltopdf

RUN apk --no-cache add $SYSTEM $DEPENDENCIES
RUN gem install bundler

WORKDIR /app
COPY Gemfile* /app/

RUN bundle config set jobs 6
RUN bundle package --all
