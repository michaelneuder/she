require 'cleverbot'

class ChatController < ApplicationController
  def index
  end

  def new
    @chat = Chat.new
  end

  def get_message
    params[:message]
    puts 'message recieved';
  end

  def print_response
    puts 'response';
  end

end
