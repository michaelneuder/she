require 'twitter'
require 'rubygems'
require 'oauth'
require 'json'
require 'cleverbot'

# @param $client [Hash] holds are twitter key values
# @param $consumer_key [Hash] oauth key values
# @param $access_token [Hash] oauth token values
# @note sends a direct message to pending messages
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

    puts messages
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
      config.consumer_key        = "kA7gKxSbjKQ7JXRSHQCnfAMUN"
      config.consumer_secret     = "1t3R52Qp8DfAt1MbXfra9xA51OQrumBfpUBFhAoCckUlQ53pQs"
      config.access_token        = "850774011713925120-lSMiCOx77TSbjpqtfXBPD2KVaRmo24T"
      config.access_token_secret = "XtoF6sJPK8e1WLlCnL0RiTyAShO2NKv4g4ks3ZEp11YXX"
    end

    # puts "These are the receive times"
    # puts receive_times
    # receive_times.each do |name, key|
    #   puts name + key[0]
    #   puts send_times.include?(name)
    # end
    receive_times.each do |name, arr|
      puts "This is " + name
      if send_times.include?(name)
        puts "First time" + arr[0]
        puts "Second send time" + send_times[name][0]
        arr[0] = Time.parse(arr[0])
        send_times[name][0] = Time.parse(send_times[name][0])
        if arr[0] > send_times[name][0]
          puts "Time is greater than send time"
          response5 = bot.say(arr[1])
          puts response5
          puts "Sent to" + name
          client.create_direct_message(name, response5)
        else
          puts "Time is not greater"
        end
      else
        puts "Obligatory hey"
        puts "Sent to" + name
        client.create_direct_message(name, "Heyyyy :)")
      end
    end
  end

  # @param $client [Hash] holds are twitter key values
  # @param $consumer_key [Hash] oauth key values
  # @param $access_token [Hash] oauth token values
  # @note retweets a random relationship account

  desc "reteet other tweets"
  task retweet: :environment do
    #Set up the base url for the twitter api
    baseurl = "https://api.twitter.com"

    num = rand(0..5)
    if num == 0
      screen_name = "CuteLovelyPosts"
    elsif num == 1
      screen_name = "LoveQuotes"
    elsif num == 2
      screen_name = "Relationship"
    elsif num == 3
      screen_name = "ohteenquotes"
    elsif num == 4
      screen_name = "GoalsBible"
    else
      screen_name = "RelationGoaIs"
    end

    #Set up the request for the direst messages
    path = "/1.1/statuses/user_timeline.json?screen_name=#{screen_name}&count=1"
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


    path2 = "/1.1/statuses/retweet/#{messages[0]['id_str']}.json"
    address2 = URI("#{baseurl}#{path2}")
    request2 = Net::HTTP::Post.new address2.request_uri

    http2 = Net::HTTP.new address2.host, address2.port
    http2.use_ssl = true
    http2.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request2.oauth! http2, $consumer_key, $access_token
    http2.start
    response2 = http2.request request2

    messages2 = nil
    if response2.code == '200'
      messages2 = JSON.parse(response2.body)
    end

    # puts messages2

    # puts messages

    # puts messages[0]['statuses']['text']

    # messages.each do |message|
    #   puts message['text']
    #   puts "Id is: "
    #   puts message['id_str']
    # end

  end

  # @param $client [Hash] holds are twitter key values
  # @param $consumer_key [Hash] oauth key values
  # @param $access_token [Hash] oauth token values
  # @note favorites users last tweets
  desc "Favorite Tweet"
  task fav_tweet: :environment do
    #Set up the base url for the twitter api
    baseurl = "https://api.twitter.com"
    User.all.each do |user|

      #Set up the request for the direst messages
      path = "/1.1/statuses/user_timeline.json?screen_name=#{user.twitter_handle}&count=1"
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


      path2 = "/1.1/favorites/create.json?id=#{messages[0]['id_str']}"
      address2 = URI("#{baseurl}#{path2}")
      request2 = Net::HTTP::Post.new address2.request_uri

      http2 = Net::HTTP.new address2.host, address2.port
      http2.use_ssl = true
      http2.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request2.oauth! http2, $consumer_key, $access_token
      http2.start
      response2 = http2.request request2

      messages2 = nil
      if response2.code == '200'
        messages2 = JSON.parse(response2.body)
      end

    # puts messages2

    # puts messages

    # puts messages[0]['statuses']['text']

    # messages.each do |message|
    #   puts message['text']
    #   puts "Id is: "
    #   puts message['id_str']
    # end
    end
  end

  # @param $client [Hash] holds are twitter key values
  # @param $consumer_key [Hash] oauth key values
  # @param $access_token [Hash] oauth token values
  # @note second retweeting method
  desc "reteet other tweets"
  task retweet1: :environment do
    #Set up the base url for the twitter api
    baseurl = "https://api.twitter.com"

    num = rand(0..5)
    if num == 0
      screen_name = "CuteLovelyPosts"
    elsif num == 1
      screen_name = "LoveQuotes"
    elsif num == 2
      screen_name = "Relationship"
    elsif num == 3
      screen_name = "ohteenquotes"
    elsif num == 4
      screen_name = "GoalsBible"
    else
      screen_name = "RelationGoaIs"
    end

    puts "screen name: " + screen_name

    #Set up the request for the direst messages
    path = "/1.1/statuses/user_timeline.json?screen_name=#{screen_name}&count=1"
    puts "Path: " + path
    address = URI("#{baseurl}#{path}")
    request = Net::HTTP::Get.new address.request_uri

    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request.oauth! http, $consumer_key, $access_token
    http.start
    response = http.request request

    puts request
    messages = nil
    if response.code == '200'
      puts 'it worked!'
      messages = JSON.parse(response.body)
    end


    path2 = "/1.1/statuses/retweet/#{messages[0]['id_str']}.json"
    puts "Path2: " + path2
    address2 = URI("#{baseurl}#{path2}")
    puts address2
    request2 = Net::HTTP::Post.new address2.request_uri


    http2 = Net::HTTP.new address2.host, address2.port
    http2.use_ssl = true
    http2.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request2.oauth! http2, $consumer_key, $access_token
    http2.start
    response2 = http2.request request2
    puts request2

    puts response2
    messages2 = nil
    puts response2.code
    if response2.code == '200'
      puts "It worked again"
      messages2 = JSON.parse(response2.body)
    end

    puts messages2

    # puts messages

    # puts messages[0]['statuses']['text']

    # messages.each do |message|
    #   puts message['text']
    #   puts "Id is: "
    #   puts message['id_str']
    # end

  end

  desc "reteet other tweets"
  task kyrie: :environment do
    User.all.each do |user|
      puts user.twitter_handle
    end

  end


end
