class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to channel_path(id: 1)
    else
      redirect_to login_path
    end
  end

  def mockup
  end
end
