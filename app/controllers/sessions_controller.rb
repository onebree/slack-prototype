class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    puts user.nil?
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to channel_path(id: 1)
    else
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
