class Document < ApplicationRecord
  attachment :file

  belongs_to :user

  validates :title, :presence => true
end
