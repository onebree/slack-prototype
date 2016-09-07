module SessionsHelper

  def store_location
    session[:return_to] = request.fullpath
  end

  def log_in(user)
    session[:user_id] = user.id
    cookies.permanent.signed[:user_id] = user.id
  end

  def log_out
    ActionCable.server.disconnect(current_user: @current_user)
    cookies.delete(:user_id)
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find(user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find(user_id)
      log_in user
      @current_user = user
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end
end

