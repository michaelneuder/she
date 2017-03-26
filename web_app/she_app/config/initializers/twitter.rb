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

#Cant get this to work

#$consumer_key = OAuth::Consumer.new((ENV['consumer_key']).to_s, (ENV['consumer_secret']).to_s)
#$access_token = OAuth::Token.new((ENV['access_token']).to_s, (ENV['access_secret']).to_s)

$consumer_key = OAuth::Consumer.new(
    "1uRJLIi5lyOufWTVjje5XHKG6",
    "deuZGezqTkP6KIGt5nxQ6n0XEZECST1LvlKw0JgCZ909XClKPk")
$access_token = OAuth::Token.new(
    "377135231-JLlSJoXq1gCr655ccLidWMQRuIgMobFEVaOnEymP",
    "g8FvyFgsJqGQIYokixrOFbtzEsOixqZ5Ul3bm2wC1a5Fx")
