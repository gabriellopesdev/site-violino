class ForumTopic < ApplicationRecord
  belongs_to :user
  has_many :forum_posts
end
