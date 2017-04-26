require 'cleverbot'

class ChatController < ApplicationController
  def index
  end

  # @note A route to create a new chat instance
  def new
    @chat = Chat.new
  end

  # @param params [Hash] the message parameters
  # @note Routes to chat index page
  def get_message
    params[:message]
    puts 'message recieved';
    render 'chat/index'
  end

  # @note Routes to response page
  def print_response
    puts 'response';
    render 'chat/response'
  end

end
