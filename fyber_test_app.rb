require 'sinatra/base'
require 'rest-client'
require './fyber_client'

class FyberTestApp < Sinatra::Base
  get '/' do
    erb :form
  end

  post '/' do
    @data = FyberClient.find(params).to_hash
    erb :results
  end
end
