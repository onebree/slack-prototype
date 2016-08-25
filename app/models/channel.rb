class Channel < ApplicationRecord
  belongs_to :user
  has_many :messages, :as => :receivable

  def member_count
    messages.pluck(:sender_id).uniq.count
  end
end
