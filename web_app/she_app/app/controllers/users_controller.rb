require "twilio-ruby"
class UsersController < ApplicationController
  # @param params [Hash] the search parameters
  # @note A route to show all users
  def show
    @user = User.find(params[:id])
  end

  # @note A route to setup page for a new user
  def new
    @user = User.new
  end

  # @param user_params [Hash] the post parameters
  # @note A route to create a new user. On user save follow the user's twitter account. If the login fails, generate a the signup page again.
  def create


    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      baseurl = "https://api.twitter.com"

      #Follow the user on signup
      path = "/1.1/friendships/create.json?screen_name=#{@user.twitter_handle}&follow=true"
      address = URI("#{baseurl}#{path}")
      puts address
      request = Net::HTTP::Post.new address.request_uri

      http = Net::HTTP.new address.host, address.port
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request.oauth! http, $consumer_key, $access_token
      http.start
      response = http.request request

      puts response
      puts response.code


      #Make sure message passes
      messages = nil
      if response.code == '200'
        messages = JSON.parse(response.body)
        puts messages
      end
      redirect_to signed_up_path
    else

      render 'new'
    end
  end

  def send_message
    phone_number = ENV['clientNumber']
    twilioSID = ENV['twilioAccountSID']
    twilioAuthToken = ENV['twilioAuthToken']
    twilioNumber = ENV['twilioNumber']

    @client = Twilio::REST::Client.new twilioSID, twilioAuthToken

    @client.account.sms.messages.create(
    :from => twilioNumber,
    :to => "+1" + phone_number,
    :body => "Hey, it's Sophie. We need to talk."
    )
  end

  private
  # @param :user [Symbol] the user key
  # @note Declare strong parameters that are permitted
    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :twitter_handle, :password, :password_confirmation)
    end
end
