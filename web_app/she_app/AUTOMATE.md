# How to Automate Your Stuff

##1) Put your code in the app as a rake task
In the lib/tasks directory make a file name
```
filename.rake
```
This is my dm.rake file
```ruby
#lib/tasks/dm.rake
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

    .
    .
    .

  end
end
```
You need the namespace and the task part these are how you call the task

##2) Add to the Clock File
In the app/clock.rb file add your task and frequency
My file looks like
```ruby
require 'clockwork'
include Clockwork

every(5.minutes, 'Send tweet'){
  `rake dm:get_dms`
}
```
So add you own task with
```ruby
every(number.time, "name"){
  `rake workspace:task`
}
```
For the time, you can use .minutes, .hours, .seconds and make sure to

put the rake task in \` things, the upper left keyboard key
