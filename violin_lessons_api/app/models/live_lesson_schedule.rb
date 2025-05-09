class LiveLessonSchedule < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :teacher, class_name: "User"

  validates :start_time, presence: true
  validates :end_time, presence: true
end
