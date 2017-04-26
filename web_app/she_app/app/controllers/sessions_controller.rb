class SessionsController < ApplicationController
  # @note routes to new session
  def new
  end

  # @param params [Hash] holds user parameters
  # @note Logs in to user account or redirects to new
  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in(user)
      redirect_to user
    else
      render 'new'
    end
  end

  # @note Logs out and destroys session
  def destroy
    log_out
    redirect_to root_url
  end
end
