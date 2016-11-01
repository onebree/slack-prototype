class Room < ApplicationRecord
  has_many :messages, :dependent => :destroy
  has_many :room_users, :dependent => :destroy
  has_many :users, :through => :room_users
  has_many :documents, :dependent => :destroy

  validates :name, :presence   => true,
                   :uniqueness => { :case_sensitive => false }
end
