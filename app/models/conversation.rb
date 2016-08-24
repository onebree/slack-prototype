class Conversation < ApplicationRecord
  has_many :messages, :as => :receivable

  has_many :conversation_participants
  has_many :participants, :through => :conversation_participants, :class_name => "User"
end
