# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"
gem "rails", "~> 6.0.3.1"
gem "pg", ">= 0.18", "< 2.0"

gem "bootsnap", ">= 1.1.0", require: false
gem "interactor-rails"
gem "kaminari"
gem "oj", "~> 3"
gem "puma", "~> 4.3"
# The rack version can't be upgraded before rspec_api_documentation fixes this
# https://github.com/rack/rack/pull/1486
gem "rack", "~> 2.0.8"
gem "apitome"

group :development, :test do
  gem "rspec_api_documentation"
  gem "rspec-rails"
  gem "awesome_print"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "pry"
  gem "rubocop-rails_config"
end

group :development do
  gem "brakeman"
  gem "bullet"
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.3"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "faker"
  gem "simplecov", require: false
  gem "shoulda-matchers"
  gem "database_cleaner"
end
