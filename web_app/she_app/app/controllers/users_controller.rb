class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

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

  private
    def user_params
      params.require(:user).permit(:name, :email, :twitter_handle, :password, :password_confirmation)
    end
end
