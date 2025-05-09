class User < ApplicationRecord
  has_secure_password


  has_many :progresses
  has_many :forum_topics
  has_many :forum_posts
  has_many :scheduled_lessons, class_name: "LiveLessonSchedule", foreign_key: "student_id"
  has_many :given_lessons, class_name: "LiveLessonSchedule", foreign_key: "teacher_id"

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
