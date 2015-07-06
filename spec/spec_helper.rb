require 'rack/test'
require 'rspec'
require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'
 
require_relative File.join('..', 'fyber_test_app')
 
RSpec.configure do |config|
  include Rack::Test::Methods
 
  def app
    FyberTestApp
  end
end
