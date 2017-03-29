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
      redirect_to @user
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "pZz9ZwlwdI3IzmwQp1kdwO1Pl"
        config.consumer_secret     = "2jjx9C5trl0r8L1ptaS8ASM2vrwnyXjPQmwYdpJM58FpWjgVxl"
        config.access_token        = "377135231-VEpQuLGAsdyKkoTwv35LUC3P7cSSoPpXpTSZYCLm"
        config.access_token_secret = "65Kgx30uTliAYnnOTYWN3j8VGhCvBHtGGFyZmCplx5rFZ"
      end
      client.create_direct_message(@user.twitter_handle, "Heyyyyyyy!!")
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
