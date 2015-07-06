require 'json'
require 'digest/sha1'

class FyberClient
  API_KEY = "b07a12df7d52e6c118e5d47d3f9e60135b109a1f"
  BASE_URL = "http://api.sponsorpay.com/feed/v1/offers.json"

  def initialize(params = {})
    @params = params
  end

  def self.find(params)
    new(params).to_hash
  end

  def to_hash
    JSON.parse(RestClient.get(request_url))
  end

  def request_params
    {
      ip:          "109.235.143.113",
      uid:         @params["uid"]  || "Machinae_Supremacy_-_Player_One", # ;) player1 is plain boring, Player One is way better.
      pub0:        @params["pub0"] || "campaign2",
      page:        @params["page"] || 1,
      appid:       157,
      format:      "json",
      locale:      "de",
      device_id:   "2b6f0cc904d137be2e1730235f5664094b83",
      timestamp:   Time.now.to_i,
      offer_types: 112,
      apple_idfa:  "IDKFA",
      apple_idfa_tracking_enabled: false
    }
  end

  def request_string
    Rack::Utils.build_query request_params.sort
  end

  def hashkey
    Digest::SHA1.hexdigest [request_string, API_KEY].join("&")
  end

  def request_url
    "#{BASE_URL}?#{request_string}&hashkey=#{hashkey}"
  end

end
