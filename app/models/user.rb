class User < ApplicationRecord
  has_many :channels
  has_many :messages, :foreign_key => "sender_id"

  def conversations
    Conversation.where("participant_one_id = :id OR participant_two_id = :id", :id => self.id).order(:id)
  end
end
