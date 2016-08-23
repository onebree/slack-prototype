class Message < ApplicationRecord
  belongs_to :receivable, :polymorphic => true
  belongs_to :sender, :class_name => "User"
end
