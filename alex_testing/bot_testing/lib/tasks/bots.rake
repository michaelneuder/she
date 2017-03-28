require 'cleverbot'

namespace :bots do
  desc "Tweet out"
  task get_response: :environment do
    bot = Cleverbot.new('7xnrq8Em5MZGUajt','lPW0loSq26Cy99ullhZf7HoGAAFu6kx1')
    response = bot.say('hello')
    puts response
  end
end
