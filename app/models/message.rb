class Message < ApplicationRecord
  belongs_to :receivable, :polymorphic => true
  belongs_to :sender, :class_name => "User"

  before_save :compile

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  validates :body, :presence => true

  def compile
    write_attribute(:compiled_body, Kramdown::Document.new(body).to_html)
  end
end
