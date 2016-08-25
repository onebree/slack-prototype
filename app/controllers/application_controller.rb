class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def store_location
    session[:return_to] = request.fullpath
  end
end
