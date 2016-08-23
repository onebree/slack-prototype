class User < ApplicationRecord
  has_many :channels
  has_many :messages, :as => :receivable
  has_many :messages, :class_name => "Message", :foreign_key => "sender_id"
end
