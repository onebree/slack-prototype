class Message < ApplicationRecord
  attachment :file

  belongs_to :user
  belongs_to :room

  validates :body, :presence => true, :if => Proc.new { |m| m.file.nil? }

  def mentions
    body.scan(/@(#{User::NAME_REGEX})/).flatten.map do |username|
      User.find_by(:username => username)
    end.compact
  end
end
