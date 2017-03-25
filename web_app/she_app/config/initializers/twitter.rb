require 'twitter'
require 'rubygems'
require 'oauth'
#require 'cleverbot'

#$bot = Cleverbot.new('RtW9RmyVVExzC3xi','jpaekuzPDA5HRUNuAqtkOztlErHgsWSN')

$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['consumer_key']
  config.consumer_secret     = ENV['consumer_secret']
  config.access_token        = ENV['access_token']
  config.access_token_secret = ENV['access_secret']
end

$consumer_key = OAuth::Consumer.new(
    ENV['consumer_key'],
    ENV['consumer_secret'])
$access_token = OAuth::Token.new(
    ENV['access_token'],
    ENV['access_secret'])
