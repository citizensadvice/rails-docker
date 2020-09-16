# frozen_string_literal: true
source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "rails", "~> 6"

gem "bootsnap"                        # Speed up boot time by caching expensive operations
gem "pg"                              # Postgresql
gem "puma"

# Assets management
gem "autoprefixer-rails"              # Use SCSS for stylesheets
gem "hamlit"                          # Template engine
gem "jquery-rails"
gem "loofah-activerecord"             # Sanitize inputs
gem "mini_racer"
gem "react-rails"
gem "sass-rails"
gem "sassc", "~> 2.1.0"               # https://github.com/sass/sassc-ruby/issues/146
gem "sprockets"
gem "turbolinks"
gem "uglifier"                        # JavaScript compressor
gem "webpacker"

# Helpers
gem "acts_as_tree"                    # Tree structure for Advice Issue Codes
gem "addressable"                     # URI handling
gem "csv-safe"                        # Escapes potential CSV injection attacks when building a CSV
gem "damm"                            # Checksum
gem "kaminari"                        # Pagination
gem "rinku"                           # Autolink URLs
gem "simple_form"
gem "truncato"                        # Truncate html

# Authentication and authorisation
gem "jwt"
gem "pundit"

# Notify.gov to send SMS, email
gem "notifications-ruby-client"

# GraphQL
gem "batch-loader"
gem "graphql"

# Elasticsearch - versions must match the server version!
gem "elasticsearch", "~> 7"
gem "elasticsearch-model", "~> 7"
gem "elasticsearch-rails", "~> 7"

# AWS
gem "aws-sdk-s3"
gem "aws-sdk-ses"
gem "aws-sdk-sns"
gem "faraday_middleware-aws-sigv4"

# JSON formatter
gem "active_model_serializers"
gem "jbuilder"

# Redis
gem "hiredis"                         # C client library for Redis
gem "redis"
gem "redlock"                         # Distributed lock using Redis
gem "sidekiq"

# Attachments
gem "clamav-client"                           # Antivirus
gem "content_disposition"
gem "libreconv"                               # Converts docx to PDF. Requires libreoffice
gem "ruby-msg"                                # Convert Outlook msg files
gem "seven_zip_ruby"
gem "shrine"

# Image processing
gem "image_processing"
gem "mime-types"
gem "mini_magick"

# Server
gem "awesome_print"
gem "newrelic_rpm"
gem "rack-timeout"              # Abort requests that are taking too long
gem "rails_semantic_logger"

# Okta API
gem "faraday_middleware"
gem "link_header"

# Front-end assets
gem "bootstrap", "4.1.3"
gem "ckeditor", "4.3.0"
gem "font-awesome-rails"
gem "twitter-typeahead-rails"

gem "byebug"
gem "citizens-advice-style", github: "citizensadvice/citizens-advice-style-ruby", tag: "v0.3.0"
gem "factory_bot_rails"
gem "faker"
gem "haml-lint"
gem "json_matchers"
gem "parallel_tests"
gem "rails-controller-testing"
gem "rspec-rails"
gem "rubocop-rails"
gem "ruby-jmeter"
gem "rubycritic"
gem "webmock"

gem "spring"
gem "spring-commands-cucumber"
gem "spring-commands-rspec"
gem "spring-watcher-listen"

gem "listen"
gem "web-console"

gem "brakeman"
gem "memory_profiler"
gem "rack-mini-profiler"

gem "database_cleaner"

gem "browserstack-local"
gem "capybara"
gem "capybara-screenshot"
gem "capybara_accessible_selectors", github: "citizensadvice/capybara_accessible_selectors", tag: "v0.2.0"
gem "cucumber"
gem "cucumber-rails", "~> 2.1.0"
gem "cuke_sniffer"
gem "selenium-webdriver"
gem "shoulda-matchers"
gem "simplecov"
gem "simplecov-json"
gem "simplecov-rcov", github: "citizensadvice/simplecov-rcov", tag: "v0.2.3p1"
gem "site_prism"

gem "chronic"
gem "ci_reporter_rspec"
gem "rotp"

gem "coverband"