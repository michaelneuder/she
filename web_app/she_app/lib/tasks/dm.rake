require 'twitter'
require 'rubygems'
require 'oauth'
require 'cleverbot'

namespace :dm do
  desc "Get DM's"
  task get_dms: :environment do
    #Set up the base url for the twitter api
    baseurl = "https://api.twitter.com"

    #Set up the request for the direst messages
    path = '/1.1/direct_messages.json'
    address = URI("#{baseurl}#{path}")
    request = Net::HTTP::Get.new address.request_uri

    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request.oauth! http, $consumer_key, $access_token
    http.start
    response = http.request request

    messages = nil
    if response.code == '200'
      messages = JSON.parse(response.body)
    end

    messages.each do |message|
      puts message['sender']['screen_name']
    end
  end
end
