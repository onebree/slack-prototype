class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, :presence => true

  def mentions
    body.scan(/@(#{User::NAME_REGEX})/).flatten.map do |username|
      User.find_by(:username => username)
    end.compact
  end
end
