class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])
    @grouped_messages = @channel.messages.order(:created_at => :asc).group_by { |m| m.created_at.strftime("%A, %B %-d") }
  end
end
