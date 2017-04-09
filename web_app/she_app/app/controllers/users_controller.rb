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
        config.consumer_key        = "kA7gKxSbjKQ7JXRSHQCnfAMUN"
        config.consumer_secret     = "1t3R52Qp8DfAt1MbXfra9xA51OQrumBfpUBFhAoCckUlQ53pQs"
        config.access_token        = "850774011713925120-lSMiCOx77TSbjpqtfXBPD2KVaRmo24T"
        config.access_token_secret = "XtoF6sJPK8e1WLlCnL0RiTyAShO2NKv4g4ks3ZEp11YXX"
      end
      client.create_direct_message(@user.twitter_handle, "Heyyyyyyy!!")
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :twitter_handle, :password, :password_confirmation)
    end
end
