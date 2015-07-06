require_relative 'spec_helper'

describe FyberTestApp do
  describe 'GET /' do
    before { get '/' }
 
    it 'is successful' do
      expect(last_response.status).to eq 200
      expect(last_response.body).to include("Search form")
    end
  end

  describe 'POST /' do
    context "error" do
      it 'got an error' do
        post '/'
        expect(last_response.status).to eq 200
        expect(last_response.body).to include("An error has occurred during request")
      end
    end
  end
end
