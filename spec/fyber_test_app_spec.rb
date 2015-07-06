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
    context "successful" do
      before do
        stub_rest_client_get_with "sample_response.json"
      end

      it 'invokes the client' do
        expect(FyberClient).to receive(:find).with({"uid"=>"quux"}).and_call_original
        post '/', uid: "quux"
      end

      it 'got some offers' do
        post '/', uid: "quux"
        expect(last_response.status).to eq 200
        expect(last_response.body).to include("Offers:")
        expect(last_response.body).to_not include("Sorry, nothing found.")
        expect(last_response.body).to_not include("An error has occurred during request")
      end
    end

    context "no content" do
      before do
        stub_rest_client_get_with "sample_no_content.json"
      end

      it 'invokes the client' do
        expect(FyberClient).to receive(:find).with({"uid" => "wubby"}).and_call_original
        post '/', uid: "wubby"
      end

      it 'got no offers' do
        post '/', uid: "wubby"
        expect(last_response.status).to eq 200
        expect(last_response.body).to_not include("Offers:")
        expect(last_response.body).to include("Sorry, nothing found.")
        expect(last_response.body).to_not include("An error has occurred during request")
      end
    end

    context "error" do
      before do
        stub_rest_client_get_with "sample_error.json"
      end

      it 'invokes the client' do
        expect(FyberClient).to receive(:find).with({"uid" => "baz"}).and_call_original
        post '/', uid: "baz"
      end

      it 'got an error' do
        post '/', uid: "baz"
        expect(last_response.status).to eq 200
        expect(last_response.body).to_not include("Offers:")
        expect(last_response.body).to_not include("Sorry, nothing found.")
        expect(last_response.body).to include("An error has occurred during request")
      end
    end

  end
end
