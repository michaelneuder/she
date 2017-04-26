module SessionsHelper
  # @param user [Hash] instance of a user
  # @note creates session with user's id
  def log_in(user)
    session[:user_id] = user.id
  end

  # @param session [Hash] the list of users' sessions
  # @note finds current user by session
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # @param current_user [Hash] a user stored in a hash
  # @note finds current user by session
  # @return [Boolean] if user session exists
  def logged_in?
    !current_user.nil?
  end

  # @param current_user [Hash] a user stored in a hash
  # @note deletes the user's session if it exists
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
