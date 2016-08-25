class User < ApplicationRecord
  has_many :channels
  has_many :messages, :foreign_key => "sender_id"

  def self.conversations
    Conversation.where("participant_one_id = :id OR participant_two_id = :id", :id => self.id)
  end
end
