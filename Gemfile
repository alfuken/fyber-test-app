source "https://rubygems.org"
ruby "2.2.2"
gem 'sinatra', '1.4.6'
gem 'rest-client'

group :development do
  gem 'racksh'
end

group :test, :development do
  gem 'rspec'
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'simplecov', :require => false
  gem 'rack-test'
end
