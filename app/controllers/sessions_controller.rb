class SessionsController < ApplicationController
  def index
    redirect_to room_messages_path(1)
  end

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to room_messages_path(1)
    else
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
