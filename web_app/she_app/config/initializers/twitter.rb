require 'twitter'
require 'rubygems'
require 'oauth'
#require 'cleverbot'

#$bot = Cleverbot.new('RtW9RmyVVExzC3xi','jpaekuzPDA5HRUNuAqtkOztlErHgsWSN')

$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "kA7gKxSbjKQ7JXRSHQCnfAMUN"
  config.consumer_secret     = "1t3R52Qp8DfAt1MbXfra9xA51OQrumBfpUBFhAoCckUlQ53pQs"
  config.access_token        = "850774011713925120-lSMiCOx77TSbjpqtfXBPD2KVaRmo24T"
  config.access_token_secret = "XtoF6sJPK8e1WLlCnL0RiTyAShO2NKv4g4ks3ZEp11YXX"
end

#Cant get this to work

#$consumer_key = OAuth::Consumer.new((ENV['consumer_key']).to_s, (ENV['consumer_secret']).to_s)
#$access_token = OAuth::Token.new((ENV['access_token']).to_s, (ENV['access_secret']).to_s)

$consumer_key = OAuth::Consumer.new(
  "kA7gKxSbjKQ7JXRSHQCnfAMUN",
  "1t3R52Qp8DfAt1MbXfra9xA51OQrumBfpUBFhAoCckUlQ53pQs")
$access_token = OAuth::Token.new(
  "850774011713925120-lSMiCOx77TSbjpqtfXBPD2KVaRmo24T",
  "XtoF6sJPK8e1WLlCnL0RiTyAShO2NKv4g4ks3ZEp11YXX")
