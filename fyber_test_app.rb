require 'sinatra/base'
require 'rest-client'

class FyberTestApp < Sinatra::Base
  get '/' do
    erb :form
  end

  post '/' do
    @data = {}
    erb :results
  end
end
