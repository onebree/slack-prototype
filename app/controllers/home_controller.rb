class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to chat_room_path(id: 1)
    else
      redirect_to login_path
    end
  end

  def mockup
  end

  def search
    @messages = Message.where(
      "receivable_type = :chat OR (receivable_type = :dm AND receivable_id IN (:dms))",
      :chat => "ChatRoom",
      :dm   => "Conversation",
      :dms  => current_user.conversations.pluck(:id)
    ).basic_search(:body => params[:search])
    .order(:created_at => :asc)
    .group_by { |m| m.created_at.strftime("%A, %B %-d") }
  end
end
