class Message < ApplicationRecord
  belongs_to :receivable, :polymorphic => true
  belongs_ro :sender, :class_name => "User"
end
