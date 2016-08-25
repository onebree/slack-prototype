class Conversation < ApplicationRecord
  has_many :messages, :as => :receivable

  validates :participant_one, :participant_two, :presence => true

  def self.participants
    User.find([:participant_one_id, :participant_two_id])
  end
end
