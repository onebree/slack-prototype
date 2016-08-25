class Conversation < ApplicationRecord
  has_many :messages, :as => :receivable

  validates :participant_one_id, :participant_two_id, :presence => true

  def participants
    User.find([participant_one_id, participant_two_id])
  end
end
