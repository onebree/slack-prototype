class Channel < ApplicationRecord
  belongs_to :user
  has_many :messages, :as => :receivable
end
