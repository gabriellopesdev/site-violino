class ForumPost < ApplicationRecord
  belongs_to :forum_topic
  belongs_to :user

  validates :content, presence: true
end
