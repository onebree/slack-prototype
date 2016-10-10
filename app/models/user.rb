class User < ApplicationRecord
  NAME_REGEX = /+w/

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false },
                       :format => { :with => /\A#{NAME_ERGEX}\z/i },
                       :length => { :maximum => 15 }

  validates :password, :presence => true, :length => { :minimum => 8 }

  has_secure_password
end
