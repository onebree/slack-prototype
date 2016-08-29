class ChannelsController < ApplicationController
  def show
    store_location

    if logged_in?
      @channel = Channel.find(params[:id])
      @grouped_messages = @channel.messages.order(:created_at => :asc).group_by { |m| m.created_at.strftime("%A, %B %-d") }
    else
      redirect_to login_path
    end
  end
end
