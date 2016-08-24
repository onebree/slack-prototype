class HomeController < ApplicationController
  def index
    redirect_to channel_path(id: 1)
  end

  def mockup
  end
end
