class MessagesController < ApplicationController
  before_action :logged_in_user

  def index
    @messages = Message.all
    @message = current_user.messages.build
  end

  def mockup
  end
end
