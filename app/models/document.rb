class Document < ApplicationRecord
  attachment :file

  belongs_to :user
  belongs_to :room

  validates :title, :presence => true
end
