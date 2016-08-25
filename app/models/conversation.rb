class Conversation < ApplicationRecord
  has_many :messages, :as => :receivable

  validates :participant_one_id, :participant_two_id, :presence => true

  validates :participant_one_id, :uniqueness => { :scope => :participant_two_id }

  def participants
    User.find([participant_one_id, participant_two_id])
  end

  # Returns nil or Conversation instance
  def self.find_by_participants(a, b)
    self.find_by(:participant_one_id => a, :participant_two_id => b) ||
    self.find_by(:participant_one_id => b, :participant_two_id => a)
  end
end
