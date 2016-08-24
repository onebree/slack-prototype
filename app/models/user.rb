class User < ApplicationRecord
  has_many :channels
  has_many :messages, :foreign_key => "sender_id"

  has_many :conversation_participants
  has_many :conversations, :through => :conversation_participants
end
