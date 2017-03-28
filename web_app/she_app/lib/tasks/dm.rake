require 'twitter'
require 'rubygems'
require 'oauth'
require 'json'
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

    path2 = '/1.1/direct_messages/sent.json'
    address2 = URI("#{baseurl}#{path2}")
    request2 = Net::HTTP::Get.new address2.request_uri

    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    http2 = Net::HTTP.new address2.host, address2.port
    http2.use_ssl = true
    http2.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request.oauth! http, $consumer_key, $access_token
    http.start
    response = http.request request

    request2.oauth! http2, $consumer_key, $access_token
    http2.start
    response2 = http2.request request2

    messages = nil
    if response.code == '200'
      messages = JSON.parse(response.body)
    end

    if response2.code == '200'
      messages2 = JSON.parse(response2.body)
    end

    receive_times = Hash.new
    send_times = Hash.new

    #puts messages
    messages.each do |message|
      puts message['text'] + ' ' + message['created_at'] + ' ' + message['sender']['screen_name']
      if receive_times.key?(message['sender']['screen_name']) == false
        receive_times[message['sender']['screen_name']] = [message['created_at'], message['text']]
      end
    end

    puts '======================================='
    puts receive_times
    puts '======================================='

    messages2.each do |message|
      puts message['created_at'] + ' ' + message['recipient']['screen_name']
      if send_times.key?(message['recipient']['screen_name']) == false
        send_times[message['recipient']['screen_name']] = [message['created_at'], message['text']]
      end
    end

    puts '======================================='
    puts send_times
    puts '======================================='

    bot = Cleverbot.new('7xnrq8Em5MZGUajt','lPW0loSq26Cy99ullhZf7HoGAAFu6kx1')

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "pZz9ZwlwdI3IzmwQp1kdwO1Pl"
      config.consumer_secret     = "2jjx9C5trl0r8L1ptaS8ASM2vrwnyXjPQmwYdpJM58FpWjgVxl"
      config.access_token        = "377135231-VEpQuLGAsdyKkoTwv35LUC3P7cSSoPpXpTSZYCLm"
      config.access_token_secret = "65Kgx30uTliAYnnOTYWN3j8VGhCvBHtGGFyZmCplx5rFZ"
    end

    receive_times.each do |name, arr|
      if arr[0] > send_times[name][0]
        response = bot.say(arr[1])
        client.create_direct_message(name, response)
      end
    end
  end
end
