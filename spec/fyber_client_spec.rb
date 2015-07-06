require_relative 'spec_helper'

describe FyberClient do
  describe 'request_params' do
    let(:params) { {"uid" => "foo", "pub0" => "pub1", "page" => 2} }

    context 'correctly assigns passed params' do
      subject { FyberClient.new(params).request_params }
      it { expect(subject[:uid]).to eq "foo" }
      it { expect(subject[:pub0]).to eq "pub1" }
      it { expect(subject[:page]).to eq 2 }
    end

    context 'assigns default params' do
      subject { FyberClient.new.request_params }
      it { expect(subject[:uid]).to eq "Machinae_Supremacy_-_Player_One" }
      it { expect(subject[:pub0]).to eq "campaign2" }
      it { expect(subject[:page]).to eq 1 }
    end
  end

  context "with predefined params" do
    before do
      allow_any_instance_of(FyberClient).to receive(:request_params).and_return({foo: "bar", baz: "baka"})
    end

    describe "request_string" do
      subject { FyberClient.new.request_string }
      it { is_expected.to eq "baz=baka&foo=bar" }
    end

    describe "hashkey" do
      subject { FyberClient.new.hashkey }
      it { is_expected.to eq "660b65ee004d0b75eee6687caebf8be60fd75b0f" }
    end
    
    describe "request_url" do
      subject { FyberClient.new.request_url }
      it { is_expected.to eq "http://api.sponsorpay.com/feed/v1/offers.json?baz=baka&foo=bar&hashkey=660b65ee004d0b75eee6687caebf8be60fd75b0f" }
    end
  end
end
