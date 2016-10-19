class User < ApplicationRecord
  NAME_REGEX = /\w+/

  has_many :messages
  has_many :room_users
  has_many :rooms, :though => :room_users

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false },
                       :format => { :with => /\A#{NAME_REGEX}\z/i },
                       :length => { :maximum => 15 }

  validates :password, :presence => true, :length => { :minimum => 8 }

  has_secure_password
end
