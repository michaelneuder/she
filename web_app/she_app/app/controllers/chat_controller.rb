# require 'cleverbot'

class ChatController < ApplicationController
  def index
  end

  def new
    @message = Chat.new
  end

  def get_message
    params[:text_field]
  end

  def print_response
    puts 'response';
  end

end
