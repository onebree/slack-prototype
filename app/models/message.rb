class Message < ApplicationRecord
  belongs_to :receivable, :polymorphic => true
  belongs_to :sender, :class_name => "User"

  before_save :compile

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  validates :body, :presence => true

  def compile
    emojified_body = emojify(body)
    write_attribute(:compiled_body, Kramdown::Document.new(emojified_body).to_html)
  end

  def emojify(text)
    text.to_s.gsub(/:([\w+-]+):/) do |match|
      if (emoji = Emoji.find_by_alias($1))
        path = "/images/emoji/#{emoji.image_filename}"
        %(<img class="emoji" alt="#$1" src="#{path}" width="20" height="20" />)
      else
        match
      end
    end
  end
end
